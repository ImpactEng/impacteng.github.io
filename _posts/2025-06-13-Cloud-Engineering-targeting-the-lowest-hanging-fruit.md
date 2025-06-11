---
layout: default
title: Cloud Engineering - Targeting the Lowest-Hanging Fruit
description: Learn how to identify and execute quick wins in your cloud infrastructure for immediate cost savings and efficiency gains.
permalink: /blog/cloud-engineering-targeting-the-lowest-hanging-fruit/
author: Nitin Sharma
---

<section class="default-page">
  <header class="page-section animate-fade-in">
    <h1>Quick Wins for Cost Savings Without Major Time or Money</h1>
    <p>Want to make a positive impact in your tech environment without sinking huge time or budget?</p>
    <p>Focus on quick, high-value actions that save costs, streamline operations, or free up engineering effort. By regularly identifying and acting on these opportunities, you can uncover patterns to prevent waste and build leaner, more efficient systems.</p>
  </header>

<!--more-->

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-bullseye"></i> What are quick wins?</h2>
    <p>Quick wins are low-effort, high-impact changes that deliver savings or efficiency. Examples include:</p>
    <ul class="section-list">
      <li><strong>Cost Savings:</strong> Reduce infrastructure or licensing expenses</li>
      <li><strong>Engineering Efficiency:</strong> Eliminate toil to free up time for innovation</li>
      <li><strong>Tool Consolidation:</strong> Streamline tools to lower maintenance overhead</li>
      <li><strong>Documentation:</strong> Create self-service guides for easier troubleshooting</li>
      <li><strong>Lifecycle Management:</strong> Archive or delete unused artifacts (e.g., old AMIs, snapshots, ECR images)</li>
      <li><strong>Security Benefits:</strong> Reduce potential attack surface for malicious actors</li>
    </ul>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fa fa-compass"></i> General Guidance</h2>
    <ul class="section-list">
      <li><strong>Plan Consistently:</strong> Use a single tool (e.g., Excel, Jira, Trello) to track tasks and progress</li>
      <li><strong>Identify Low-Priority Assets:</strong> Target unused, unsupported, or non-critical applications. Ask teams for input to uncover "zombie" resources - those running without a clear purpose or SLA</li>
      <li><strong>Validate Thoroughly:</strong> Confirm each asset's purpose, criticality, and usage (e.g., check logs, CMDB, or Git history)</li>
      <li><strong>Follow Change Management:</strong> Stick to your process (or establish one if absent)</li>
      <li><strong>Communicate Clearly:</strong> Share plans early via multiple channels (Slack, email, meetings). Leverage top-down support and bottom-up advocacy</li>
      <li><strong>Decommission Strategically:</strong> Set soft and hard deletion dates. Ensure short-term restoration and long-term data retrieval options</li>
      <li><strong>Incentivise Participation:</strong> Reward contributors with recognition (e.g., shoutouts, small perks) to make cleanup engaging</li>
    </ul>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-tasks"></i> Implementation Approach</h2>
    <h3>1. Identify Assets</h3>
    <p>Choose an approach:</p>
    <ul>
      <li><strong>Resource-Based:</strong> Group similar resources (e.g., S3 buckets, AMIs, Docker Images, Compute or LBs)</li>
      <li><strong>Application-Based:</strong> Target resources tied to specific apps</li>
    </ul>
    <p>Keep the criteria simple. Review your backlog or ask internal teams for opportunities.</p>
    <h3>2. Validate Resources</h3>
    <ul>
      <li><strong>Purpose:</strong> Check usage metrics, logs, CMDB, or Git history. Ask on Slack for tribal knowledge</li>
      <li><strong>Criticality:</strong> Focus on low-criticality assets to avoid complex approvals or compliance hurdles</li>
      <li><strong>Usage:</strong> Avoid assumptions. Systematically confirm inactivity at each stage (e.g., no recent access or pipeline triggers)</li>
    </ul>
    <h3>3. Communicate</h3>
    <p>Communicate changes proactively. This allows for transparency and prevents pitfalls.</p>
    <h3>4. Take Action</h3>
    <p>Take a balanced approach.</p>
    <a href="{{ site.baseurl }}/assets/images/targeting-the-lowest-hanging-fruit_image1.png" class="zoom-image">
      <img src="{{ site.baseurl }}/assets/images/targeting-the-lowest-hanging-fruit_image1.png" alt="Three-step approach to cloud resource cleanup" class="blog-image">
    </a>
    <p>You may start by restricting access to the asset to prevent usage while you prepare for archival or deletion. Move assets to a low-cost storage tier (e.g., S3 to Glacier) with a lifecycle policy for eventual deletion.</p>
    <p><strong>Delete assets only after confirming no impact. Always retain a restoration path for a reasonable period.</strong></p>
    <h3>5. Track progress</h3>
    <p>Log actions in your planning tool as it will allow to quantify impact and leave a papertrail for the next person.</p>
  </section>

<section class="page-section animate-slide-up">
    <h3>Example Lifecycle Policies</h3>
    <p>S3 bucket lifecycle policy:</p>
    <a href="{{ site.baseurl }}/assets/images/targeting-the-lowest-hanging-fruit_image2.png" class="zoom-image">
      <img src="{{ site.baseurl }}/assets/images/targeting-the-lowest-hanging-fruit_image2.png" alt="S3 bucket lifecycle policy example" class="blog-image">
    </a>
    <p>ECR lifecycle policy:</p>
    <a href="{{ site.baseurl }}/assets/images/targeting-the-lowest-hanging-fruit_image3.png" class="zoom-image">
      <img src="{{ site.baseurl }}/assets/images/targeting-the-lowest-hanging-fruit_image3.png" alt="ECR lifecycle policy example" class="blog-image">
    </a>
</section>

<section class="page-section animate-slide-up">
    <h2><i class="fas fa-chart-line"></i> Reflect and Improve</h2>
    <ul class="section-list">
      <li>
        <p><strong>Run Retrospectives</strong></p>
        <p>After each cleanup, hold a retro to capture lessons learned and refine the process.</p>
        <ul>
          <li>What worked well?</li>
          <li>What blockers emerged?</li>
          <li>How can we prevent waste upfront?</li>
        </ul>
      </li>
      <li>
        <p><strong>Quantify Value</strong></p>
        <p>Document savings and efficiency gains in two formats:</p>
        <ul>
          <li><strong>Detailed Tracker</strong>: For engineers, list specific wins (e.g., “Decommissioned 100 unused AMIs, saving $200/month”).</li>
          <li><strong>One-Pager</strong>: For stakeholders, tell a high-level story (e.g., “Cut costs by $5,000 annually with no impact”).</li>
        </ul>
        <p>Share these wins across engineering, product, and business teams to gain support and resources.</p>
      </li>
      <li>
        <p><strong>Codify Patterns</strong></p>
        <p>Turn repeated findings into principles or, even better, automate them.
        For example, if resources lack lifecycle policies, mandate notifications or auto-archival for S3 objects, AMIs, or EBS snapshots.</p>
      </li>
      <li>
        <p><strong>Schedule Regular Cleanups</strong></p>
        <p>Set a biannual cadence for spring-cleaning. As you mature, automate proactive measures to reduce manual effort.</p>
      </li>
    </ul>
  </section>

  <section class="contact-cta animate-fade-in">
    <h2>Ready to Find Your Quick Wins?</h2>
    <p>Start your optimization journey today. We can help you identify and execute high-impact improvements in your cloud infrastructure.</p>
    <a href="/contact/" class="button-primary">Get Started</a>
  </section>
</section>