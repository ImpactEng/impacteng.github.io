---
layout: post
title: "Your Platform Team Is About to Inherit the AI Problem. Most Aren't Ready."
description: "AI workloads are landing on platform teams that weren't built for them. Here's what the dual mandate requires, and where Australian teams stand."
permalink: /blog/platform-teams-ai-problem/
date: 2026-04-27
author: Nitin Sharma
tags: [platform-engineering, AI, agentic-ai, devops, Australia]
---

<section class="default-page">
  <header class="page-section animate-fade-in">
    <h1>Your Platform Team Is About to Inherit the AI Problem. Most Aren't Ready.</h1>
    <p>Gartner forecast in 2024 that 80% of large software engineering organisations would have dedicated platform teams by 2026, up from 45% in 2022. The 2025 <a href="https://dora.dev/dora-report-2025/">DORA (DevOps Research and Assessment) report</a> puts current adoption at nearly 90%. The teams exist. What they're being asked to absorb on top of that is a different question.</p>
    <p>AI workloads.</p>
    <p>Not as a side project. Not as a prototype sitting on someone's laptop or a sandpit cloud account. As a core platform capability, governed, deployed, and maintained with the same rigour as your CI/CD pipeline or your container orchestration layer. Platform engineering and AI are fusing in 2026, and most teams are unprepared for what that actually requires.</p>
  </header>

