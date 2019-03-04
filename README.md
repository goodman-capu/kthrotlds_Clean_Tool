# 清理工具使用说明

本清理工具适用于2019年2月21日爆发的Watchdogs挖矿蠕虫。
- Watchdogs挖矿蠕虫主要特征如下：
   + ps -ef | grep watchdogs               # 存在恶意进程watchdogs
   + ps -ef | grep ksoftirqds              # 存在恶意进程ksoftirqds
   + chkconfig | grep watchdogs            # 存在恶意启动项watchdogs
   + ldd \`which ps\` | grep libioset.so     # ps、rm等命令被so劫持 
   + crontab -l | grep pastebin            # 存在恶意的蠕虫下载计划任务
   
- 使用clear清理Watchdogs步骤：
   1. 上传busybox到/bin/目录下。
   2. 运行clear.sh。

-------------------------------

# 2019.3.4 新增clear_kthrotlds.sh

新增针对2019年3月1日Watchdogs进程变种为kthrotlds的挖矿蠕虫的清理脚本clear_kthrotlds.sh

- kthrotlds挖矿蠕虫变种主要特征如下：
   + watchdogs进程变更为kthrotlds
   + libioset.so变更为libcset.so
   + watchdogs开机启动项名称变更为netdns

- 使用clear_kthrotlds.sh清理kthrotlds步骤：
    1. 上传busybox到/bin/目录下。
    2. 运行clear_kthrotlds.sh。


By 默安科技（MoreSec）
