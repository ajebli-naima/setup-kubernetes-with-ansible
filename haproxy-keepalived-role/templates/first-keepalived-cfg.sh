sudo cat <<EOF >/etc/keepalived/keepalived.conf
global_defs {
  notification_email {
  }
  router_id LVS_DEVEL
  vrrp_skip_check_adv_addr
  vrrp_garp_interval 0
  vrrp_gna_interval 0
}

vrrp_script chk_haproxy {
  script "killall -0 haproxy"
  interval 2
  weight 2
}

vrrp_instance haproxy-vip {
  state BACKUP
  priority 100
  interface ens192                       # Network card
  virtual_router_id 60
  advert_int 1
  authentication {
    auth_type PASS
    auth_pass 1111
  }
  unicast_src_ip {{ HAPROXY_1_IP }}     # The IP address of this machine
  unicast_peer {
    {{ HAPROXY_2_IP }}                        # The IP address of peer machines
  }

  virtual_ipaddress {
    <VIRTUAL_IP>/24                  # The VIP address
  }

  track_script {
    chk_haproxy
  }
}

EOF
