---
layout: post
date: '2023-12-12/16:50:28'
title: 使用 Jekyll 在 GitHub 上搭建个人博客
cover: >-
  https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404272114901.jpg
categories:
  - Jekyll
tags:
  - Jekyll
  - 博客
abbrlink: 94ec1eda
---

搭建流程：

- 下载安装配置Git
- GitHub创建公共仓库
- 克隆本地仓库
- 克隆博客模板
- 博客基础功能设置
- 设置评论功能
- 上传GitHub

## 下载安装配置 Git

- 下载 [Git官网](https://git-scm.com/) & [Git 安装配置参考以下教程](https://blog.csdn.net/m0_72983118/article/details/130546429)

![完成测试](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356305.png)

## GitHub 创建公共仓库

- 创建仓库名结尾为 * .github.io 的公共仓库
- 示范：ChenPeiming52001.github.io
  ![仓库创建](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356841.png)

## 克隆本地仓库

- 将刚刚创建好的空仓库克隆到本地

 1. 复制仓库中的 HTTPS 地址
 ![HTTPS](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356309.png)

 1. 在需要克隆的本地文件夹打开 Git 终端，粘贴的地址命令行并回车
 ![Git](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356802.png)

 1. 等待克隆完毕
 ![克隆完毕](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356759.png)

## 克隆博客模板

- 打开博客模板项目 [ChenPeiming52001.github.io](https://github.com/MingTechPro/ChenPeiming52001.github.io)
- 博客模板 [ChenPeiming52001.github.io 发行版](https://github.com/MingTechPro/ChenPeiming52001.github.io/releases)
- 复制仓库中的 HTTPS 地址
  ![博客模板](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356535.png)

- 通过 Git 终端 克隆到本地
![Git](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356405.png)

- 打开下载好的项目，删除根目录里面 .git 文件夹和 _posts 、images 文件夹里面的文件
- 懒得删除可以下载打包好的 `ChenPeiming52001.github.io 发行版`
![删除文件](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356937.png)

## 博客基础功能设置

- 博客的基础功能都可以在根目录 <font color=SpringGreen>_config.yml</font> 文件下设置

### 设置主页

- title: ChenPeiming `设置自己博客的名称`
- location: 广东，广州 `设置自己所在的地区`
- company: CSDN  `设置第三方链接名称`
- company_url: <https://blog.csdn.net/cpm011023> `设置第三方网络地址`
- name: ChenPeiming52001 `设置自己 GitHub 的名称`
- github_url: <https://github.com/ChenPeiming52001> `设置自己 GitHub 的网络地址`
- description: 这是ChenPeiming的个人博客 `设置博客的描述`
- url: <https://chenpeiming52001.github.io> `设置个人博客的网络协议`

![设置主页标题](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356385.png)
![设置主页标题](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356705.png)

### 设置关于页

- introduce: 我是一个对学习充满热情、善于思考和寻找解决方案的人。 `设置个人介绍`
- email: <chenpeiming52001@163.com> `设置自己的邮箱`
- skill_software_keywords: [Java,  Python]  `软件开发标签`
- skill_j2ee_keywords:  `J2EE开发标签`
- skill_mobile_app_keywords:  `手机开发标签`
- skill_web_keywords: [HTML, CSS, JS, JQuery,SpringBoot, MySQL, MongoDB, PHP] `Web开发标签`

![设置关于页](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356703.png)
![设置关于页](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356350.png)

### 设置简历

- 将简历放在根目录下的 `assets\files` 件夹中
- 在根目录下 `about.md` 里面引入简历链接
- `ChenPeiming_CH.pdf` 替换为己的文件名称

```html
<h3>下载我的简历</h3>
<a role="button" class="btn btn-primary hvr-grow-shadow"
   href="/assets/files/ChenPeiming_CH.pdf" target="_blanks">
<span class="flag-icon flag-icon-cn"></span> 中文 </a>
```

![设置简历](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356171.png)
![设置简历](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356426.png)

### 设置书签

- 书签🔖用于快速标记您喜欢使用的资源库/工具/书籍

- 书签展示内容可以在根目录 <font color=SpringGreen>bookmark.md</font> 文件下设置

![设置书签](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356613.png)

![设置书签](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356646.png)

## 设置评论功能

- [LeanCloud 官网](https://console-e1.leancloud.cn/)

### 注册 [LeanCloud](https://console-e1.leancloud.cn/register) 账号

![注册LeanCloud账号](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356174.png)

### 创建 LeanCloud  应用

![创建 LeanCloud  应用](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356828.png)
![创建 LeanCloud  应用](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356993.png)

### 设置 LeanCloud  应用

- 设置 Web 安全域名
 ![设置Web安全域名](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356087.png)
 ![设置Web安全域名](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404300007910.png)

- 获取 LeanCloud  应用凭证 AppID & AppKey
 ![AppID](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356989.png)
 ![AppKey](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404300008012.png)

### 设置魔改 Valine

- appId: Evlk9TNDwcQAIW9cC3NVx9bO-gzGzoHsz   `填入刚刚复制的 AppID`
- appKey: 9TNYPTSFy6BvTeJnmxzBT7H9  `填入刚刚复制的 AppKey`
 ![设置魔改Valine](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356356.png)

- [MD5加密工具](https://c.runoob.com/front-end/703/) 可以将邮箱加密为 MD5
- master: ['33c0f3680c72dd299d9463a496cc7640']  `填入 MD5 加密后博主(自己)的邮箱`
- friends: ['f652e9c510f5948f083d453a189b13bc', '261225df065b70eafdef4c88eecdb55d']  `填入 MD5 加密后小伙伴的邮箱`
 ![设置魔改Valine](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356876.png)

## 上传 GitHub

- 上传文件
![上传文件](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356026.png)

```
git add .
```

- 添加上传添加消息  
![添加上传添加消息](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356318.png)

```
git commit -m "部署博客"
```

- 选择上传分支  
![选择上传分支](https://cdn.jsdelivr.net/gh/MingTechPro/drawing-bed/post-img_url/202404292356361.png)

```
git push origin main
```

<br>

------
