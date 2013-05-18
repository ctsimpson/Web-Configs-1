sudo nginx -s stop
pid=`cat [storepath]/unicorn.pid`
kill -QUIT $pid
sleep 3
sudo nginx
unicorn -D -d -E production -c [storepath]/config/unicorn.rb