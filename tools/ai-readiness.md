---
layout: default
title: "AI Readiness Assessment"
description: "24 statements across the six dimensions that predict whether AI agents succeed or stall in production. See your radar chart instantly. No waiting."
permalink: /tools/ai-readiness/
---

<style>
.likert-item {
  margin: 1.5rem 0;
  padding: 1rem 1.25rem;
  background: #f8f9fa;
  border-radius: 4px;
  border-left: 3px solid #e0e0e0;
}
.likert-question {
  margin: 0 0 0.85rem 0;
  font-weight: 500;
  line-height: 1.55;
}
.likert-scale {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  flex-wrap: wrap;
}
.likert-scale .scale-label {
  font-size: 0.8rem;
  color: #666;
  white-space: nowrap;
}
.likert-scale .scale-options {
  display: flex;
  gap: 1rem;
}
.likert-scale label {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.3rem;
  cursor: pointer;
  font-size: 0.9rem;
  font-weight: 500;
}
.likert-scale input[type="radio"] {
  cursor: pointer;
  width: 18px;
  height: 18px;
}
.form-field {
  margin: 1.25rem 0;
}
.form-field label {
  display: block;
  font-weight: 500;
  margin-bottom: 0.4rem;
}
.form-field input[type="email"],
.form-field input[type="text"] {
  width: 100%;
  max-width: 420px;
  padding: 0.6rem 0.85rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 1rem;
  font-family: inherit;
}
.form-error {
  color: #c0392b;
  font-size: 0.9rem;
  margin-top: 0.5rem;
  display: none;
}
#results {
  display: none;
}
.score-headline {
  margin-bottom: 0.25rem;
  font-size: 1rem;
  color: #555;
}
.score-percentage {
  font-size: 2.8rem;
  font-weight: 700;
  color: #2c3e50;
  line-height: 1.1;
}
.score-band-label {
  font-size: 1rem;
  color: #555;
  margin-top: 0.25rem;
}
.chart-container {
  max-width: 460px;
  margin: 2rem auto;
  overflow: visible;
}
.dimension-breakdown {
  list-style: none;
  padding: 0;
  margin: 1rem 0 2rem;
}
.dimension-breakdown li {
  display: flex;
  align-items: center;
  padding: 0.5rem 0;
  border-bottom: 1px solid #eee;
  gap: 0.75rem;
}
.dim-name {
  min-width: 170px;
  font-size: 0.9rem;
}
.dim-bar-wrap {
  flex: 1;
  background: #eee;
  border-radius: 4px;
  height: 8px;
}
.dim-bar {
  height: 8px;
  background: #2980b9;
  border-radius: 4px;
  transition: width 0.6s ease;
}
.dim-pct {
  min-width: 38px;
  text-align: right;
  font-size: 0.9rem;
  font-weight: 500;
}
.cta-band {
  border-left: 4px solid #2980b9;
  padding: 1rem 1.25rem;
  background: #f0f7fd;
  border-radius: 0 4px 4px 0;
  margin: 1.5rem 0 2rem;
  line-height: 1.6;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render={{ site.recaptcha_site_key }}"></script>

<section class="default-page">
  <header class="hero animate-fade-in">
    <h1>AI Readiness Assessment</h1>
    <p class="lead">24 statements across the six dimensions that predict whether AI agents succeed or stall in production. Rate your organisation honestly. Takes 5 to 8 minutes. Results and radar chart appear immediately.</p>
  </header>

  <section class="page-section animate-slide-up">
    <p><strong>How to score:</strong> Rate each statement from 1 (not in place) to 5 (fully in place). If you are unsure, rate lower. The results are for your benefit.</p>
  </section>

  <form id="assessment-form" novalidate>

    <!-- Dimension 1 -->
    <section class="page-section animate-slide-up delay-1">
      <h2>1. Cloud Infrastructure</h2>
      <p>Can your cloud environment support AI agent workloads reliably and cost-effectively?</p>

      <div class="likert-item">
        <p class="likert-question">Infrastructure is defined and managed as code (Terraform, Pulumi, or CloudFormation), with changes deployed through a reviewed pipeline.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q1" value="1" required> 1</label>
            <label><input type="radio" name="q1" value="2"> 2</label>
            <label><input type="radio" name="q1" value="3"> 3</label>
            <label><input type="radio" name="q1" value="4"> 4</label>
            <label><input type="radio" name="q1" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Logs, metrics, and distributed traces are collected across cloud workloads, with alerts configured for key failure modes.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q2" value="1" required> 1</label>
            <label><input type="radio" name="q2" value="2"> 2</label>
            <label><input type="radio" name="q2" value="3"> 3</label>
            <label><input type="radio" name="q2" value="4"> 4</label>
            <label><input type="radio" name="q2" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Security scanning is integrated into CI/CD, and cloud resources are checked regularly for misconfigurations and compliance drift.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q3" value="1" required> 1</label>
            <label><input type="radio" name="q3" value="2"> 2</label>
            <label><input type="radio" name="q3" value="3"> 3</label>
            <label><input type="radio" name="q3" value="4"> 4</label>
            <label><input type="radio" name="q3" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Cloud costs are tracked at the team or workload level, with budgets, tagging, and anomaly alerts in place.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q4" value="1" required> 1</label>
            <label><input type="radio" name="q4" value="2"> 2</label>
            <label><input type="radio" name="q4" value="3"> 3</label>
            <label><input type="radio" name="q4" value="4"> 4</label>
            <label><input type="radio" name="q4" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>
    </section>

    <!-- Dimension 2 -->
    <section class="page-section animate-slide-up delay-2">
      <h2>2. Data Quality and Pipelines</h2>
      <p>Is your data accessible, trustworthy, and governed well enough to power AI agents?</p>

      <div class="likert-item">
        <p class="likert-question">Data pipelines run with defined SLOs, and failures are detected before they affect downstream systems.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q5" value="1" required> 1</label>
            <label><input type="radio" name="q5" value="2"> 2</label>
            <label><input type="radio" name="q5" value="3"> 3</label>
            <label><input type="radio" name="q5" value="4"> 4</label>
            <label><input type="radio" name="q5" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Automated quality checks catch missing, malformed, or out-of-range data before it reaches production AI systems.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q6" value="1" required> 1</label>
            <label><input type="radio" name="q6" value="2"> 2</label>
            <label><input type="radio" name="q6" value="3"> 3</label>
            <label><input type="radio" name="q6" value="4"> 4</label>
            <label><input type="radio" name="q6" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">PII is identified, classified, and handled consistently, with access controls and audit logging enforced across data systems.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q7" value="1" required> 1</label>
            <label><input type="radio" name="q7" value="2"> 2</label>
            <label><input type="radio" name="q7" value="3"> 3</label>
            <label><input type="radio" name="q7" value="4"> 4</label>
            <label><input type="radio" name="q7" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Data lineage is tracked for key datasets — you can trace where data came from and how it was transformed before reaching an AI model.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q8" value="1" required> 1</label>
            <label><input type="radio" name="q8" value="2"> 2</label>
            <label><input type="radio" name="q8" value="3"> 3</label>
            <label><input type="radio" name="q8" value="4"> 4</label>
            <label><input type="radio" name="q8" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>
    </section>

    <!-- Dimension 3 -->
    <section class="page-section animate-slide-up delay-3">
      <h2>3. DevOps and MLOps</h2>
      <p>Can your team deploy AI model changes safely and frequently?</p>

      <div class="likert-item">
        <p class="likert-question">CI/CD pipelines cover both application code and AI model changes, with automated testing before every deployment.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q9" value="1" required> 1</label>
            <label><input type="radio" name="q9" value="2"> 2</label>
            <label><input type="radio" name="q9" value="3"> 3</label>
            <label><input type="radio" name="q9" value="4"> 4</label>
            <label><input type="radio" name="q9" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">The team deploys to production multiple times per week and can roll back a failed deployment within minutes.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q10" value="1" required> 1</label>
            <label><input type="radio" name="q10" value="2"> 2</label>
            <label><input type="radio" name="q10" value="3"> 3</label>
            <label><input type="radio" name="q10" value="4"> 4</label>
            <label><input type="radio" name="q10" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">AI model versions are tracked in a registry, and rolling back to a previous model version is a routine, tested operation.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q11" value="1" required> 1</label>
            <label><input type="radio" name="q11" value="2"> 2</label>
            <label><input type="radio" name="q11" value="3"> 3</label>
            <label><input type="radio" name="q11" value="4"> 4</label>
            <label><input type="radio" name="q11" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">There is a documented and tested process for responding to AI model failures or degraded performance in production.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q12" value="1" required> 1</label>
            <label><input type="radio" name="q12" value="2"> 2</label>
            <label><input type="radio" name="q12" value="3"> 3</label>
            <label><input type="radio" name="q12" value="4"> 4</label>
            <label><input type="radio" name="q12" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>
    </section>

    <!-- Dimension 4 -->
    <section class="page-section animate-slide-up">
      <h2>4. Team Capability</h2>
      <p>Does your team have the skills, ownership, and leadership literacy to run AI agents in production?</p>

      <div class="likert-item">
        <p class="likert-question">The engineering team includes people with hands-on AI/ML experience beyond prompt engineering or basic API integration.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q13" value="1" required> 1</label>
            <label><input type="radio" name="q13" value="2"> 2</label>
            <label><input type="radio" name="q13" value="3"> 3</label>
            <label><input type="radio" name="q13" value="4"> 4</label>
            <label><input type="radio" name="q13" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">A named person is accountable for AI adoption outcomes, with the authority to make decisions and clear success criteria.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q14" value="1" required> 1</label>
            <label><input type="radio" name="q14" value="2"> 2</label>
            <label><input type="radio" name="q14" value="3"> 3</label>
            <label><input type="radio" name="q14" value="4"> 4</label>
            <label><input type="radio" name="q14" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Leadership can articulate which AI investments are in flight, what the expected outcomes are, and what is currently blocking progress.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q15" value="1" required> 1</label>
            <label><input type="radio" name="q15" value="2"> 2</label>
            <label><input type="radio" name="q15" value="3"> 3</label>
            <label><input type="radio" name="q15" value="4"> 4</label>
            <label><input type="radio" name="q15" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Engineering, product, data, and operations teams are actively collaborating on AI delivery, not working in separate tracks.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q16" value="1" required> 1</label>
            <label><input type="radio" name="q16" value="2"> 2</label>
            <label><input type="radio" name="q16" value="3"> 3</label>
            <label><input type="radio" name="q16" value="4"> 4</label>
            <label><input type="radio" name="q16" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>
    </section>

    <!-- Dimension 5 -->
    <section class="page-section animate-slide-up">
      <h2>5. Governance</h2>
      <p>Are you managing the risks of AI agents systematically?</p>

      <div class="likert-item">
        <p class="likert-question">A published AI governance policy covers acceptable use, risk management, and who has authority to approve AI deployments.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q17" value="1" required> 1</label>
            <label><input type="radio" name="q17" value="2"> 2</label>
            <label><input type="radio" name="q17" value="3"> 3</label>
            <label><input type="radio" name="q17" value="4"> 4</label>
            <label><input type="radio" name="q17" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Decisions and actions taken by AI agents are logged with enough detail to audit, investigate, and explain them after the fact.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q18" value="1" required> 1</label>
            <label><input type="radio" name="q18" value="2"> 2</label>
            <label><input type="radio" name="q18" value="3"> 3</label>
            <label><input type="radio" name="q18" value="4"> 4</label>
            <label><input type="radio" name="q18" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Regulatory obligations related to AI have been formally assessed, including APRA CPS 230, VAISS, and ISO 42001 where relevant.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q19" value="1" required> 1</label>
            <label><input type="radio" name="q19" value="2"> 2</label>
            <label><input type="radio" name="q19" value="3"> 3</label>
            <label><input type="radio" name="q19" value="4"> 4</label>
            <label><input type="radio" name="q19" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Human review is required before AI agents take action in high-risk or high-consequence scenarios, and this is enforced, not just policy.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q20" value="1" required> 1</label>
            <label><input type="radio" name="q20" value="2"> 2</label>
            <label><input type="radio" name="q20" value="3"> 3</label>
            <label><input type="radio" name="q20" value="4"> 4</label>
            <label><input type="radio" name="q20" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>
    </section>

    <!-- Dimension 6 -->
    <section class="page-section animate-slide-up">
      <h2>6. Strategic Alignment</h2>
      <p>Is there a clear, prioritised AI plan connected to business outcomes?</p>

      <div class="likert-item">
        <p class="likert-question">The top AI use cases have been prioritised by measurable business value, not by vendor recommendation or team enthusiasm.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q21" value="1" required> 1</label>
            <label><input type="radio" name="q21" value="2"> 2</label>
            <label><input type="radio" name="q21" value="3"> 3</label>
            <label><input type="radio" name="q21" value="4"> 4</label>
            <label><input type="radio" name="q21" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">There is an agreed ROI model or measurable success metric for the highest-priority AI initiative, with a baseline to compare against.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q22" value="1" required> 1</label>
            <label><input type="radio" name="q22" value="2"> 2</label>
            <label><input type="radio" name="q22" value="3"> 3</label>
            <label><input type="radio" name="q22" value="4"> 4</label>
            <label><input type="radio" name="q22" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Board or executive leadership has endorsed a specific AI plan with milestones, named owners, and a reporting cadence.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q23" value="1" required> 1</label>
            <label><input type="radio" name="q23" value="2"> 2</label>
            <label><input type="radio" name="q23" value="3"> 3</label>
            <label><input type="radio" name="q23" value="4"> 4</label>
            <label><input type="radio" name="q23" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>

      <div class="likert-item">
        <p class="likert-question">Progress against AI milestones is tracked and reported to leadership on a regular cadence, with outcomes measured against the original business case.</p>
        <div class="likert-scale">
          <span class="scale-label">Not in place</span>
          <div class="scale-options">
            <label><input type="radio" name="q24" value="1" required> 1</label>
            <label><input type="radio" name="q24" value="2"> 2</label>
            <label><input type="radio" name="q24" value="3"> 3</label>
            <label><input type="radio" name="q24" value="4"> 4</label>
            <label><input type="radio" name="q24" value="5"> 5</label>
          </div>
          <span class="scale-label">Fully in place</span>
        </div>
      </div>
    </section>

    <!-- Email gate -->
    <section class="page-section animate-slide-up">
      <h2>Get your results</h2>
      <p>Enter your email to see your score and radar chart. Your results will also be emailed to you.</p>
      <div class="form-field">
        <label for="resp-email">Work email <span style="color:#c0392b">*</span></label>
        <input type="email" id="resp-email" name="email" placeholder="you@company.com" required>
      </div>
      <div class="form-field">
        <label for="resp-org">Organisation <span style="font-weight:normal;color:#888">(optional)</span></label>
        <input type="text" id="resp-org" name="org" placeholder="Company name">
      </div>
      <p class="form-error" id="form-error"></p>
      <div style="display:flex;gap:1rem;align-items:center;margin-top:1rem;flex-wrap:wrap;">
        <button type="submit" class="button-primary">See my results</button>
        <button type="button" id="reset-btn" style="background:none;border:1px solid #aaa;border-radius:5px;padding:0.75rem 1.5rem;cursor:pointer;color:#555;font-size:1rem;">Reset</button>
      </div>
    </section>

  </form>

  <!-- Results (hidden until submission) -->
  <section id="results" class="page-section">
    <h2>Your Results</h2>

    <p class="score-headline">Overall readiness score</p>
    <div class="score-percentage" id="total-score-display"></div>
    <p class="score-band-label" id="band-label"></p>

    <div class="chart-container">
      <canvas id="radar-chart"></canvas>
    </div>

    <h3>Dimension breakdown</h3>
    <ul class="dimension-breakdown" id="dimension-breakdown"></ul>

    <div class="cta-band" id="score-cta"></div>

    <a href="{{ site.booking_url }}" class="button-primary" target="_blank" rel="noopener">Book a Free 45-Minute Diagnostic Conversation</a>
  </section>

</section>

<script>
(function () {
  var MAX_SCORE = 120;
  var DIMENSIONS = [
    { name: 'Cloud Infrastructure', questions: ['q1','q2','q3','q4'] },
    { name: 'Data Quality & Pipelines', questions: ['q5','q6','q7','q8'] },
    { name: 'DevOps & MLOps',          questions: ['q9','q10','q11','q12'] },
    { name: 'Team Capability',      questions: ['q13','q14','q15','q16'] },
    { name: 'Governance',           questions: ['q17','q18','q19','q20'] },
    { name: 'Strategic Alignment',  questions: ['q21','q22','q23','q24'] }
  ];

  var formspreeEndpoint = "{{ site.formspree_endpoint }}";
  var radarChart = null;
  var STORAGE_KEY = 'ai-readiness-draft';

  function saveState() {
    var state = {};
    for (var i = 1; i <= 24; i++) {
      var checked = document.querySelector('input[name="q' + i + '"]:checked');
      if (checked) state['q' + i] = checked.value;
    }
    try { localStorage.setItem(STORAGE_KEY, JSON.stringify(state)); } catch (e) {}
  }

  function restoreState() {
    try {
      var saved = localStorage.getItem(STORAGE_KEY);
      if (!saved) return;
      var state = JSON.parse(saved);
      Object.keys(state).forEach(function (name) {
        var input = document.querySelector('input[name="' + name + '"][value="' + state[name] + '"]');
        if (input) input.checked = true;
      });
    } catch (e) {}
  }

  restoreState();

  document.getElementById('assessment-form').addEventListener('change', function (e) {
    if (e.target.type === 'radio') saveState();
  });

  document.getElementById('reset-btn').addEventListener('click', function () {
    try { localStorage.removeItem(STORAGE_KEY); } catch (e) {}
    document.getElementById('assessment-form').reset();
    document.getElementById('form-error').style.display = 'none';
    document.getElementById('results').style.display = 'none';
  });

  document.getElementById('assessment-form').addEventListener('submit', function (e) {
    e.preventDefault();
    var form = e.target;
    var errorEl = document.getElementById('form-error');

    // Validate all 24 questions answered
    var unanswered = [];
    for (var i = 1; i <= 24; i++) {
      if (!form.querySelector('input[name="q' + i + '"]:checked')) unanswered.push(i);
    }
    if (unanswered.length > 0) {
      errorEl.textContent = 'Questions ' + unanswered.join(', ') + ' are not yet answered.';
      errorEl.style.display = 'block';
      errorEl.scrollIntoView({ behavior: 'smooth', block: 'center' });
      return;
    }
    errorEl.style.display = 'none';

    var emailInput = document.getElementById('resp-email');
    if (!emailInput.checkValidity()) {
      emailInput.reportValidity();
      return;
    }

    // Calculate scores
    var dimScores = DIMENSIONS.map(function (dim) {
      return dim.questions.reduce(function (sum, q) {
        var checked = form.querySelector('input[name="' + q + '"]:checked');
        return sum + (checked ? parseInt(checked.value, 10) : 0);
      }, 0);
    });

    var totalScore = dimScores.reduce(function (a, b) { return a + b; }, 0);
    var totalPct = Math.round((totalScore / MAX_SCORE) * 100);
    var dimPcts = dimScores.map(function (s) { return Math.round((s / 20) * 100); });

    // Score band
    var band;
    if (totalPct < 50) {
      band = {
        label: 'Foundational',
        text: 'Significant gaps exist before AI agent deployment is viable. The priority is getting infrastructure and data foundations right. A diagnostic conversation will help you identify where to start and what to fix first.'
      };
    } else if (totalPct < 75) {
      band = {
        label: 'Developing',
        text: 'You have foundations in place but targeted gaps in one or more dimensions will block production deployment. A structured audit will identify the critical path and what to address first.'
      };
    } else {
      band = {
        label: 'Close to production-ready',
        text: 'You are close. One or two dimensions are holding you back. Targeted intervention can get you to production-ready within 90 days.'
      };
    }

    // Render score
    document.getElementById('total-score-display').textContent = totalPct + '%';
    document.getElementById('band-label').textContent = band.label;

    // Dimension breakdown
    var breakdownEl = document.getElementById('dimension-breakdown');
    breakdownEl.innerHTML = '';
    DIMENSIONS.forEach(function (dim, i) {
      var li = document.createElement('li');
      li.innerHTML =
        '<span class="dim-name">' + dim.name + '</span>' +
        '<div class="dim-bar-wrap"><div class="dim-bar" style="width:' + dimPcts[i] + '%"></div></div>' +
        '<span class="dim-pct">' + dimPcts[i] + '%</span>';
      breakdownEl.appendChild(li);
    });

    // CTA
    document.getElementById('score-cta').innerHTML =
      '<strong>' + band.label + ':</strong> ' + band.text;

    // Radar chart
    var ctx = document.getElementById('radar-chart').getContext('2d');
    if (radarChart) { radarChart.destroy(); }
    radarChart = new Chart(ctx, {
      type: 'radar',
      data: {
        labels: DIMENSIONS.map(function (d) { return d.name; }),
        datasets: [{
          label: 'Your Score',
          data: dimPcts,
          fill: true,
          backgroundColor: 'rgba(41, 128, 185, 0.15)',
          borderColor: 'rgba(41, 128, 185, 0.85)',
          pointBackgroundColor: 'rgba(41, 128, 185, 0.9)',
          pointRadius: 4
        }]
      },
      options: {
        scales: {
          r: {
            min: 0,
            max: 100,
            ticks: { stepSize: 25, font: { size: 11 } },
            pointLabels: { font: { size: 12 } }
          }
        },
        plugins: { legend: { display: false } }
      }
    });

    // Show results and scroll
    var resultsEl = document.getElementById('results');
    resultsEl.style.display = 'block';
    resultsEl.scrollIntoView({ behavior: 'smooth' });

    // Formspree submission (silent fail — results already shown)
    if (formspreeEndpoint) {
      var payload = {
        email: emailInput.value,
        organisation: document.getElementById('resp-org').value,
        total_score_percentage: totalPct,
        score_band: band.label
      };
      DIMENSIONS.forEach(function (dim, i) {
        payload[dim.name.toLowerCase().replace(/[\s]+/g, '_') + '_pct'] = dimPcts[i];
      });
      var siteKey = "{{ site.recaptcha_site_key }}";
      grecaptcha.ready(function () {
        grecaptcha.execute(siteKey, { action: 'submit' }).then(function (token) {
          payload['g-recaptcha-response'] = token;
          fetch(formspreeEndpoint, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
            body: JSON.stringify(payload)
          }).catch(function () {});
        });
      });
    }
  });
}());
</script>
