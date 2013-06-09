#! /bin/bash
#load environment variables
source /var/.cloud66_env
#assign desired permissions
sudo chmod 0775 -R $RAILS_STACK_PATH/public/uploads
sudo chmod 0775 -R $RAILS_STACK_PATH/public/uploads/tmp