<!--more-->

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-share-alt"></i> Why Platform Teams Are Getting the AI Problem</h2>
    <p>It's not random. There's a logic to why AI is landing in the platform team's lap.</p>
    <p>Enterprise AI deployment has a governance problem. <a href="https://www.accelirate.com/agentic-ai-governance-crisis/">Accelirate's analysis</a> estimates that governance gaps, not model failures, will drive 40% of enterprise AI project failures by late 2026. A <a href="https://www.strata.io/blog/agentic-identity/the-ai-agent-identity-crisis-new-research-reveals-a-governance-gap/">Cloud Security Alliance survey</a> conducted in late 2025 adds weight to that: nearly 80% of organisations deploying autonomous AI cannot say in real time what those systems are doing or who's accountable for them, 44% authenticate agents with static API keys, and 35% use shared service accounts. These look like AI problems on the surface. Underneath, they're platform engineering problems: identity, observability, governance. They have to be solved on the platform, not in each AI application.</p>
    <p>Weave Intelligence's <a href="https://platformengineering.org/reports/state-of-ai-in-platform-engineering-2025">State of AI in Platform Engineering report</a> (2025) finds three-quarters of organisations are already hosting or preparing to host AI workloads on their platforms. Whether the platform is ready is the harder question.</p>
    <p>For most organisations, the Internal Developer Platform (IDP) is the natural place to absorb AI workloads. It already owns the guardrails, the identity model, the deployment gates, and the observability contract. That's exactly what AI workloads need and almost never have when they're built somewhere else.</p>
    <p>Two caveats. Some organisations are standing up purpose-built "Platforms for AI" alongside their IDP, separating GPU orchestration and model lifecycle from general engineering. And in most large enterprises I've worked in, the "IDP" is closer to a mesh of overlapping platforms with different conventions per team than a coherent single system. Identity, observability, and governance still belong with platform engineering. They can't be enforced consistently when the platform itself isn't.</p>
    <p>The problem is that most platform teams were built to solve CI/CD, containerisation, and developer experience. They were not built to handle inference workloads, agentic orchestration, multi-model cost optimisation, or the governance implications of autonomous systems taking actions in production.</p>
    <p>I wrote in March about <a href="/blog/platform-engineering-australia/">the trap of mandating platform adoption</a>. The same readiness gap shows up here from the other direction: AI work is now being mandated onto platforms whether they're built for it or not.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-balance-scale"></i> What the Dual Mandate Actually Requires</h2>
    <p>Platform engineering maturity in 2026 is being measured against what <a href="https://thenewstack.io/in-2026-ai-is-merging-with-platform-engineering-are-you-ready/">The New Stack recently called a dual mandate</a>: augmenting the platform with AI capabilities while building the platform infrastructure that governs AI workloads at scale.</p>
    <p>Both sides of that mandate are hard.</p>
    <p><strong>Augmenting the platform with AI</strong> means integrating AI coding assistants, predictive automation in CI/CD, and AI-assisted observability. DORA's 2025 research puts AI adoption across software engineering at 90% and finds that AI is an amplifier: it magnifies strength in high-performing teams and dysfunction in struggling ones. The same pattern shows up in the pipeline. Bolting a coding assistant onto a CI workflow is not the same as redesigning the pipeline to be AI-aware: context-managed, hallucination-resistant, and able to gate on confidence rather than just test pass rates.</p>
    <p><strong>Governing AI workloads on the platform</strong> is the harder side. It means the platform team needs to own:</p>
    <p>Circuit breakers for agent pipelines that auto-trip on consecutive failures before errors cascade. Confidence gating logic that routes agent outputs to human review below a threshold rather than auto-executing. Audit trails that track not just what an agent did, but what it believed when it acted, and how those beliefs have changed over time. FinOps (cloud financial management) controls specific to AI: model selection cost gates, token budgeting, and the infrastructure to make smaller, cheaper models default unless larger-model performance is explicitly required.</p>
    <p>None of this is in the platform engineering playbook as it was written three years ago.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-flag"></i> Where Australian Platform Teams Are Starting From</h2>
    <p>The Australian context adds a layer of complexity that global trend reports skip.</p>
    <p>Data residency requirements under the Australian Privacy Act and the government's cloud security policies constrain which AI services can be used for which workloads. You can't just route everything through a US-based inference endpoint. Platform teams in regulated sectors such as financial services, government, and healthcare need to bake data residency into their AI deployment model at the infrastructure level, not as a policy afterthought.</p>
    <p>The skills gap is also acute. AI-capable platform engineers are in short supply globally and more so here. The <a href="https://aws.amazon.com/blogs/aws/aws-weekly-roundup-aws-ai-ml-scholars-program-agent-plugin-for-aws-serverless-and-more-march-30-2026/">AWS AI/ML Scholars program</a>, which opened its 2026 cohort to as many as 100,000 free learners worldwide, is a signal that the hyperscalers recognise the gap. But training 100,000 people in foundational generative AI skills does not produce platform engineers who can design and operate agentic governance infrastructure. That's a different thing.</p>
    <p>A pattern I see: the platform team that handles 40+ deploys a day across environments without breaking a sweat, then stalls when asked who owns the identity for the AI agent their data science team just stood up. The instinct is to treat AI workloads like any other application workload: build it, containerise it, ship it. That instinct fails when the workload can take autonomous actions, when its outputs are probabilistic rather than deterministic, and when its failure modes cascade differently from anything the on-call runbook was written to handle.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-clipboard-check"></i> Practical Takeaway</h2>
    <p>If you lead a platform team and AI workloads are already in your backlog or about to be, three things are worth addressing before you take on more:</p>
    <p><strong>Define your agent identity model.</strong> Every AI agent running on your platform should have a unique, auditable identity. Not a shared service account. Not a static API key. A real identity with scoped permissions and rotation policies. This is the single highest-impact governance improvement and the most commonly skipped.</p>
    <p><strong>Build confidence gating into your deployment pipeline.</strong> AI agent outputs should have a confidence threshold that determines whether they auto-execute, get flagged for human review, or trigger an escalation. This belongs in the platform, not in the individual application.</p>
    <p><strong>Extend your observability contract to cover AI-specific signals.</strong> Token consumption, model latency, confidence score distribution, correction rates, and escalation frequency are the metrics that will tell you whether your AI workloads are healthy. Your existing dashboards don't surface these.</p>
    <p>The platform team that builds the safe foundation for AI workloads in their organisation becomes the team that owns AI adoption at scale. That's a significant opportunity. But it requires acknowledging that the platform engineering playbook needs updating before the AI problem arrives and not after.</p>
  </section>

  <section class="contact-cta animate-fade-in">
    <h2>Ready to Talk?</h2>
    <p>If you're working through this and want a second perspective, get in touch. I've been on the platform team side of this for a decade and now work the AI and platform intersection through ImpactEng. Strategy, hands-on, or both, whichever is most useful.</p>
    <a href="/contact/" class="button-primary">Contact Us</a>
  </section>

</section>
