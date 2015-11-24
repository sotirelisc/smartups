# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user = User.new(:first_name => "Admin", :last_name => "Administrator", :email => "admin@smartups.io", :password => "123456789")
# user.skip_confirmation!
user.save!

post1 = User.first.posts.new(:user_id => User.first.id, :title => "Test title 1", :content => "Test content 1", :looking_for => "Developers").save!
post2 = User.first.posts.new(:user_id => User.first.id, :title => "Test title 2", :content => "Test content 2", :looking_for => "Designers").save!