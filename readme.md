# Ruby and Microsoft SQL Server Demo

Install Ruby with DevKit
rubyinstaller-devkit-2.5.7-1-x64
https://rubyinstaller.org/downloads/
Choose MSYS2 base instalation when asked

In the command line run to install [sinatra](https://github.com/sinatra/sinatra)
```
gem install sinatra
```

In the command line run to install [tiny_tds](https://github.com/rails-sqlserver/tiny_tds)
```
gem install tiny_tds
```

In the windows services start the SQL Server Browser service

Search in the start menu for **SQLServerManager14.msc** and run it

Enable tcp/ip and named pipes protocols for SQLEXPRESS

In **SQL Server Management Studio** create a database named jm_players

Download this repo to your local machine and open it in sublime

Copy from sublime schema.sql and populate.sql and execute these files in the database jm_players

In sublime change app.rb dataserver to be the same that appears in sql server management studio

Run in the command line (needs to be in the root of the project folder)
```
ruby app.rb
```