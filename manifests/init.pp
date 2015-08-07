# == Class: ssmtp
#
# This module manages SSMTP.
#
# === Parameters
#
# Document parameters here.
#
# [*update_alternatives*]
#   if set, this indicates that the OS does not set ssmtp as default MTA
#   please don't override the default value from ssmtp::params
#
# [*root_email*]
#   Mail address that get root mails
#
# [*mail_hub*]
#   server that handle outgoing mail
#
# [from_line_override]
#   Default: YES
#
# [*revaliases*]
#   Array of reverse aliases
#
# [auth_user]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [auth_pass]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [auth_method]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tls_cert]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tls_key]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [auth_user]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tls_ca_file]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tls_ca_dir]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [use_tls]
#   ssmtp.conf parameter, see man 5 ssmtp.conf
#
# [use_start_tls]
#   ssmtp.conf parameter, see man 5 ssmtp.conf
#
# === Variables
#
# === Examples
#
#  class { '::ssmtp':
#    mail_hub => 'mail.example.local',
#    root_email => 'john.doe@example.local',
#  }
#
# === Authors
#
# Thomas Bendler <project@bendler-net.de>
# Thomas Mueller <mueller@puzzle.ch>
# Jos van Bakel <josvanbakel@gmail.com>
#
# === Copyright
#
# Copyright 2015 Thomas Bendler
#
class ssmtp (
  $update_alternatives = $ssmtp::params::update_alternatives,
  $root_email          = $ssmtp::params::root_email,
  $mail_hub            = $ssmtp::params::mail_hub,
  $revaliases          = $ssmtp::params::revaliases,
  $from_line_override  = $ssmtp::params::from_line_override,
  $auth_user           = undef,
  $auth_pass           = undef,
  $auth_method         = undef,
  $use_tls             = undef,
  $use_start_tls       = undef,
  $tls_cert            = undef,
  $tls_key             = undef,
  $tls_ca_file         = undef,
  $tls_ca_dir          = undef,
) inherits ssmtp::params {

  contain ssmtp::package
  contain ssmtp::config
  contain ssmtp::service

  Class['ssmtp::package'] ->
  Class['ssmtp::config'] ->
  Class['ssmtp::service']

}
