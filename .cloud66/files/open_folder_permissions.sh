#! /bin/bash
#load environment variables
source /var/.cloud66_env
#assign desired permissions
sudo chmod 0777 -R $RAILS_STACK_PATH/public/uploads
rackup $RAILS_STACK_PATH/faye.ru -s thin -E production