---
layout: post
title: "The Platform Engineering Trap: Why Mandating Your Platform Makes Things Worse"
description: "Most platform engineering initiatives focus on tooling and adoption targets. Two years of DORA data shows mandated adoption actively reduces delivery performance, and AI makes it worse. Here is what that means for Australian engineering leaders."
permalink: /blog/platform-engineering-australia/
date: 2026-03-19
author: Nitin Sharma
tags: [platform-engineering, DevOps, developer-experience, cloud-engineering, Australia]
---

<section class="default-page">
  <header class="page-section animate-fade-in">
    <h1>The Platform Engineering Trap: Why Mandating Your Platform Makes Things Worse</h1>
    <p>The DORA research programme has now tracked platform engineering across multiple years. The pattern is consistent: good platforms, freely adopted, improve performance. Mandated platforms reduce it. In 2024, across 39,000 practitioners, teams required to exclusively use their internal developer platform saw throughput fall by 8% and change stability fall by 14%.</p>
    <p>The 2025 report did not reverse that finding. It added a sharper edge: when platforms are poorly designed, AI adoption does not offset the damage. It amplifies it.</p>
    <p>This is the trap a significant number of Australian engineering teams are building their way into right now.</p>
  </header>

<!--more-->

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-layer-group"></i> What Platform Engineering Is Supposed to Do</h2>
    <p>Platform engineering emerged as an answer to a real problem. As organisations scaled, the DevOps ideal of "you build it, you run it" started to break under its own weight. Product teams were expected to manage Kubernetes, observability, security, secret management, cost tagging, and compliance tooling, on top of shipping features. The cognitive load became the bottleneck.</p>
    <p>Platform engineering resolves this by building internal infrastructure as a product. A dedicated platform team creates curated, maintained pathways ("golden paths") that developers use because they genuinely reduce friction, not because they are required to. The goal is to take decisions off product teams' plates, not to recentralise control under a new name.</p>
    <p>That is the theory. The practice has drifted considerably from it in a large number of organisations. And in Australia, the problem is concrete: 532 banking outages totalling nearly 1,500 hours in 30 months (RBA, 2024), a single CrowdStrike software update in July 2024 that simultaneously brought down banks, telcos, and airlines, and 69% of tech leaders reporting weekly disruptions from foundational IT flaws, twelve points above the global average (KPMG, 2024). The platform layer, where it exists at all, is not solid.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-exclamation-triangle"></i> Where It Goes Wrong</h2>
    <p>The mandate problem is the most data-supported trap, but it is not the only one.</p>
    <p>The portal trap came first. Between 2022 and 2024, many organisations treated Backstage, the CNCF developer portal framework, as synonymous with "building a platform." Teams spent 12 to 18 months implementing portals. The portal surfaces what the platform offers. But if the underlying orchestration layer, deployment abstractions, and service ownership model are not there, the portal is a catalogue with empty shelves. Developers open it once and stop coming back. The <a href="/blog/ai-agents-breaking-cicd/">agentic systems now running in your CI/CD pipelines</a> expose this gap quickly. They assume coherent, queryable infrastructure and find a patchwork instead.</p>
    <p>The measurement trap follows. According to the State of Platform Engineering 2024 report, 45% of platform teams do not measure success at all. A further 26% cannot determine whether their metrics improved after implementing their platform. When adoption stalls and the platform team cannot demonstrate why the investment is worth continuing, the response is often to mandate adoption, which is precisely how you arrive at the DORA outcome.</p>
    <p>The mandate trap is the terminal stage of this sequence. The platform team, under pressure to show adoption numbers, requires product teams to use the platform. Product teams, who were not involved in the platform's design and are now blocked on existing workflows, experience it as a constraint rather than a capability. Throughput falls. Confidence in the initiative falls. Budget follows shortly after.</p>
    <p>The DORA finding is sometimes misread as "mandates are always wrong." They are not. I have been on the platform team side of this: hands-on pairing with leads and seniors, competing visions surfaced and addressed, a clear technical case for the new direction. The teams eventually understood. We still needed a hard block to get there. What DORA is capturing is mandates that substitute for that groundwork, not mandates that follow it.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-map"></i> Why This Hits Australian Teams Harder</h2>
    <p>There is no Australian-specific platform engineering adoption survey. No ANZ equivalent of the DORA report, no local breakdown in the platformengineering.org State of Platform Engineering study. Australian engineering leaders are navigating this without local benchmarks, which makes it harder to know whether your experience of these traps is common or exceptional.</p>
    <p>The talent picture makes the organisational dynamics particularly difficult. Platform engineering is a senior discipline: 47% of platform engineers globally have more than eleven years of experience (State of Platform Engineering 2024, platformengineering.org). Australian tech attrition sits at 19.2%, above the 17% global average (Ravio, 2025). Organisations are competing for a small pool of senior people who leave at above-average rates. You cannot hire your way to platform maturity. And when the person who built the platform leaves, the initiative often leaves with them.</p>
    <p>ThoughtWorks Australia has written specifically about the political blockers in Australian-context organisations: the silo effect (platforms do not cross departmental lines, adding complexity rather than removing it), the cost-centre perception (platform teams funded as operational overhead rather than value drivers), and the single-champion dependency (the initiative stalls when the champion departs). All three are structural, not technical. Tooling does not fix them.</p>
    <p>The one clear Australian counterexample is Commonwealth Bank. CBA was processing 3,000 production changes per month at the point they committed to platform engineering as a product discipline (Atlassian, 2024). By AWS re:Invent 2024, their CTO reported doubling that in a single year, while reducing incident volume and duration (AWS re:Invent ARC206; iTnews, 2024). The critical detail is how: their engineering platform team operates with a defined north star, tracks developer experience metrics, and measures adoption of internal tooling. It was built around what engineers actually needed, not presented as infrastructure they were required to use.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-check-circle"></i> What Gets Out of the Trap</h2>
    <p>The organisations with working platform engineering practices share a few consistent patterns.</p>
    <p>They start with developer pain, not tooling selection. They survey developers, talk to product teams, and find the three things that slow developers down most. The platform addresses those things first. The result is that developers want to use it, which generates adoption data that justifies continued investment without needing a mandate.</p>
    <p>They measure adoption, not existence. Platform uptime is the wrong metric. I know because I have tracked it. Uptime tells you the lights are on. It says nothing about whether anyone is using the room. The right ones are: what percentage of new services use the standard pipeline? What is the time-to-deploy for a new service started from scratch? How many support requests does the platform team handle for self-service capabilities? These metrics distinguish a platform people use from a platform people have been told to use.</p>
    <p>They protect developer autonomy. Golden paths are suggestions backed by investment, not mandates. The paved road is more convenient than going off-road: better documentation, faster setup, proven security controls. Adoption can happen through pull, not push. Teams that can demonstrate this to executives do not necessarily need to mandate anything. The adoption data speaks for itself.</p>
    <p>And they get executive sponsorship that is not personality-dependent. The CBA example took years and sustained commitment at the leadership level. Organisations that treat platform engineering as a single champion's initiative will cycle through the trap repeatedly.</p>
  </section>

  <section class="contact-cta animate-fade-in">
    <p>ImpactEng works with Australian engineering teams on platform engineering assessments, tooling decisions, and organisational design. Platform maturity is also a core dimension of AI readiness: you cannot reliably run agentic systems on a fragile foundation. If you want to understand where your team sits across both, an <a href="/services/ai-readiness-audit/">AI Readiness Audit</a> covers that directly. Or <a href="/contact/">get in touch</a> to start with a conversation.</p>
  </section>

</section>
