# == Class: ssmtp
#
# This module manages SSMTP.
#
# === Parameters
#
# Document parameters here.
#
# [*defaultMta*]
#   if set to ssmtp, this class will be used
#
# [*rootEmail*]
#   Mail address that get root mails
#
# [*mailHub*]
#   server that handle outgoing mail
#
# [fromlineoverride]
#   Default: YES
#
# [*revaliases*]
#   Array of reverse aliases
#
# [authuser]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [authpass]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [authmethod]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlscert]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlskey]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [authuser]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlscafile]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlscadir]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [require_yum] (bool, default=true)
#   It set to false module yum will not be required.
#
# === Variables
#
# === Examples
#
#  class { '::ssmtp':
#    mailHub => 'mail.example.local',
#    rootEmail => 'john.doe@example.local',
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
  $defaultMta       = $ssmtp::params::defaultMta,
  $rootEmail        = $ssmtp::params::rootEmail,
  $mailHub          = $ssmtp::params::mailHub,
  $revaliases       = $ssmtp::params::revaliases,
  $fromlineoverride = $ssmtp::params::fromlineoverride,
  $authuser         = undef,
  $authpass         = undef,
  $authmethod       = undef,
  $usetls           = undef,
  $usestarttls      = undef,
  $tlscert          = undef,
  $tlskey           = undef,
  $tlscafile        = undef,
  $tlscadir         = undef,
) inherits ssmtp::params {

  # Start workflow
  if $ssmtp::params::linux {
    # Containment
    contain ssmtp::package
    contain ssmtp::config
    contain ssmtp::service

    Class['ssmtp::package'] ->
    Class['ssmtp::config'] ->
    Class['ssmtp::service']
  }
}
