class bobcat::os::pki (
  $ca_name   = "Puppet CA",
  $ca_source = "file:///etc/puppet/ssl/certs/ca.pem"
) {
  include ca_cert  # Ensures the class is present, without forcing a strict dependency

  ca_cert::ca { $ca_name:
    ensure => 'trusted',
    source => $ca_source,
    require => Class['ca_cert'],  # Avoids an implicit loop
  }
}
