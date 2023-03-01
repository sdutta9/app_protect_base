#!/usr/bin/env bash
  
LOGDIR=/var/log/adm
   
# prepare environment
mkdir -p /var/run/adm /tmp/cores ${LOGDIR}
chmod 755 /var/run/adm /tmp/cores ${LOGDIR}
chown ${USER}:${USER} /var/run/adm /tmp/cores ${LOGDIR}
   
# run processes
/bin/su -s /bin/bash -c "ulimit -l unlimited && /usr/bin/adminstall -e > ${LOGDIR}/admd.log 2>&1" ${USER}
/usr/sbin/nginx -g 'daemon off;' &
/bin/su -s /bin/bash -c "/usr/bin/admd -d --log info > ${LOGDIR}/admd.log 2>&1 &" ${USER}