#! /bin/bash
#load environment variables
source /var/.cloud66_env
#assign desired permissions
sudo chmod 0777 -R $RAILS_STACK_PATH/public/uploads
sudo ln -nfs /var/deploy/anabol/web_head/shared/assets $RAILS_STACK_PATH/public/assets