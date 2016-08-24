1) First install Rails 5

    gem install rails -v5

2) Create API only app

    rails new rails-api-app --api

> Difference in rails app and api only app

    rake middleware
    use Rack::Sendfile
    use ActionDispatch::Static
    use ActionDispatch::Executor
    use ActiveSupport::Cache::Strategy::LocalCache::Middleware
    use Rack::Runtime
    use ActionDispatch::RequestId
    use Rails::Rack::Logger
    use ActionDispatch::ShowExceptions
    use ActionDispatch::DebugExceptions
    use ActionDispatch::RemoteIp
    use ActionDispatch::Reloader
    use ActionDispatch::Callbacks
    use ActiveRecord::Migration::CheckPending
    use Rack::Head
    use Rack::ConditionalGet
    use Rack::ETag
    run RailsApiApp::Application.routes
    --------------------------------------------------------------
    use #<ActiveSupport::Cache::Strategy::LocalCache::Middleware:0x007fa7511b02b0>
    use Rack::MethodOverride
    use WebConsole::Middleware
    use ActionDispatch::Cookies
    use ActionDispatch::Session::CookieStore
    use ActionDispatch::Flash

3) Creating the user model
```
$ rails g model user email:string password_hash:string password_salt:string
      invoke  active_record
      create    db/migrate/20160824072946_create_users.rb
      create    app/models/user.rb
      invoke    test_unit
      create      test/models/user_test.rb
      create      test/fixtures/users.yml
```
```
$ rake db:migrate
== 20160824072946 CreateUsers: migrating ============================
-- create_table(:users)
   -> 0.0047s
== 20160824072946 CreateUsers: migrated (0.0051s) ==================
```
> `has_secure_password` is part of the `bcrypt` gem, so we have to install it first.

     #Gemfile.rb
     gem 'bcrypt', '~> 3.1.7'

With the gem installed, the method can be included in the model:

    #app/user.rb
    class User < ApplicationRecord
      has_secure_password
    end

4) Encoding and decoding JWT tokens
>
     #Gemfile
     gem 'jwt'
> Creating Post resource

    $ rails g model post title:string body:text user:references
    
          invoke  active_record
          create    db/migrate/20160824121349_create_posts.rb
          create    app/models/post.rb
          invoke    test_unit
          create      test/models/post_test.rb
          create      test/fixtures/posts.yml
    
    $ rake db:migrate
    == 20160824121349 CreatePosts: migrating ============================
    -- create_table(:posts)
       -> 0.0293s
    == 20160824121349 CreatePosts: migrated (0.0296s) ===================
