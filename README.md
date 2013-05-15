##Description
Included in these files is a script that modifies three other template files so that you can easily configure unicorn and nginx for your rails installation.

###Requirements
Ubuntu 12.04 or greater
Nginx installed
sed is installed

###Usage:
cd [config folder location of your store] (i.e: cd ~/apps/mystore)
     $ sh assign_storename.sh
          
     Your Store folder name (i.e.: mystore) :mystore
     The path to your store (i.e. : /var/www/) : /Users/ctsimpson/apps/
     Domain names you want this store to respond to:www.mystore.com mystore.com

`inspect assign_storename.sh to verify the updates that it should have made and to confirm the symbolic links that were supposed to be created.
