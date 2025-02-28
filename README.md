# Train ticket search app

This is a train ticket booking application where users can search for train tickets and purchase them. Once a ticket is bought, it will be available in the user's profile, where they can download it as a PDF.

<p align="center">
  <img src="https://github.com/user-attachments/assets/555d4357-7cf2-481a-b3d8-f58d8cf81c20">
</p>

### Features

- **User functionality:**
  - Search for train tickets
  - Purchase train tickets
  - View purchased tickets in the profile
  - Download tickets as PDF

- **Admin panel:**
  - Create and manage routes
  - Create and manage stations
  - Create and manage trains
  - Manage all user tickets

## Installation

Ensure you have Ruby and Bundler installed. Then, install the required gems:

```sh
bundle install
```

Install JavaScript dependencies:

```sh
yarn install
```

Set up the database:

```sh
rails db:create db:migrate db:seed
```

## Running the Application

To start the application, run:

```sh
rails s
```

By default, the application will be available at `http://localhost:3000`.

## Admin Panel Access

To access the admin panel, use the following credentials:

- **Email:** admin@gmail.com
- **Password:** 123321

