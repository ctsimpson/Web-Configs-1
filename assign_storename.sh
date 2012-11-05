STORE_NAME=""
DOMAIN_NAMES=""

while true; do
    read -p "Your Store folder name (i.e.: mystore) :" STORE_NAME
        break;
done

while true; do
    read -p "Domain names you want this store to respond to:" DOMAIN_NAMES
        break;
done

echo "Updating config files"
find . -name "nginx.conf" -exec sed -i "s/\[storename\]/$STORE_NAME/g" '{}' \;
find . -name "nginx.conf" -exec sed -i "s/\[domain-names\]/$DOMAIN_NAMES/g" '{}' \;
find . -name "unicorn*" -exec sed -i "s/\[storename\]/$STORE_NAME/g" '{}' \;

echo "Creating Symbolic links"
rm -rf /etc/nginx/sites-enabled/default
ln -s /var/www/$STORE_NAME/config/nginx.conf /etc/nginx/sites-enabled/$STORE_NAME
ln -s /var/www/$STORE_NAME/config/unicorn_init.sh /etc/init.d/unicorn_$STORE_NAME

echo "Updating permissions"
chmod -R 775 /var/www/$STORE_NAME

echo "Generate Binstubs"
cd /var/www/$STORE_NAME
bundle install --binstubs

echo "Completed"