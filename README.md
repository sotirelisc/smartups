You can use Cloud9 (online IDE) for PCV development to avoid installing Ruby/Rails on your system (issues occur on Windows).

## Install MiniMagick on your system

To enable image resizing, MiniMagick needs to be installed on your system or Cloud9 using ```sudo apt-get update```
and then ```sudo apt-get install imagemagick --fix-missing```.

## Run in development

To run PCV in development use ```rails s``` on your system, or ```ruby s.rb``` on Cloud9.