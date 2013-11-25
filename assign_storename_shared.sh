STORE_PATH=""
STORE_NAME=""
DOMAIN_NAMES=""

while true; do
    read -p "Your Store folder name (i.e.: mystore) :" STORE_NAME
        break;
done

while true; do
     read -p "The path to your store (i.e.: /home/ctsimpson/apps) :" STORE_PATH
          break;
done

while true; do
    read -p "Domain names you want this store to respond to:" DOMAIN_NAMES
        break;
done
echo "************************************"
echo " This script now creates your       "
echo " your binstub files as well         "
echo "************************************"
echo ""
echo ""
echo "Updating config files"
NEW_PATH="$(echo "$STORE_PATH/$STORE_NAME" | sed -e 's/[/&]/\\&/g')"
find . -name "nginx.conf" -exec sed -i "s/\[storepath\]/$NEW_PATH/g" '{}' \;
find . -name "nginx.conf" -exec sed -i "s/\[domain-names\]/$DOMAIN_NAMES/g" '{}' \;
find . -name "unicorn.rb" -exec sed -i "s/\[storepath\]/$NEW_PATH/g" '{}' \;
find . -name "restart_server.sh" -exec sed -i "s/\[storepath\]/$NEW_PATH/g" '{}' \;

echo "Creating Symbolic links"
rm -rf /etc/nginx/sites-enabled/default
ln -nfs $STORE_PATH/shared/config/nginx.conf /etc/nginx/sites-enabled/$STORE_NAME

echo "Updating permissions"
chmod -R 775 $STORE_PATH/$STORE_NAME

echo "Generate Binstubs"
cd  $STORE_PATH/$STORE_NAME

bundle install --binstubs

echo "Completed"