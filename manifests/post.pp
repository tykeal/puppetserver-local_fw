# make sure rules in this class define before => undef

class local_fw::post {
  firewall { '999 deny all other INPUT requests':
    chain  => 'INPUT',
    proto  => 'all',
    action => 'reject',
    reject => 'icmp-host-prohibited',
    before => undef,
  }
  
  firewall { '999 deny all other FORWARD requests':
    chain  => 'FORWARD',
    proto  => 'all',
    action => 'reject',
    reject => 'icmp-host-prohibited',
    before => undef,
  }
}
