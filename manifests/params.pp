# Class: rhcs::params
#
# This class defines default parameters used by the main module class rhcs
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to rhcs class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class rhcs::params {

  $ricci_password = '$1$am6eJ020$owCyQGVLLcHwbrzkDcOvN.'

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => [ 'cman' , 'rgmanager' , 'ricci' ],
  }

  $service = $::operatingsystem ? {
    default => 'cman',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'corosync',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/cluster',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/cluster/cluster.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0640',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/cman',
    default                   => '/etc/sysconfig/cman',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/cman.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/rhcs',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/cluster',
  }

  $log_file = $::operatingsystem ? {
    default => [ '/var/log/cluster/rgmanager.log','/var/log/cluster/corosync.log']
  }

  $port = '11111'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
