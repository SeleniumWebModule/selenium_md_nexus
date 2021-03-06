# Class: selenium_md_nexus
# ===========================
#
# Full description of class selenium_md_nexus here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'selenium_md_nexus':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class selenium_md_nexus {
  	class{ '::java': }
  	
  	class{ '::nexus':
    	version    => '2.14.5',
    	revision   => '02',
    	nexus_root => '/srv'
  	}

  	Class['::java'] -> Class['::nexus'] -> 

  	exec{'disable_firewall':
  		command => 'iptables -F',
  		user    => 'root',
  		path    => '/usr/sbin'
  	}
}
