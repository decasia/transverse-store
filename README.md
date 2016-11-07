# Transverse Store project

A Ruby on Rails back end for the Transversions collaborative writing project

The front end is at http://github.org/diglibarts/transverse

## Credits

Copyright (C) 2016 Whittier College

Written at [Whittier Digital Liberal Arts Center](http://diglibarts.whittier.edu/) by [Eli Thorkelson](http://decasia.org/).

## What does it do?

This project provides data storage and session management. All data is transferred via [JSON API](http://jsonapi.org), authenticated by session-specific [JSON Web Tokens](https://jwt.io/). Since this project is intended for use in an educational environment, initial user login is primarily via [IMS LTI](https://www.imsglobal.org/activity/learning-tools-interoperability), specifically the [ims-lti gem](https://github.com/instructure/ims-lti). (The application can handle local accounts as well, if necessary.)

## How to use

### Technical requirements

The project requires Ruby 2.2+, MySQL, and a functioning Rails hosting environment. We currently use Passenger through [ReclaimHosting](http://www.reclaimhosting.com) but the project can probably run on other Ruby environments (e.g. Heroku) with appropriate tweaks to the deploy configuration.

### Configuration

All environment-specific configuration is stored in a [.env file](https://github.com/bkeepers/dotenv). You should define the following variables in your .env file:

**Capistrano deployment settings**

- DEPLOY_REPO - a valid git remote path
- PROD_ENV - a path to the .env file in your production environment
- PROD_SERVER - hostname to deploy to
- PROD_USER - user to deploy to
- PROD_DEPLOY_TO - path to deploy to
- PROD_TMP_DIR - temp dir to deploy to (this makes shared ruby hosting usable)

**App-specific settings**

- SECRET_KEY_BASE - a secret key to encrypt session cookies
- DATABASE_NAME - mysql database name for your environment
- DATABASE_USERNAME - mysql username
- DATABASE_PASSWORD - mysql password
- REDIRECT_ON_LTI_AUTH - where to redirect users who authenticate via LTI integration.

Note on `REDIRECT_ON_LTI_AUTH`: this would normally be a route in the accompanying
Ember application. It should contain the magic string `JWT_VALUE`, which will get
replaced by a valid [JSON Web Token](https://jwt.io/) for authorized users. A good
value for developers is `http://localhost:4200/user/token/JWT_VALUE` (if you run
Ember's standard local dev server).

## Open Source

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
