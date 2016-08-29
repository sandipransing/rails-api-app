# Rails 5 api only app

This rails 5 api only app will help to get started with rails api's in no time.
This app includes JWT based user authentication along-with setup for swagger 2.0 documentation for rails api's.

Things to do before launching:

* Git clone
```
git clone https://github.com/sandipransing/rails-api-app.git
```
* GEM Bundle
```
bundle install
```
* Migrations
```
rake db:migrate
```
* Starting Server
```
rails s
```
* Create sample user 
```
User.create!(email: 'example@mail.com' , password: '212121')
```

* Documentation 

[http://localhost:3000/swagger/dist/index.html?url=/apidocs](http://localhost:3000/swagger/dist/index.html?url=/apidocs)
