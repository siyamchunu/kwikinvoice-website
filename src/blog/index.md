---
layout: layouts/page.njk
title: Blog
description: Latest updates and news from KwikInvoice
---

<div class="blog-list">
    {%- for post in collections.posts | reverse -%}
    <article class="blog-item">
        <header class="blog-item-header">
            <time datetime="{{ post.date }}">{{ post.date | readableDate }}</time>
            {% if post.data.category %}
            <span class="post-category category-{{ post.data.category | lower }}">{{ post.data.category }}</span>
            {% endif %}
        </header>
        <h2><a href="{{ post.url }}">{{ post.data.title }}</a></h2>
        <p class="excerpt">{{ post.data.excerpt }}</p>
        <a href="{{ post.url }}" class="read-more">Read more →</a>
    </article>
    {%- endfor -%}
</div>
