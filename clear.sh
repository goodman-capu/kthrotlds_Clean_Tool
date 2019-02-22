service crond stop

busybox rm -f /etc/ld.so.preload
busybox rm -f /usr/local/lib/libioset.so
chattr -i /etc/ld.so.preload
busybox rm -f /etc/ld.so.preload
busybox rm -f /usr/local/lib/libioset.so

# 清理异常进程
busybox ps -ef | busybox grep -v grep | busybox egrep 'ksoftirqds' | busybox awk '{print $1}' | busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'watchdogs' | busybox awk '{print $1}' | busybox xargs kill -9

busybox rm -f /tmp/watchdogs
busybox rm -f /etc/cron.d/tomcat
busybox rm -f /etc/cron.d/root
busybox rm -f /var/spool/cron/root
busybox rm -f /var/spool/cron/crontabs/root
busybox rm -f /etc/rc.d/init.d/watchdogs
busybox rm -f /usr/sbin/watchdogs

ldconfig

# 再次清理异常进程
busybox ps -ef | busybox grep -v grep | busybox egrep 'ksoftirqds' | busybox awk '{print $1}' | busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'watchdogs' | busybox awk '{print $1}' | busybox xargs kill -9

# 清理开机启动项
chkconfig watchdogs off
chkconfig –del watchdogs

service crond start
echo "Done, Please reboot!"


# 1eaf@moresec
