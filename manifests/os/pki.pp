class bobcat::os::pki (
  $ca_name   = "Puppet CA",
  $ca_source = "file:///etc/puppet/ssl/certs/ca.pem"
) {
  include ca_cert  # Ensure the class is included, but without forcing strict ordering

  ca_cert::ca { $ca_name:
    ensure => 'trusted',
    source => $ca_source,
    before => Exec['ca_cert_update'],  # Ensures ca_cert::ca runs first
  }
}
