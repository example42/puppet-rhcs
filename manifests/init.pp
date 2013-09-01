# = Class: rhcs
#
# This is the main rhcs class.
#
#
# == Parameters
#
# [*ricci_password*]
#   Password for ricci user (used in Luci web interface).
#   Note: It must be provided the hash, as present in /etc/shadow
#   Default: 'ricci'.
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, rhcs class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $rhcs_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, rhcs main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $rhcs_source
#
# [*source_dir*]
#   If defined, the whole rhcs configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $rhcs_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $rhcs_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, rhcs main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $rhcs_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $rhcs_options
#
# [*service_autorestart*]
#   Automatically restarts the rhcs service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $rhcs_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $rhcs_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $rhcs_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $rhcs_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for rhcs checks
#   Can be defined also by the (top scope) variables $rhcs_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $rhcs_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $rhcs_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $rhcs_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $rhcs_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for rhcs port(s)
#   Can be defined also by the (top scope) variables $rhcs_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling rhcs. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $rhcs_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $rhcs_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $rhcs_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $rhcs_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: undef
#
# Default class params - As defined in rhcs::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of rhcs package
#
# [*service*]
#   The name of rhcs service
#
# [*service_status*]
#   If the rhcs service init script supports status argument
#
# [*process*]
#   The name of rhcs process
#
# [*process_args*]
#   The name of rhcs arguments. Used by puppi and monitor.
#   Used only in case the rhcs process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user rhcs runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $rhcs_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $rhcs_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include rhcs"
# - Call rhcs as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class rhcs (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits rhcs::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  $service_rgmanager = 'rgmanager'
  $process_rgmanager = 'rgmanager'
  $pid_file_rgmanager = '/var/run/rgmanager.pid'
  $service_ricci = 'ricci'
  $process_ricci = 'ricci'
  $pid_file_ricci = '/var/run/ricci.pid'

  ### Definition of some variables used in the module
  $manage_package = $rhcs::bool_absent ? {
    true  => 'absent',
    false => 'present',
  }

  $manage_service_enable = $rhcs::bool_disableboot ? {
    true    => false,
    default => $rhcs::bool_disable ? {
      true    => false,
      default => $rhcs::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $rhcs::bool_disable ? {
    true    => 'stopped',
    default =>  $rhcs::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $rhcs::bool_service_autorestart ? {
    true    => Exec[rhcs_config_update],
    false   => undef,
  }

  $manage_file = $rhcs::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $rhcs::bool_absent == true
  or $rhcs::bool_disable == true
  or $rhcs::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $rhcs::bool_absent == true
  or $rhcs::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $rhcs::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $rhcs::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $rhcs::source ? {
    ''        => undef,
    default   => $rhcs::source,
  }

  $manage_file_content = $rhcs::template ? {
    ''        => undef,
    default   => template($rhcs::template),
  }

  ### Managed resources
  package { $rhcs::package:
    ensure  => $rhcs::manage_package,
    noop    => $rhcs::noops,
  }

  user { 'ricci':
    ensure   => $rhcs::manage_package,
    password => $rhcs::ricci_password,
    require  => Package[$rhcs::package],
    noop     => $rhcs::noops,
  }

  service { 'cman':
    ensure     => $rhcs::manage_service_ensure,
    name       => $rhcs::service,
    enable     => $rhcs::manage_service_enable,
    hasstatus  => $rhcs::service_status,
    pattern    => $rhcs::process,
    require    => Package[$rhcs::package],
    noop       => $rhcs::noops,
  }

  service { 'rgmanager':
    ensure     => $rhcs::manage_service_ensure,
    name       => $rhcs::service_rgmanager,
    enable     => $rhcs::manage_service_enable,
    hasstatus  => $rhcs::service_status,
    pattern    => $rhcs::process_rgmanager,
    require    => [ Package[$rhcs::package] , Service['cman'] ],
    noop       => $rhcs::noops,
  }

  service { 'ricci':
    ensure     => $rhcs::manage_service_ensure,
    name       => $rhcs::service_ricci,
    enable     => $rhcs::manage_service_enable,
    hasstatus  => $rhcs::service_status,
    pattern    => $rhcs::process_ricci,
    require    => Package[$rhcs::package],
    noop       => $rhcs::noops,
  }

  file { 'rhcs.conf':
    ensure  => $rhcs::manage_file,
    path    => $rhcs::config_file,
    mode    => $rhcs::config_file_mode,
    owner   => $rhcs::config_file_owner,
    group   => $rhcs::config_file_group,
    require => Package[$rhcs::package],
    notify  => $rhcs::manage_service_autorestart,
    source  => $rhcs::manage_file_source,
    content => $rhcs::manage_file_content,
    replace => $rhcs::manage_file_replace,
    audit   => $rhcs::manage_audit,
    noop    => $rhcs::noops,
  }

  # The whole rhcs configuration directory can be recursively overriden
  if $rhcs::source_dir {
    file { 'rhcs.dir':
      ensure  => directory,
      path    => $rhcs::config_dir,
      require => Package[$rhcs::package],
      notify  => $rhcs::manage_service_autorestart,
      source  => $rhcs::source_dir,
      recurse => true,
      purge   => $rhcs::bool_source_dir_purge,
      force   => $rhcs::bool_source_dir_purge,
      replace => $rhcs::manage_file_replace,
      audit   => $rhcs::manage_audit,
      noop    => $rhcs::noops,
    }
  }

  # This command applies configurations when changed
  exec { 'rhcs_config_update':
    command     => 'ccs_config_validate && cman_tool version -r',
    refreshonly => true,
    path        => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  ### Include custom class if $my_class is set
  if $rhcs::my_class {
    include $rhcs::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $rhcs::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'rhcs':
      ensure    => $rhcs::manage_file,
      variables => $classvars,
      helper    => $rhcs::puppi_helper,
      noop      => $rhcs::noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $rhcs::bool_monitor == true {
    if $rhcs::port != '' {
      monitor::port { "rhcs_${rhcs::protocol}_${rhcs::port}":
        protocol => $rhcs::protocol,
        port     => $rhcs::port,
        target   => $rhcs::monitor_target,
        tool     => $rhcs::monitor_tool,
        enable   => $rhcs::manage_monitor,
        noop     => $rhcs::noops,
      }
    }
    if $rhcs::service != '' {
      monitor::process { 'cman':
        process  => $rhcs::process,
        service  => $rhcs::service,
        pidfile  => $rhcs::pid_file,
        user     => $rhcs::process_user,
        argument => $rhcs::process_args,
        tool     => $rhcs::monitor_tool,
        enable   => $rhcs::manage_monitor,
        noop     => $rhcs::noops,
      }
      monitor::process { 'rgmanager':
        process  => $rhcs::process_rgmanager,
        service  => $rhcs::service_rgmanager,
        pidfile  => $rhcs::pid_file_rgmanager,
        user     => $rhcs::process_user,
        argument => $rhcs::process_args,
        tool     => $rhcs::monitor_tool,
        enable   => $rhcs::manage_monitor,
        noop     => $rhcs::noops,
      }
      monitor::process { 'ricci':
        process  => $rhcs::process_ricci,
        service  => $rhcs::service_ricci,
        pidfile  => $rhcs::pid_file_ricci,
        user     => 'ricci',
        argument => $rhcs::process_args,
        tool     => $rhcs::monitor_tool,
        enable   => $rhcs::manage_monitor,
        noop     => $rhcs::noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $rhcs::bool_firewall == true and $rhcs::port != '' {
    firewall { "rhcs_${rhcs::protocol}_${rhcs::port}":
      source      => $rhcs::firewall_src,
      destination => $rhcs::firewall_dst,
      protocol    => $rhcs::protocol,
      port        => $rhcs::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $rhcs::firewall_tool,
      enable      => $rhcs::manage_firewall,
      noop        => $rhcs::noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $rhcs::bool_debug == true {
    file { 'debug_rhcs':
      ensure  => $rhcs::manage_file,
      path    => "${settings::vardir}/debug-rhcs",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $rhcs::noops,
    }
  }

}
