# ::local_fw::pre
class local_fw::pre {
  Firewall {
    require => undef,
  }

  # Default firewall rules that everything uses
  firewall { '000 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    jump   => 'accept',
  }
  firewall { '001 accept all icmp':
    proto  => 'icmp',
    jump   => 'accept',
  }
  firewall { '002 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    jump    => 'accept',
  }

  # Default IPv6 rules
  firewall { '000 accept related established rules v6':
    proto    => 'all',
    protocol => 'ip6tables',
    state    => ['RELATED', 'ESTABLISHED'],
    jump     => 'accept',
  }
  firewall { '001 accept all icmp v6':
    proto    => 'ipv6-icmp',
    protocol => 'ip6tables',
    jump     => 'accept',
  }
  firewall { '002 accept all to lo interface v6':
    proto    => 'all',
    protocol => 'ip6tables',
    iniface  => 'lo',
    jump     => 'accept',
  }
}
