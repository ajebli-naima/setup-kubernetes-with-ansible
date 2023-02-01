pipeline {
    agent any


    stages {
        stage('File valuation') {
            steps {
                script {
                          sh '''
                          sed -i "s|<ETCD_1_IP>|${ETCD_1_IP}|" inventory.ini
                          sed -i "s|<ETCD_2_IP>|${ETCD_2_IP}|" inventory.ini
                          sed -i "s|<ETCD_3_IP>|${ETCD_3_IP}|" inventory.ini
                          sed -i "s|<MASTER_1_IP>|${MASTER_1_IP}|" inventory.ini
                          sed -i "s|<MASTER_2_IP>|${MASTER_2_IP}|" inventory.ini
                          sed -i "s|<WORKER_1_IP>|${WORKER_1_IP}|" inventory.ini
                          sed -i "s|<WORKER_2_IP>|${WORKER_2_IP}|" inventory.ini
                          sed -i "s|<HAPROXY_1_IP>|${HAPROXY_1_IP}|" inventory.ini
                          sed -i "s|<HAPROXY_2_IP>|${HAPROXY_2_IP}|" inventory.ini
                          sed -i "s|<SSH_PORT>|${SSH_PORT}|" inventory.ini
                          sed -i "s|<VIRTUAL_IP>|${VIRTUAL_IP}|" haproxy-keepalived-role/templates/first-keepalived-cfg.sh
                          sed -i "s|<VIRTUAL_IP>|${VIRTUAL_IP}|" haproxy-keepalived-role/templates/second-keepalived-cfg.sh
                          sed -i "s|<VIRTUAL_IP>|${VIRTUAL_IP}|" control-plane-role/templates/kubeadm-config.sh

                          '''
                }
            }
        }

        stage('Run playbook'){
            steps {
            dir('./') {
            ansiblePlaybook  playbook: 'playbook.yml',
            colorized: false,
            inventory: 'inventory.ini',
            extras: params.extras,
            limit: params.limit,
            tags: params.tags
            }

            }
        }
    }

}
