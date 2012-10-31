STORE_NAME=""

while true; do
    read -p "Your Store folder name (i.e.: mystore) :" STORE_NAME
	break;
done

echo "Updating config files"
find . -name "nginx.conf" -exec sed -i "s/\[storename\]/$STORE_NAME/g" '{}' \;
find . -name "unicorn*" -exec sed -i "s/\[storename\]/$STORE_NAME/g" '{}' \;

echo "Completed"