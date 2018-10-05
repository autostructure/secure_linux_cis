# 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_2
class secure_linux_cis::redhat7::cis_1_1_2 (
  Boolean $enforced = true,
  ) {

    if $enforced {
      if $facts['tmp_partition'] == '' {

        exec { 'systemctl unmask tmp.mount':
          path   => '/bin/',
          before => Exec['systemctl enable tmp.mount'],
        }
        exec { 'systemctl enable tmp.mount':
          path   => '/bin/',
          before => File_line['tmp_mount'],
        }

        file_line { 'tmp_mount':
          ensure => present,
          path   => '/etc/systemd/system/local-fs.target.wants/tmp.mount',
          line   => "[Mount]\nWhat=tmpfs\nWhere=/tmp\nType=tmpfs\nOptions=mode=1777,strictatime,noexec,nodev,nosuid",
          }
          # Exec['systemctl unmask tmp.mount'] -> Exec['system enable tmp.mount'] -> File_line['tmp_mount']
      }
    }
}
