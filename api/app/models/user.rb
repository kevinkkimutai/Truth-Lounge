class User < ApplicationRecord
    has_secure_password
   
# Define the manager-employee relationship
has_many :employees, class_name: 'User', foreign_key: 'manager_id'
belongs_to :manager, class_name: 'User', optional: true

# Define the CEO-manager relationship
belongs_to :ceo, class_name: 'User', optional: true
has_many :managers, class_name: 'User', foreign_key: 'ceo_id'

  # Validations
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validates :role, presence: true, inclusion: { in: %w(CEO Manager Employee) }

  # Callbacks
  before_save :downcase_email

   # Custom methods
   def ceo?
    role == 'CEO'
  end

  def manager?
    role == 'Manager'
  end

  def employee?
    role == 'Employee'
  end


  def generate_reset_password_token
      self.reset_password_token = SecureRandom.urlsafe_base64
      self.reset_password_token_expires_at = 1.hour.from_now
  end
    
  def reset_password_token_valid?
    reset_password_token.present? && reset_password_token_expires_at.present? && reset_password_token_expires_at > Time.now
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
  
  def password_required?
    new_record? || password.present?
  end
end