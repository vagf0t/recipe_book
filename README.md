# README

This is a sample application of what could be the basic setup for a *Recipe Book* service. 

### Stack
* Ruby 2.6.6
* Rails 5.0.7.2
* PostgeSQL 12
* React.js 16.9.0

### Arcitecture
The RoR application is provided as a service to external consumers. For the time being, the only endpoint exposed, is *recipes* with indexing and searching actions available. Its API is RESTful, keeping the potential of full CRUD operations for its consumers. Some of its consumers are the React.js components, used to render the list of recipes. *Recipes* and relatied entities are stored in a PostgrSQL database. 

### Database creation
[Install PostgreSQL]:http://postgresguide.com/setup/install.html
Make sure you create a role with the credentials, found in *config/database.yml*, in your PostgreSQL database.

### Deployment instructions
Just make a local copy of the folder of the application, navigate in it and open a terminal. Type:

`rake assets:precompile`

### Database initialization
Type the following:
* `rake db:create`
* `rake db:migrate`
* `rake db:migrate RAILS_ENV=test`
* `rake db:seed`
* `rake db:seed RAILS_ENV=test`

### How to run the test suite
Type:
`bundle exec rspec spec`

### Services (job queues, cache servers, search engines, etc.)
* Start rails server in development environment:
`rails s`
* Visit:
`http://localhost:3000/`
to use the Recipes Book UI
* Perform a GET request to:
`http://localhost:3000/api/recipes`
to use the API endpoint as a service consumer
* Perform a GET request to:
`http://localhost:3000/api/recipes/search/a_string`
to use the API endpoint for searching among the recipes as a service consumer

