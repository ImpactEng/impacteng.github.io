---
layout: default
title: Contact Us
description: Get in touch with ImpactEng to discuss an AI Readiness Audit, Cloud or DevOps challenge, or find out if we are the right fit.
permalink: /contact/
---

<section class="default-page">
  <header class="hero animate-fade-in">
    <h1>Let's talk.</h1>
    <p class="lead">Whether you want to explore an AI Readiness Audit, discuss a Cloud or DevOps challenge, or just find out if we are the right fit, reach out.</p>
  </header>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-calendar-check"></i> Book a Discovery Call</h2>
    <p>Pick a 30-minute slot that works for you. No obligation, no sales pitch.</p>
    <a href="{{ site.booking_url }}" class="button-primary" target="_blank" rel="noopener">Book a 30-Minute Call</a>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-envelope"></i> Prefer Email?</h2>
    <p><a href="mailto:{{ site.email }}">{{ site.email }}</a></p>
    <p>Or use the form below and we will get back to you within one business day.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-paper-plane"></i> Contact Form</h2>
    <form action="https://formspree.io/f/xovdjgpr" method="POST" class="contact-form">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="5" required></textarea>
      </div>
      <div style="display:none;" aria-hidden="true">
        <label for="website">Website (leave blank)</label>
        <input type="url" id="website" name="_gotcha" tabindex="-1" autocomplete="off">
      </div>
      <button type="submit" class="button-primary">Send Message</button>
    </form>
  </section>
</section>
