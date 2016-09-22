#Smartups
Smartups is a platform where everyone can find collaborators for their ideas, projects and even their startups.

The project is not completed and development has ended. You are free to create pull requests or fork the project.

*This project is licensed under the terms of the GNU GPLV3 License*


## Download and Run

* ```git clone https://github.com/sotirelisc/smartups```
 
* ```cd smartups```

* ```bundle install```

* ```rake db:migrate```

* ```rake db:seed```

You can use Cloud9 (online IDE) for Smartups development to avoid installing Ruby/Rails on your system (issues occur on Windows).


### Install MiniMagick on your system

To enable image resizing, MiniMagick needs to be installed on your system or Cloud9 using ```sudo apt-get update```
and then ```sudo apt-get install imagemagick --fix-missing```, or your system's specific commands.

### Run in development

To run Smartups in development use ```rails s``` on your system, or ```ruby s.rb``` on Cloud9.
