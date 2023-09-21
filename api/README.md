# Getting Started

Follow these instructions to set up the Truth Lounge Management App on your local development environment.

## Prerequisites
Before you begin, make sure you have the following installed:

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![sqlite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)

- **Ruby `v2.7.4`**
- **Rails `v7.0.4`**
- **SQlite3 `v1.4`**
- **ActiveRecord `v7.0.4`**
- **Puma `v6.1`**
- **Bcrypt `v3.1.7`**

## Installation

To use this repo on your machine requires some simple steps

### Alternative One

- Open a terminal / command line interface on your computer
- Clone the repo by using the following:

        git@github.com:kevinkkimutai/Truth-Lounge.git

- Be patient as it creates a copy on your local machine for you.


### Alternative Two

- On the top right corner of this page there is a button labelled ``Fork``.
- Click on that button to fork the repo to your own account.
- Take on the process in ``Alternative One`` above.
- Remember to replace your username when cloning.

        git@github.com:kevinkkimutai/Truth-Lounge.git


## Create Database
```
rails db:create
```

## Configuration
Configure environment variables:

-   Create a .env file in the project root and add the necessary environment variables. For example:

``.env``

```
SECRET_KEY_BASE=your_secret_key
DATABASE_URL=your_database_url
Modify these variables according to your setup.
```

## Running the application
Running the application is very straight forward. You can use the following steps to run the app.

1. Ensure the ruby gems are setup in your machine
    ```{shell}
   bundle install
   ```
2. Perform any pending database migrations  and seeding
   ```{shell}
   rails db:migrate
   ```
3. Run the application
    ```{shell}
    rails server
    ```
4. Open the application from your browser
    ```
   http://localhost:3000
   ```

## Usage
-   Visit http://localhost:3000 in your web browser to access the application.
-   Register as a CEO, Manager, or Employee.
-   Log in with your credentials.
-   Explore and use the various features based on your role.
