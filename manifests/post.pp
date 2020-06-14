# make sure rules in this class define before => undef

class local_fw::post {
  # ipv4
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

  # ipv6
  firewall { '999 deny all other INPUT requests v6':
    chain    => 'INPUT',
    proto    => 'all',
    provider => 'ip6tables',
    action   => 'reject',
    reject   => 'icmp-host-prohibited',
    before   => undef,
  }
  
  firewall { '999 deny all other FORWARD requests v6':
    chain    => 'FORWARD',
    proto    => 'all',
    provider => 'ip6tables',
    action   => 'reject',
    reject   => 'icmp-host-prohibited',
    before   => undef,
  }
}
