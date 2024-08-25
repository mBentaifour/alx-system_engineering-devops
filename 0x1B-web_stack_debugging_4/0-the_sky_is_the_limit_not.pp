# Increases the amount of traffic an Nginx server can handle.
# we are getting a huge amount of failed request
# using ApacheBench which is a quite popular tool in the industry

exec {'replace':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exec['restart'],
}

exec {'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
