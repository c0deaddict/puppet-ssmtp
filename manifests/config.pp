# Class: ssmtp::config
#
# This module contain the configuration for sSMTP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ssmtp::config
#
class ssmtp::config {
  # make parameters available in local scope for usage in templates
  $root_email          = $ssmtp::root_email
  $mail_hub            = $ssmtp::mail_hub
  $revaliases          = $ssmtp::revaliases
  $from_line_override  = $ssmtp::from_line_override
  $auth_user           = $ssmtp::auth_user
  $auth_pass           = $ssmtp::auth_pass
  $auth_method         = $ssmtp::auth_method
  $use_tls             = $ssmtp::use_tls
  $use_start_tls       = $ssmtp::use_start_tls
  $tls_cert            = $ssmtp::tls_cert
  $tls_key             = $ssmtp::tls_key
  $tls_ca_file         = $ssmtp::tls_ca_file
  $tls_ca_dir          = $ssmtp::tls_ca_dir


  # sSMTP configuration
  file {
    $ssmtp::params::config_ssmtp_conf:
      ensure  => present,
      mode    => '0640',
      owner   => 'root',
      group   => 'mail',
      path    => $ssmtp::params::config_ssmtp_conf,
      content => template($ssmtp::params::config_ssmtp_conf_template);

    $ssmtp::params::config_revaliases_conf:
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      path    => $ssmtp::params::config_revaliases_conf,
      content => template($ssmtp::params::config_revaliases_conf_template);
  }
}
