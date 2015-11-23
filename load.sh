#!/bin/bash
git clone https://$1:$2@github.com/sotirelisc/smartups.git
cd smartups
bundle
rake db:migrate
rake db:seed