# Overview

This is a simple calorie planning site.

## Usage

### Docker

#### Build

```
$ docker build -t calories .
```

#### Run

##### Development

```
make run
```

This will run the container in the foreground. If you would like to run this as a background job, remove the `-i` argument and hit CTRL+C to break out of the container output.

##### Production

Production requires a SECRET_KEY_BASE to be provided as an environment variable. This can be generated with `rails secret`.

```
$ docker run -i -e RAILS_ENV=production -e SECRET_KEY_BASE=whatever -p 3000:3000 --name calories -t calories
```

In production, there are no users or admins by default, so you will need to create the first admin user:

```
$ docker exec -it calories /bin/bash -c 'rails c'
> AdminUser.create!(email: 'matthew.parlette@gmail.com', password: 'password', password_confirmation: 'password')
```
