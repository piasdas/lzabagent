class lzabagent::template{

        file { '/etc/zabbix/zabbix_agentd.conf':
        ensure  => file,
        content => template('lzabagent/lzabagent.conf.erb'),
}
}

