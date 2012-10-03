working_directory "/var/www/[storename]"
pid "/var/www/[storename]/tmp/pids/unicorn.pid"
stderr_path "/var/www/[storename]/log/unicorn.log"
stdout_path "/var/www/[storename]/log/unicorn.log"

listen "/tmp/unicorn.todo.sock"
worker_processes 2
timeout 30