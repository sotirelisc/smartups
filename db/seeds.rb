# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
user = User.new(:first_name => "Admin", :last_name => "Administrator", :email => "admin@smartups.io", :password => Devise.friendly_token[0,20])
# user.skip_confirmation!
user.save!

post1 = user.posts.build(:title => "Test title 1", :content => "Test content 1", :looking_for => "Developers")
post1.save!
post2 = user.posts.build(:title => "Test title 2", :content => "Test content 2", :looking_for => "Designers")
post2.save!