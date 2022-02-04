# README

$ rails new cat-tinder-backend -d postgresql -T
$ cd cat-tinder-backend
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
Add the remote from your GitHub classroom repository
Create a default branch (main)
Make an initial commit to the repository
$ rails server


$ rails generate resource Cat name:string age:integer enjoys:text image:text
$ rails db:migrate

$ rspec spec