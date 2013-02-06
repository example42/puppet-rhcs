# Class: rhcs::spec
#
# This class is used only for rpsec-puppet tests
# Can be taken as an example on how to do custom classes but should not
# be modified.
#
# == Usage
#
# This class is not intended to be used directly.
# Use it as reference
#
class rhcs::spec inherits rhcs {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "rhcs": template => "rhcs/spec.erb" }

  File['rhcs.conf'] {
    content => template('rhcs/spec.erb'),
  }

}
