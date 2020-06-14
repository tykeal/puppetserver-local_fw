# ::local_fw::pre
class local_fw::pre {
  Firewall {
    require => undef,
  }

  # Default firewall rules that everything uses
  firewall { '000 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
  firewall { '001 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }
  firewall { '002 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  # Default IPv6 rules
  firewall { '000 accept related established rules v6':
    proto    => 'all',
    provider => 'ip6tables',
    state    => ['RELATED', 'ESTABLISHED'],
    action   => 'accept',
  }
  firewall { '001 accept all icmp v6':
    proto    => 'icmp',
    provider => 'ip6tables',
    action   => 'accept',
  }
  firewall { '002 accept all to lo interface v6':
    proto    => 'all',
    provider => 'ip6tables',
    iniface  => 'lo',
    action   => 'accept',
  }
}
