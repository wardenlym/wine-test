# aws arm64 ubuntu 安装gnome桌面和vnc

## 安装
sudo apt install -y ubuntu-desktop tightvncserver gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal tigervnc-xorg-extension xserver-xorg-core tigervnc-common tigervnc-standalone-server

sudo systemctl enable gdm
sudo systemctl start gdm

## xstartup
cat .vnc/xstartup
```bash
#!/bin/sh
# Start Gnome 3 Desktop
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session &
```

# 运行方法
LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver -localhost no -depth 16 -geometry 1680x1050
# arm 的错误问题 Ubuntu 20.10修复
https://github.com/TigerVNC/tigervnc/issues/800#issuecomment-565669421
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932499

https://www.cyh.ac.cn/2020/05/09/%E6%A0%91%E8%8E%93%E6%B4%BE-ubuntu-%E5%AE%89%E8%A3%85vncserver/


Wed May 11 08:18:44 2022
 Connections: accepted: 35.76.37.16::65085
 SConnection: Client needs protocol version 3.8
 SConnection: Client requests security type VncAuth(2)
terminate called after throwing an instance of 'rdr::Exception'
terminate called recursively
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/Xtigervnc (OsLookupColor+0x188) [0xaaaae3196038]
(EE) unw_get_proc_info failed: no unwind info found [-10]
(EE)
(EE)
Fatal server error:
(EE) Caught signal 6 (Aborted). Server aborting
(EE)


发现是rdr::Exception，原因大概是链接库一类的问题，启动前带上libgcc_s即可

# 64位系统
LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver -localhost no
# 32位系统
LD_PRELOAD=/lib/arm-linux-gnueabihf/libgcc_s.so.1 vncserver -localhost no


## 分辨率
#LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver -localhost no -depth 32 -geometry 1680x1050
LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver -localhost no -depth 16 -geometry 1680x1050

## 连接方式
vnc 软件 填入 ip:1

## 锁屏的解决方法
loginctl unlock-session