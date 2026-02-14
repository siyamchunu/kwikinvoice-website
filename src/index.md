---
layout: layouts/base.njk
title: Home
description: KwikInvoice - Professional invoicing for small businesses in South Africa
---

<section class="hero">
    <div class="container">
        <h1>Professional Invoicing Made Simple</h1>
        <p class="hero-subtitle">Create, manage, and track invoices for your small business with KwikInvoice</p>
        <div class="hero-cta">
            <a href="#" class="btn btn-primary">Download on Google Play</a>
            <a href="/blog" class="btn btn-secondary">Learn More</a>
        </div>
    </div>
</section>

<section class="legal-docs">
    <div class="container">
        <h2>Legal Information</h2>
        <div class="card-grid">
            <div class="card">
                <div class="card-icon">📄</div>
                <h3>Privacy Policy</h3>
                <p>Learn how we protect your data and respect your privacy</p>
                <a href="/privacy-policy" class="card-link">Read Privacy Policy →</a>
            </div>
            
            <div class="card">
                <div class="card-icon">📋</div>
                <h3>Terms of Service</h3>
                <p>Understand your rights and our terms of use</p>
                <a href="/terms-of-service" class="card-link">Read Terms of Service →</a>
            </div>
        </div>
    </div>
</section>

<section class="latest-posts">
    <div class="container">
        <h2>Latest Updates</h2>
        <div class="posts-grid">
            {%- for post in collections.posts | reverse | limit(3) -%}
            <article class="post-card">
                <div class="post-card-header">
                    <time datetime="{{ post.date }}">{{ post.date | readableDate }}</time>
                    {% if post.data.category %}
                    <span class="post-category category-{{ post.data.category | lower }}">{{ post.data.category }}</span>
                    {% endif %}
                </div>
                <h3><a href="{{ post.url }}">{{ post.data.title }}</a></h3>
                <p>{{ post.data.excerpt }}</p>
                <a href="{{ post.url }}" class="read-more">Read more →</a>
            </article>
            {%- endfor -%}
        </div>
        <div class="text-center">
            <a href="/blog" class="btn btn-secondary">View All Posts</a>
        </div>
    </div>
</section>

<section class="contact">
    <div class="container">
        <h2>Get in Touch</h2>
        <p>Have questions? Contact us at <a href="mailto:kwikinvoice@loggedon.co.za">kwikinvoice@loggedon.co.za</a></p>
    </div>
</section>
