# Survey Tool

A simple survey application built with Ruby on Rails that allows users to create and respond to yes/no surveys.

## Requirements

* Ruby 3.2
* Rails 7.1.2
* SQLite3

## Setup
1. Install the dependencies:

    ```
    bundle install
    ```

2. Setup the database
    ```
    rails db:create
    rails db:migrate
    ```

3. Start the Rails server:

    ```
    railse server
    ```

## Features

* Create yes/no surveys with single questions
* Respond to surveys multiple times
* View survey results with response percentages
* Track response timestamps
* Basic user stubbing for future authentication implementation