#! /bin/bash
#load environment variables
source /var/.cloud66_env
#assign desired permissions
sudo chmod 0777 -R $RAILS_STACK_PATH/public/uploads
rackup faye.ru -s thin -E production