# User associated posts will be automatically deleted.
User.delete_all

# Setup demo user.
user = User.new(:first_name => "Admin", :last_name => "Administrator", :email => "admin@smartups.io", :password => "123456789")
# user.skip_confirmation!
user.save!

# Setup demo posts.
post1 = User.first.posts.new(:user_id => User.first.id, :title => "Santa Claus", :content => "Cause Santa Claus is coming to town!")
# Deliberately skip skills validation, to add them afterwards.
post1.skip_skills_validation = true
post1.skill_list.add "javascript"
post1.skill_list.add "nodejs"
post1.save!

post2 = User.first.posts.new(:user_id => User.first.id, :title => "Smartups Platform", :content => "Innovate, lead, collaborate.")
post2.skip_skills_validation = true
post2.skill_list.add "ruby"
post2.skill_list.add "rails"
post2.skill_list.add "javascript"
post2.save!