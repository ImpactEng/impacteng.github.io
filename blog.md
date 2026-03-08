---
layout: default
title: Blog
description: Insights on Cloud infrastructure, DevOps, AI readiness, and building engineering teams that ship.
permalink: /blog/
---

<section class="default-page">
  <header class="hero animate-fade-in">
    <h1>Our Blog</h1>
    <p class="lead">Insights on Cloud infrastructure, DevOps, AI readiness, and building engineering teams that ship.</p>
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
    <h2>Want to talk about what you are working on?</h2>
    <p>We are always happy to discuss Cloud, DevOps, and AI readiness challenges. No obligation.</p>
    <a href="/contact/" class="button-primary">Get in Touch</a>
  </section>
</section>
