function ntp::data(){
 
  $base_params = {
   'ntp::package_name'     => 'ntp',
   'ntp::package_ensure'   => present,
   'ntp::config_name'      => 'ntp.conf',
   'ntp::config_file_mode' => '0644',
   'ntp::servers'          => ['0.centos.pool.ntp.org', '1.centos.pool.ntp.org'],
   'ntp::service_ensure'   => 'running',
   'ntp::service_enable'   => true, 
   'ntp::service_hasrestart'       => true,
   'ntp::service_hasstatus'        => true,
  }

  case $facts['os']['family'] {
    'Debian': {
       $os_params = {
         'ntp::service_name' => 'ntp',
       }
    }
    default: {
      $os_params = {
        'ntp::service_name' => 'ntpd',
      }
    }
  }
  
  $base_params + $os_params
}
