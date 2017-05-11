class aem (
  $aem_healthcheck_version = '1.3.3',
  $tmp_dir = '/tmp',
) {

  archive { "aem-healthcheck-content-${aem_healthcheck_version}.zip":
    ensure  => present,
    source  => "http://central.maven.org/maven2/com/shinesolutions/aem-healthcheck-content/1.3.3/aem-healthcheck-content-${aem_healthcheck_version}.zip",
    cleanup => false,
  }

  aem_package { "Install aem-healthcheck-${aem_healthcheck_version}":
    ensure    => present,
    name      => 'cq-6.2.0-hotfix-11490',
    group     => 'shinesolutions',
    version   => $aem_healthcheck_version,
    path      => $tmp_dir,
    replicate => false,
    activate  => false,
    force     => true,
  }

}

include aem
