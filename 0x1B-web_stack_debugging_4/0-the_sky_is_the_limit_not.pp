# Increases the amount of traffic an Nginx server can handle.
# we are getting a huge amount of failed request
# using ApacheBench which is a quite popular tool in the industry
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
} ->

# Restart Nginx
exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
