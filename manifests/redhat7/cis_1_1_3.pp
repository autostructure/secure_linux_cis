# # 1.1.3 Ensure nodev option set on /tmp partition (Scored)
# #
# #
# # Description:
# # The nodev mount option specifies that the filesystem cannot contain special devices.
# #
# # @summary 1.1.3 Ensure nodev option set on /tmp partition (Scored)
# #
# # @example
# #   include secure_linux_cis::redhat7::cis_1_1_3
# class secure_linux_cis::redhat7::cis_1_1_3 (
#   Boolean $enforced = true,
#   ) {
#     if $enforced {
#
#       if $facts['tmp_nodev'] == '' {
#         notify => Class['secure_linux_cis::redhat7::cis_1_1_2'],
#
#         file_line { 'tmp_nodev':
#           ensure => present,
#           path   => '/etc/systemd/system/local-fs.target.wants/tmp.mount',
#           line   =>
#           }
#       else
#
#
#       }
#     }
# }
