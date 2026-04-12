---
layout: layouts/page.njk
title: Blog — Invoicing Tips & Small Business Advice
description: Expert tips on invoicing, payments, and running a small business. Learn how to get paid faster and manage your finances better.
---

<div class="blog-list">
    {%- for post in collections.posts -%}
    <article class="blog-item{% if post.data.image %} has-image{% endif %}">
        {% if post.data.image %}
        <a href="{{ post.url }}" class="blog-item-image">
            <img src="{{ post.data.image }}" alt="{{ post.data.imageAlt | default(post.data.title) }}" loading="lazy" width="400" height="210">
        </a>
        {% endif %}
        <div class="blog-item-content">
            <header class="blog-item-header">
                <time datetime="{{ post.date }}">{{ post.date | readableDate }}</time>
                {% if post.data.category %}
                <span class="post-category category-{{ post.data.category | lower }}">{{ post.data.category }}</span>
                {% endif %}
            </header>
            <h2><a href="{{ post.url }}">{{ post.data.title }}</a></h2>
            <p class="excerpt">{{ post.data.excerpt }}</p>
            <a href="{{ post.url }}" class="read-more">Read more →</a>
        </div>
    </article>
    {%- endfor -%}
</div>
