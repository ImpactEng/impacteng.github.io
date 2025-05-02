---
layout: default
title: Contact Us
description: Get in touch with Impact Eng to discuss how we can help your business unlock its Cloud potential.
permalink: /contact/
---

<section class="default-page">
  <header class="hero animate-fade-in">
    <h1>Contact Us</h1>
    <p class="lead">We’d love to hear from you! Whether you have questions about our services or want to discuss how we can help your business, please reach out.</p>
  </header>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-envelope"></i> Get in Touch</h2>
    <p><strong>Email:</strong> <a href="mailto:{{ site.email }}">{{ site.email }}</a></p>
    <p>Feel free to use the form below to send us a message, and we’ll get back to you as soon as possible.</p>
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
      <button type="submit" class="button-primary">Send Message</button>
    </form>
  </section>
</section>