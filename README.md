# Puppet module: rhcs

## DEPRECATION NOTICE
This module is no more actively maintained and will hardly be updated.

Please find an alternative module from other authors or consider [Tiny Puppet](https://github.com/example42/puppet-tp) as replacement.

If you want to maintain this module, contact [Alessandro Franceschi](https://github.com/alvagante)


This is a Puppet module for RedHat Cluster Suite based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-rhcs

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Modules specific parameters

* Install rhcs and set ricci's (hashed) password

        class { 'rhcs':
          ricci_password => '$1$am6eJ020$owCyQGVLLcHwbrzkDcOvN.',
        }

Note: The module installs and manager Cman, Rgmanager and Ricci.
If you decide to manage the cluster configuration the the Luci web interface you should not provide it via the source or template parameters.
If you decide to manage the configuration with Puppet, note that (by default) a syntax check is done and a cman_tool update is triggered.
Set service_autorestart => false to avoid automatic configuration of the cluster config file.

## USAGE - Basic management

* Install rhcs with default settings

        class { 'rhcs': }

* Disable rhcs services (Cman, Rgmanager, Ricci).

        class { 'rhcs':
          disable => true
        }

* Remove rhcs packages

        class { 'rhcs':
          absent => true
        }

* Enable auditing without without making changes on existing rhcs configuration *files*

        class { 'rhcs':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'rhcs':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'rhcs':
          source => [ "puppet:///modules/example42/rhcs/cluster.conf-${hostname}" , "puppet:///modules/example42/rhcs/cluster.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'rhcs':
          source_dir       => 'puppet:///modules/example42/rhcs/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'rhcs':
          template => 'example42/rhcs/cluster.conf.erb',
        }

* Automatically include a custom subclass

        class { 'rhcs':
          my_class => 'example42::my_rhcs',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'rhcs':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'rhcs':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'rhcs':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'rhcs':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }



[![Build Status](https://travis-ci.org/example42/puppet-rhcs.png?branch=master)](https://travis-ci.org/example42/puppet-rhcs)
