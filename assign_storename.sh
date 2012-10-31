STORE_NAME=""

while true; do
    read -p "Your Store folder name (i.e.: mystore) :" STORE_NAME
	break;
done

echo "Updating config files"
find . -name ":q!nginx.conf" -exec sed -i "s/\[storename\]/$STORE_NAME/g" '{}' \;
find . -name "unicorn*" -exec sed -i "s/\[storename\]/$STORE_NAME/g" '{}' \;

echo "Creating Symbolic links"
ln -s /var/www/$STORE_NAME/config/nginx.conf $STORE_NAME
ln -s /var/www/$STORE_NAME/config/unicorn_init.sh unicorn_$STORE_NAME

echo "Completed"