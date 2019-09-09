class lzabagent::firewall {

	package { 'firewalld':
  	ensure   => 'present',
		}
	
	service { 'firewalld':
  	ensure  => 'running',
  	enable  => 'true',
	require => Package['firewalld']
		}
	
        exec {'firewall.port':
        user => root,
        path => "/usr/bin:/usr/sbin:/bin",
        command => 'firewall-cmd --permanent --add-port={10050/tcp,10051/tcp} && firewall-cmd --reload',
	require => Service['firewalld']
                }

	}

