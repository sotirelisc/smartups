# User associated posts will be automatically deleted.
User.delete_all

# Setup demo user.
chris = User.new(:first_name => "Chris", :last_name => "Sotirelis", :email => "admin@smartups.io", :password => "123456789")
# chris.skip_confirmation!
chris.save!

zach = User.new(:first_name => "Zach", :last_name => "Mitzelos", :email => "rick@smartups.io", :password => "123456789")
# zach.skip_confirmation!
zach.save!

# Setup demo posts.
post1 = user.posts.new(:user_id => chris.id, :title => "Santa Claus", :content => "Cause Santa Claus is coming to town!")
# Deliberately skip skills validation, to add them afterwards.
post1.skip_skills_validation = true
post1.skill_list.add "javascript"
post1.skill_list.add "nodejs"
post1.save!

post2 = user.posts.new(:user_id => chris.id, :title => "Smartups Platform", :content => "Innovate, lead, collaborate.")
post2.skip_skills_validation = true
post2.skill_list.add "ruby"
post2.skill_list.add "rails"
post2.skill_list.add "javascript"
post2.save!

Interest.delete_all
Notification.delete_all

zach.interests.create!(post_id: post1.id)

# TODO: Fix notifications
post1.user.notifications.create!(text: "is interested in", user_id: user2.id, post_id: post1.id)