# 清理工具使用说明

脚本原作者是默安科技（MoreSec），https://github.com/MoreSecLab/DDG_MalWare_Clean_Tool

本脚本用于处理截至2019年10月的病毒变种。相对于之前的病毒，有如下变化：

* 病毒实际位于`/usr/bin/[kthrotlds]`
* crontab内容换汤不换药，具体内容见[cron_root.txt](Virus_DO_NOT_EXECUTE/cron_root.txt)
* `/etc/cron.hourly`，`/etc/cron.daily`，`/etc/cron.monthly`，`/usr/local/bin/nptd`被病毒感染，具体内容见[cron_hourly.txt](Virus_DO_NOT_EXECUTE/cron_hourly.txt)
* 存在可疑进程`systemd-logind`和`agetty`，不确定是否和病毒有关
* 相比之前的清理过程，发现很多文件都被锁住无法修改，故干脆在删除每个文件之前都执行一次`busybox chattr -i`
* 会向`/root/.ssh/authorized_keys`中写入攻击者的公钥
*  会向`/etc/ssh/sshd_config`中写入若干配置以允许远程登陆

## 使用方法

* 上传`busybox`到`/bin/`目录下
* 上传并运行`clear_kthrotlds.sh`
* 删除`/root/.ssh/authorized_keys`下的攻击者公钥（`ssh-rsa AAAAB...A76WH user@localhost`）
* 恢复`/etc/ssh/sshd_config`配置，主要查看`PermitRootLogin`，`RSAAuthentication`，`PubkeyAuthentication`，`UsePAM`，`PasswordAuthentication`这五项，以及文件末尾有无多余重复内容

## 免责声明

我只是因为个人服务器中毒而研究了这个病毒，没有任何系统安全相关专业知识，分析和解决方案都可能不正确，请使用者自行斟酌！

## 参考网站

* https://www.anquanke.com/post/id/172111
* https://blog.csdn.net/wo18237095579/article/details/89376744
* https://cloud.tencent.com/developer/article/1026521
