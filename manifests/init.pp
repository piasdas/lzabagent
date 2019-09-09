class lzabagent{

        yumrepo {'zabbix':
                baseurl => 'http://repo.zabbix.com/zabbix/4.2/rhel/7/$basearch/',
                gpgcheck => true,
                gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX-A14FE591',
                enabled => true,
                before => Package['zabbix-agent']
                }

        package {'zabbix-agent':
                ensure => present,
		provider => 'yum',
                }

        service {'zabbix-agent':
                ensure => running,
                enable => true,
                require => Package['zabbix-agent']
                }

     include lzabagent::firewall
     include lzabagent::template
	
        }


