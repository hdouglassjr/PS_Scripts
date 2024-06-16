#  Note that this script must be run at an elevated prompt.

New-SelfSignedCertificate -DnsName "espeed4.test" -CertStoreLocation "Cert:\LocalMachine\My"