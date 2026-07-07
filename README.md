# Mercantile Hub

Mercantile Hub is a Ruby on Rails e-commerce and storefront management application. It provides a public-facing product catalog for shoppers, account management for registered users, named wishlists, product restock subscriptions, and a protected store administration area for managing products, users, wishlists, and subscribers.

The application is built with Rails 8, Hotwire, Sidekiq, Active Storage, and Action Text. For local development it uses SQLite by default, while production is configured for MySQL.

## Features

### Customer-facing features

- Browse a public product catalog from the home page.
- Search products by name using keyword matching.
- View individual product detail pages.
- Create an account and sign in securely.
- Reset passwords through email-based recovery.
- Manage a personal account profile, email address, and password.
- Delete an account from the settings area.
- Create and manage multiple named wishlists.
- View public wishlist pages by wishlist name.
- Subscribe to product updates or restock notifications by email.
- Unsubscribe from product email notifications through tokenized links.

### Store administration features

- Access a protected store dashboard under `/store`.
- Manage products with create, edit, show, and delete workflows.
- Upload a featured image for products using Active Storage.
- Edit rich product descriptions using Action Text.
- Manage registered users.
- Review and manage wishlists.
- Review and manage product subscribers.
- Access Sidekiq Web for background job monitoring.

### Platform and technical features

- Rails 8 application structure.
- Hotwire with Turbo and Stimulus.
- Importmap-based JavaScript setup.
- Sidekiq-backed background jobs.
- Solid Cache and Solid Cable support.
- Dockerfile and Kamal deployment tooling.
- Local utility gem mounted from `./my_utility`.

## Tech Stack

- Ruby
- Ruby on Rails 8
- SQLite for development and test
- MySQL for production
- Sidekiq for background jobs
- Active Storage for image uploads
- Action Text for rich text product descriptions
- Hotwire (Turbo + Stimulus)
- Propshaft for assets

## Project Structure

- `app/controllers` contains public, settings, and store/admin controllers.
- `app/models` contains products, users, wishlists, sessions, and subscribers.
- `app/views` contains the storefront, authentication, settings, mailer, and admin UI templates.
- `config/routes.rb` defines the public catalog, authentication flows, wishlists, settings, and `/store` admin namespace.
- `my_utility/` contains the local gem used by the application.

## Requirements

Before running the app locally, make sure you have the following installed:

- Ruby compatible with the Gemfile and Rails 8 setup
- Bundler
- SQLite

Optional for production-like work:

- MySQL
- Redis, if your Sidekiq setup in your environment expects it

## Local Development Setup

### 1. Install dependencies

```sh
bundle install
```

### 2. Prepare the database

```sh
bin/rails db:prepare
```

This project uses SQLite by default in development and test, so no MySQL setup is required for a normal local run.

### 3. Start the application

```sh
bin/dev
```

In this repository, `bin/dev` starts the Rails server directly.

You can also use the setup script to install dependencies, prepare the database, clear temp files, and start the server:

```sh
bin/setup
```

### 4. Open the app

Visit:

```text
http://localhost:3000
```

## Database Configuration

### Development and test

- Development uses SQLite at `db/development.sqlite3` by default.
- Test uses SQLite at `db/test.sqlite3` by default.

### Production

Production is configured for MySQL using these environment variables:

- `DB_USERNAME`
- `DB_PASSWORD`
- `DB_HOST`
- `DB_PORT`
- `DB_NAME_PRODUCTION`
- `DB_NAME_PRODUCTION_CACHE`
- `DB_NAME_PRODUCTION_QUEUE`
- `DB_NAME_PRODUCTION_CABLE`

MySQL-style fallback variable names are also supported:

- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_HOST`
- `MYSQL_PORT`

## Authentication and Authorization

- User accounts are created through the sign-up flow.
- Session-based authentication is used for sign-in and sign-out.
- Password reset is available through tokenized email links.
- Email address changes trigger a confirmation email flow.
- The `/store` namespace is reserved for admin-only access.

## Background Jobs

The app uses Sidekiq for background processing. Sidekiq Web is mounted at:

```text
/sidekiq
```

If you are testing features that enqueue mailers or other asynchronous work, ensure your job processing setup is running in the target environment.

## File Uploads and Rich Content

- Product featured images are handled with Active Storage.
- Product descriptions support rich text through Action Text.

If you are adding or editing products through the admin area, make sure your local environment is configured to support file uploads normally used by Rails.

## Running Tests

Run the test suite with:

```sh
bin/rails test
```

If you need to run a specific test file:

```sh
bin/rails test test/models
bin/rails test test/controllers
```

## Helpful Development Commands

```sh
bin/setup
bin/dev
bin/rails server
bin/rails console
bin/rails db:prepare
bin/rails test
bin/rubocop
bin/brakeman
bin/bundler-audit
```

## Deployment Notes

- A `Dockerfile` is included for container-based deployment workflows.
- Kamal is included for deployment orchestration.
- Production expects MySQL databases for the primary, cache, queue, and cable connections.

Review `config/deploy.yml`, `Dockerfile`, and the environment-specific configuration files before deploying.

## Main Routes

- `/` - public product catalog
- `/products` - browse products
- `/products/:id` - product details
- `/sign_up` - account registration
- `/session/new` - sign in
- `/passwords/new` - password reset request
- `/wishlists` - logged-in user wishlist management
- `/settings` - account settings area
- `/store` - admin/store management area
- `/sidekiq` - Sidekiq dashboard

## Health Check

The application exposes a health endpoint at:

```text
/up
```

This can be used by deployment platforms and load balancers to verify that the application is running.

## Security and Quality Tooling

The repository includes:

- RuboCop for style checks
- Brakeman for Rails security scanning
- bundler-audit for dependency vulnerability scanning

## Summary

Mercantile Hub is a Rails-based storefront and store-management platform that combines catalog browsing, user accounts, wishlists, subscriptions, and admin workflows in a single application. It is set up for straightforward local development with SQLite and is prepared for production deployment with MySQL, Sidekiq, and container tooling.
