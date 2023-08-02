# LaraVellous

## Overview
LaraVellous is a template for Laravel applications.

## Run Locally

Clone the project

```bash
git clone git@github.com:angus-boilerplates/LaraVellous.git
```

Go to the project directory

```bash
cd LaraVellous
```

Setup Laravel Sail

**_NOTE:_**  Ensure you have Docker installed

```bash
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):/var/www/html \
    -w /var/www/html \
    laravelsail/php81-composer:latest \
    composer install --ignore-platform-reqs
```

Generate a .env file

```bash
cp .env.example .env
```
Run Laravel Sail (Development server)

```bash
./vendor/bin/sail up
```

**Open a new Terminal tab in the same project root folder**

Generate an app encryption key

```bash
./vendor/bin/sail php artisan key:generate
```

Migrate the database

```bash
./vendor/bin/sail php artisan migrate
```

Run Vite

```bash
./vendor/bin/sail npm run dev
```

Visit [Localhost](http://localhost/)

## Configuration

| Variable Name      | Purpose                               | Accepted Values   | Default Value |
| ------------------ | ------------------------------------- | ----------------- | ------------- |
| SHOW_LOGIN_BUTTON  | Visibility of the login button         | true, false       | true          |
| ADMIN_NAME         | Name of the admin user                 | String            | -             |
| ADMIN_EMAIL        | Email of the admin user                | String            | -             |
| ADMIN_PASSWORD     | Password for the admin user            | String            | -             |


## Tips

When updating certain fields in the `.env` file when using Laravel Sail, you may need to restart the Docker container for changes to take affect.


## Authors

- [@angusgoody](https://github.com/angusgoody)

