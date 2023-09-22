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

# MIT License

Copyright (c) 2023 `Kelvin Kimutai`

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Author
This repository is maintained by:

- [Kelvin Kimutai](https://www.github.com/kevinkkimutai) 