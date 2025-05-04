---
layout: default
title: Blog
description: Insights on systems engineering, DevOps, and cloud engineering.
permalink: /blog/
---

<section class="default-page">
  <header class="hero animate-fade-in">
    <h1>Our Blog</h1>
    <p class="lead">Insights on Cloud engineering, DevOps, Agile, and Team-building for modern engineering teams.</p>
  </header>

  <section class="post-section animate-slide-up">
    <h2><i class="fas fa-book"></i> Latest Posts</h2>
    {% for post in site.posts %}
      <hr>
      <br>
      <article class="post-preview">
        <h3><a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a></h3>
        <p class="post-meta">Posted on {{ post.date | date: site.minima.date_format }}</p>
        <p>{{ post.excerpt }}</p>
        <a href="{{ post.url | relative_url }}" class="button-primary">Read More</a>
      </article>
    {% endfor %}
  </section>

  <section class="contact-cta animate-fade-in">
    <h2>Have Questions or Ideas?</h2>
    <p>We’d love to hear your thoughts or collaborate on new topics. Reach out to us today!</p>
    <a href="/contact/" class="button-primary">Contact Us</a>
  </section>
</section>