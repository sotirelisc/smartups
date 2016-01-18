# User associated posts will be automatically deleted.
User.delete_all

# Setup demo user.
user = User.new(:first_name => "Chris", :last_name => "Sotirelis", :email => "admin@smartups.io", :password => "123456789")
# user.skip_confirmation!
user.save!

user2 = User.new(:first_name => "Zach", :last_name => "Mitzelos", :email => "rick@smartups.io", :password => "123456789")
# user2.skip_confirmation!
user2.save!

# Setup demo posts.
post1 = user.posts.new(:user_id => user.id, :title => "Santa Claus", :content => "Cause Santa Claus is coming to town!")
# Deliberately skip skills validation, to add them afterwards.
post1.skip_skills_validation = true
post1.skill_list.add "javascript"
post1.skill_list.add "nodejs"
post1.save!

post2 = user.posts.new(:user_id => user.id, :title => "Smartups Platform", :content => "Innovate, lead, collaborate.")
post2.skip_skills_validation = true
post2.skill_list.add "ruby"
post2.skill_list.add "rails"
post2.skill_list.add "javascript"
post2.save!

user2.interests.create!(user_id: user2.id, post_id: post1.id)
post1.user.notifications.create!(text: "is interested in", user_id: user2.id, post_id: post1.id)