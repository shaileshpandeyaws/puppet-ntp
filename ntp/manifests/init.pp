class ntp(
  String $package_name,
  String $package_ensure,
  String $config_name,
  String $config_file_mode,
  Array[String] $servers,
  String $service_ensure,
  String $service_name,
  Boolean $service_enable,
  Boolean $service_hasrestart,
  Boolean $service_hasstatus,
) {
  class { '::ntp::install': }
  -> class {'::ntp::config': }
  ~> class {'::ntp::service': }

}
