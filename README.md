# 清理工具使用说明

## 本清理工具适用于2019年2月21日爆发的Watchdogs挖矿蠕虫。

1. 上传busybox到/bin/目录下。
2. 运行clear*.sh。

---

# 2019.3.4 新增clear_kthrotlds.sh

## 新增针对Watchdogs进程变种为kthrotlds的挖矿蠕虫的清理脚本clear_kthrotlds.sh

## 变种主要特征如下：
+ watchdogs进程变更为kthrotlds
+ libioset.so变更为libcset.so
+ watchdogs开机启动项名称变更为netdns


By 默安科技（MoreSec）
