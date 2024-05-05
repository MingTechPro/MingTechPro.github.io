---
title: 数据图表
date: 2024-05-03 19:57:53
---

<!-- 文章发布时间统计图 -->
<div id="posts-chart" data-start="2023-10" style="border-radius: 8px; height: 300px; padding: 10px;"></div>
<!-- 文章标签统计图 -->
<div id="tags-chart" data-length="10" style="border-radius: 8px; height: 300px; padding: 10px;"></div>
<!-- 文章分类统计图 -->
<div id="categories-chart" data-parent="true" style="border-radius: 8px; height: 300px; padding: 10px;"></div>

<br>
{% note warning flat %}
注：功能实现参考于 [Hexo 博客文章统计图 ](https://blog.eurkon.com/post/1213ef82.html)
{% endnote %}

{% note danger flat %}
<font color=Red>特别注意：</font>如使用 Cloudflare 解析域名，请不要打开 `Rocket Loader™` 否则将无法正常显示图表
{% endnote %}