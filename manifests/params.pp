# Class: ssmtp::params
#
# This module contain the parameters for sSMTP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ssmtp::params
#
class ssmtp::params {

  $packageCommon                = 'ssmtp'
  $configSsmtpConf              = '/etc/ssmtp/ssmtp.conf'
  $configSsmtpConfTemplate      = 'ssmtp/etc/ssmtp.conf.erb'
  $configRevaliasesConf         = '/etc/ssmtp/revaliases'
  $configRevaliasesConfTemplate = 'ssmtp/etc/revaliases.erb'
  $rootEmail                    = 'john.doe@example.local'
  $mailHub                      = 'mail.example.local'
  $revaliases                   = ['# Custom revaliases']
  $fromlineoverride             = 'Yes'

  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $updateAlternatives = true
    }
    'Debian' : {
      $updateAlternatives = false
    }
    default  : {
      fail "Unsupported OS ${::osfamily}"
    }
  }

}
