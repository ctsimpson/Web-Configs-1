##Description
Included in these files is a script that modifies three other template files so that you can easily configure unicorn and nginx for your rails installation.

###Requirements
* Ubuntu 12.04 or greater
* Nginx installed
* sed is installed

###Usage:
1. From your config folder location
2. Clone this repo
3. git clone https://github.com/ctsimpson/Web-Configs-1.git

4. Run the install script

Linux 

     $ sh assign_storename.sh
     
 Mac OS X

     $ sh assign_storename_mac.sh

Follow the prompts

     Your Store folder name (i.e.: mystore) :mystore
     The path to your store (i.e. : /var/www/) : /Users/ctsimpson/apps/
     Domain names you want this store to respond to:www.mystore.com mystore.com

`inspect assign_storename.sh to verify the updates that it should have made and to confirm the symbolic links `
`that were supposed to be created.`
