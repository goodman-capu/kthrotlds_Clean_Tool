service crond stop

busybox chattr -i /etc/ld.so.preload
busybox rm -f /etc/ld.so.preload
busybox chattr -i /usr/local/lib/libcset.so
busybox rm -f /usr/local/lib/libcset.so
busybox chattr -i /etc/ld.so.preload
busybox rm -f /etc/ld.so.preload
busybox chattr -i /usr/local/lib/libcset.so
busybox rm -f /usr/local/lib/libcset.so

# 清理异常进程
busybox ps -ef | busybox grep -v grep | busybox egrep 'systemd-logind' && busybox awk '{print $1}' && busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'agetty' && busybox awk '{print $1}' && busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'ksoftirqds' && busybox awk '{print $1}' && busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'kthrotlds' && busybox awk '{print $1}' && busybox xargs kill -9

busybox chattr -i /etc/cron.d/root
busybox rm -f /etc/cron.d/root
busybox chattr -i /var/spool/cron/root
busybox rm -f /var/spool/cron/root
busybox chattr -i /var/spool/cron/crontabs/root
busybox rm -f /var/spool/cron/crontabs/root
busybox chattr -i /etc/cron.hourly/cronlog
busybox rm -f /etc/cron.hourly/cronlog
busybox chattr -i /etc/cron.daily/cronlog
busybox rm -f /etc/cron.daily/cronlog
busybox chattr -i /etc/cron.monthly/cronlog
busybox rm -f /etc/cron.monthly/cronlog
busybox chattr -i /usr/local/bin/nptd
busybox rm -f /usr/local/bin/nptd

busybox chattr -i /tmp/kthrotlds
busybox rm -f /tmp/kthrotlds
busybox chattr -i /etc/rc.d/init.d/kthrotlds
busybox rm -f /etc/rc.d/init.d/kthrotlds
busybox chattr -i /usr/sbin/kthrotlds
busybox rm -f /usr/sbin/kthrotlds
busybox chattr -i /usr/bin/[kthrotlds]
busybox rm -f /usr/bin/[kthrotlds]

busybox chattr -i /etc/init.d/netdns
busybox rm -f /etc/init.d/netdns

# busybox chattr -i /root/.ssh/authorized_keys
# busybox rm -f /root/.ssh/authorized_keys


ldconfig

# 再次清理异常进程
busybox ps -ef | busybox grep -v grep | busybox egrep 'systemd-logind' && busybox awk '{print $1}' && busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'agetty' && busybox awk '{print $1}' && busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'ksoftirqds' && busybox awk '{print $1}' && busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'kthrotlds' && busybox awk '{print $1}' && busybox xargs kill -9

# 清理开机启动项
chkconfig netdns off
chkconfig –del netdns

service crond start
echo "Done, Please reboot NOW!"

# sidie@moresec
# modified by goodman-capu
