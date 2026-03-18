---
layout: post
title: "So I Failed the AWS SA Pro Exam by 17 Points. Then I Built SonicCert Coach."
description: "A post about failing the AWS Solutions Architect Professional exam, hitting a genuine SDK bug at a hackathon, and shipping a multi-agent AI tutor."
permalink: /blog/failed-aws-exam-soniccert/
author: Nitin Sharma
tags: [build-in-public, AWS, certification, hackathon, Amazon Bedrock, multi-agent-ai]
---

<section class="default-page">
  <header class="page-section animate-fade-in">
    <h1>So I Failed the AWS SA Pro Exam by 17 Points. Then I Built SonicCert Coach.</h1>
    <p>I failed the AWS Solutions Architect Professional exam by 17 points. Not 50 points. Not "I didn't study." Seventeen points, after a few months of preparation.</p>
    <p>The root cause wasn't effort. The problem was where that effort went. I kept going deep on the domains I found interesting and avoided drilling the ones which mattered more. The exam does not care what you find interesting. It weights domains. I didn't respect those weights. So I ate dirt.</p>
    <p>A few months later, I went through a run of certification exams across AWS, Azure, GCP, and Oracle, eight or nine over about two to three months. Again, I failed the OCI Data Science Professional exam too, by a small margin. Same mistake, different exam. WTH!</p>
  </header>

<!--more-->

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-graduation-cap"></i> A Note on Why I Bother</h2>
    <p>I get it. Some engineers think certs are noise. I don't fully disagree. But for me, right now, they serve a real purpose. They give structure to a learning path and a clear target when I'm running a business. And they provide an external credibility signal for clients who don't know me yet. I'll take that tool.</p>
    <p>The problem isn't certs. The problem was how I was studying for them. Going deep on interesting topics feels productive. It isn't, when the exam has a blueprint and you're ignoring it.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-hammer"></i> Why a Hackathon</h2>
    <p>When this Amazon Nova AI Hackathon came up, I signed up for a few reasons. I wanted to build something. I've spent a long time in roles where I admired the people who shipped things, and I'm at a point in my career where I want to be one of those people, not just the person who knows how to run the infrastructure underneath it.</p>
    <p>I also wanted to stretch deliberately. Cloud, Infrastructure, Developer tooling come naturally to me. That's not enough for me anymore. Python proficiency, product thinking, solid software engineering chops, building for an end user: these are skills I'm consciously developing. A hackathon with a real deadline felt like the right constraint to force it.</p>
    <p>And I had a specific problem to solve.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-bug"></i> The Nova Sonic Problem</h2>
    <p>The original vision for SonicCert Coach was voice-first. Real-time bidirectional audio: speak to it like a tutor, have it quiz you back, evaluate your answer out loud, and push you toward your weak spots. The name comes from Amazon Nova Sonic, AWS's new audio model.</p>
    <p>I spent the first couple of days trying to make that work. The experimental AWS SDK has a method called <code>invoke_model_with_bidirectional_stream</code>. It hangs. Indefinitely. I tried multiple SDK versions and reproduced it on official AWS sample code. My conclusion: boto3 doesn't support bidirectional streaming yet. It is a genuine bug in early-access infrastructure, or at least that's what I found. I'd be happy to be corrected.</p>
    <p>At some point you have to decide: keep fighting or ship something that works. I pivoted the architecture entirely. The name stayed.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-robot"></i> What I Built</h2>
    <p>SonicCert Coach is a multi-agent AI tutoring system on Amazon Bedrock. Nova Pro runs as the orchestrator: multi-turn reasoning, tool-use routing, session memory. Three specialist agents run on Nova Lite, which is fast and cheap for focused single-shot tasks:</p>
    <ul>
      <li><strong>Question Generator</strong>: creates domain-targeted questions weighted to the real exam blueprint</li>
      <li><strong>Answer Evaluator</strong>: scores your response and explains what was right and wrong</li>
      <li><strong>Study Advisor</strong>: tracks your accuracy by domain and recommends what to drill next</li>
    </ul>
    <p>Grading logic and session memory are plain Python. Deterministic problems don't need a language model. Bedrock's tool-use pattern handles routing: the orchestrator decides which specialist to call, passes the context, gets the result back. It never tries to do everything itself.</p>
    <p>One orchestrator. Three specialists. Two Python tools. Every component has a clear job.</p>
    <p>If you're new to AI, our <a href="/blog/demystifying-ai-for-devops-sre-and-cloud-engineers/">primer on AI fundamentals for DevOps and Cloud engineers</a> covers the building blocks.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-terminal"></i> What Using It Looks Like</h2>
    <p>It's a CLI. You pick a target exam (say, AIF-C01 AWS AI Practitioner), set your proficiency level, and choose batch or interactive mode. The system pulls your prior session data, targets your weakest domains first aligned to the exam's actual weightings, quizzes you, evaluates your answers with explanation, and gives you a domain-by-domain breakdown at the end.</p>
    <p>The <code>weak</code> command cuts to it: here is what you are getting wrong, and here is how that maps to exam weightings. Not what you find interesting. What the exam tests.</p>
    <p>That's the thing I needed and didn't have when I sat that exam.</p>
  </section>

  <section class="page-section animate-slide-up">
    <h2><i class="fas fa-road"></i> Where This Goes</h2>
    <p>I plan to keep working on it. It's not where it needs to be yet. The voice layer is still on the list: I haven't given up on Nova Sonic, I've just parked it until the SDK is actually usable. Session persistence works but it's JSON-based and won't scale if this ever becomes something more than a personal tool. There are product decisions I haven't made yet.</p>
    <p>But it already does the thing I built it to do. It has helped me see where my knowledge has actual gaps. That's worth something on its own.</p>
    <p>No promises on timeline. But I'm not putting it down.</p>
    <p>If you want to see the hackathon submission, it's at <a href="https://devpost.com/software/update_later">devpost.com/software/update_later</a>.</p>
    <blockquote>I created the project intending to rename it before submission. I did everything except that. Support confirmed it can't be changed. Fitting, really.</blockquote>
  </section>

  <section class="contact-cta animate-fade-in">
    <h2>Building Something on Bedrock?</h2>
    <p>Whether you're exploring multi-agent patterns for a personal project or assessing what agentic AI means for your team, <a href="/contact/">get in touch</a> and let's talk through it.</p>
  </section>

</section>
