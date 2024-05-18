---
title: 玩客云的新生：CasaOS 系统刷机全记录
date: 2024-05-18 20:05:59
tags: 
  - CasaOS
  - 玩客云
categories: 玩客云
cover: https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/wallpaper/202405111628575.jpg
description: 玩客云，一款硬件性能出色的智能存储设备。轻 NAC 系统（CasaOS）以其简洁高效的优势，深受众多用户喜爱。将玩客云刷入 CasaOS 系统，能充分挖掘其潜力，带来全新功能和体验。下面，我将为大家详细介绍玩客云刷入 CasaOS 的具体步骤，并分享其优势，希望能激发大家对刷机过程的兴趣。
abbrlink: b065c228
---

## 引言

玩客云，一款硬件性能出色的智能存储设备。轻 NAC 系统（CasaOS）以其简洁高效的优势，深受众多用户喜爱。将玩客云刷入 CasaOS 系统，能充分挖掘其潜力，带来全新功能和体验。下面，我将为大家详细介绍玩客云刷入 CasaOS 的具体步骤，并分享其优势，希望能激发大家对刷机过程的兴趣。

## 准备工作

### 所需材料
- 玩客云设备及电源
- 金属镊子或金属丝：用于短接刷机触点
- USB 公对公连接线：连接玩客云和电脑
- 电脑：安装刷机工具和系统
- 热风枪或吹风机：拆卸玩客云外壳

### 下载相关资料
 - ArmBian 系统固件：底层系统
 - USB_Burning_Tool：晶晨烧录工具
 - MobaXterm：连接 ArmBian 系统工具

## 刷机步骤

### 拆开玩客云主机

使用热风枪或吹风机加热玩客云外壳后盖版并撬开外面装饰盖板
![加热后盖板](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182121905.jpg)
然后打下螺丝小心地将其后盖拆开取出主板，注意不要损坏内部元件！
![取下螺丝](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182122268.jpg)

### 刷 ArmBian 底包

将下载好的 ArmBian 系统固件刷入玩客云，为后续刷机做好准备。具体步骤如下：
- 打开已下载安装好的`“USB_Burning_Tool：晶晨烧录工具”`，并导入烧录包
![导入烧录包](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182123269.png)
- 选择烧录配置，然后点击`“开始”`
![烧录配置](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182124771.png)
- 使用 USB 公对公线将主板和电脑连接起来<br>(USB 接口应选择靠近 HDMI 接口的那一边)
![接入USB接口](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182126519.jpg)
- 短接刷机触点，并给设备接通电源<br>(此时电脑会自动连接主板，进入刷机模式)
{% note danger modern %}
注：不同玩客云型号所对应的短接刷机触点是有所不同的，请参考以下图片进行短接操作。
{% endnote %}
`1.0`版本主板短接触点
![1.0版本主板](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182133751.png)
`1.3`版本主板短接触点
![1.3版本主板](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182134262.png)
![进入刷机模式](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182138509.png)

- 等待刷机完成，注意先点击刷机软件中的`“停止”`，再移除 USB 连接线，然后重启设备
![刷机完成](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182139217.png)

### 进入路由器后台查看设备IP
- 查找名为`“onecloud”`的设备，并记下其 IP 地址
![查找设备Ip](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182140430.png)

### 刷入 CasaOS
在 ArmBian 底包的基础上刷入 CasaOS 系统。这一过程需要耐心等待，以确保刷机顺利完成。
- 使用 MobaXterm 连接 ArmBian 系统
![连接ArmBian系统](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182141970.png)
![连接MobaXterm](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182142344.png)

- 登录 ArmBian 系统 - 账号：root 默认密码：1234
![登录ArmBian系统](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182143434.png)

- 修改登录密码并取消设置新账户
![修改密码](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182143317.png)

- 检查系统时间及时区
执行命令：
```bash
date -R
```
![系统时间及时区](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182144795.png)

- 如果系统时区不正确，需要修改时区
执行命令：
```bash
cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
```
建议重新运行命令查看是否成功修改时区
![修改时区](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182145663.png)

- 修改软件安装源以提高安装成功率
执行命令：
```bash
nano /etc/apt/sources.list
```
![编辑软件源](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182145386.png)
进入编辑页面，将原有的软件源用`“#”`注释掉
比如:
```bash
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
```
在文本下方的空白处添加以下代码：
```bash
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
```
![编辑保存软件源](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182146289.png)

- 更新本地软件包列表并升级已安装的软件包
执行命令：
```bash
apt-get update && apt-get upgrade
```
![更新本地软件包列表](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182147132.png)

- 安装 CasaOS 系统
执行命令：
```bash
wget -qO- https://get.casaos.io | bash
```
![安装CasaOS系统](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182147239.png)
![安装CasaOS系统](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182148439.png)

{% note info flat %}
若无法安装，可先安装 Docker
执行命令：
```bash
aptinstall docker.io
```
{% endnote %}

### 登录 CasaOS 界面

安装 CasaOS 系统成功后，就可以登录到 CasaOS 系统界面，开始体验全新的系统。
- 可以通过设备的 IP 地址访问 CasaOS
![登录CasaOS界面](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182150996.png)
![登录CasaOS界面](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182150607.png)

- 注册 CasaOS 帐户
![注册CasaOS帐户](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182151702.png)

- 添加适用于玩客云设备的软件库，链接如下：
```url
https://play.cuse.eu.org/Cpe204-Appstore-play-arm.zip
http://play.cuse.eu.org/Cpe204-Appstore-play-arm.zip
```
![添加软件库](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182152874.png)
![添加软件库](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182152060.png)
![添加软件库](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/post-img_url/202405182152962.png)
{% note warning flat %}
注：只需填入其中一个链接即可，如果使用 https 协议添加不成功，则可以使用 http 协议。
{% endnote %}

## CasaOS 系统介绍

### Docker 功能
CasaOS 系统支持 Docker 功能，这意味着你可以轻松地安装和运行各种应用程序，扩展玩客云的功能。

### 推荐应用
- Home Assistant：这是一款极为强大的智能家居控制中心，能使你便捷地对家中的各类智能设备进行管理。
- 青龙：可用于 Python、JavaScript、Shell 以及 Typescript 脚本的任务管理平台。
- qBittorrent：免费的 BitTorrent 下载工具。
- Alist：一个能够支持多种存储的文件列表程序。
- Pi-hole：强大的网络广告拦截利器。
- Memos：简单且易用的笔记应用，便于你记录重要的信息和创意想法。

## 总结

玩客云刷入轻 NAC 系统（CasaOS）是一次充满挑战和乐趣的经历。通过刷机，我们不仅释放了玩客云的潜力，还获得了一个功能强大、易于使用的系统。CasaOS 系统的 Docker 功能和丰富的应用支持让玩客云变得更加实用和有趣。结合 cpolar 内网穿透实现的远程访问功能，让我们可以随时随地访问和管理玩客云。

如果你对玩客云刷入轻 NAC 系统（CasaOS）感兴趣，不妨动手尝试一下。相信这一过程会让你对玩客云有全新的认识，并为你的数字生活带来更多的便利和乐趣。

需要注意的是，刷机有一定风险，请谨慎操作，并确保你已经备份了重要的数据。同时，本文提供的信息仅供参考，具体的刷机过程可能因设备和系统版本的不同而有所差异。祝你刷机顺利！

---

请关注公众号，并回复`“玩客云”`以获取相关资源。
![微信公众号](https://jsd.012700.xyz/gh/MingTechPro/drawing-bed/avatar-bg_url/202405061722781.png)
