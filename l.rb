# Simple script to download and setup repo.
require 'io/console'

# Username is provided from the git configurations.
username = %x[git config --global user.name].chomp
print "Password: "
password = STDIN.noecho(&:gets).chomp
system "git clone https://#{username}:#{password}@github.com/sotirelisc/smartups.git"
Dir.chdir("smartups")
system "bundle && rake db:migrate && rake db:seed"