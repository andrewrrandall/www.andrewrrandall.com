---
layout: post
title: "adding an 'ask the data' box with guardrails"
description: "letting strangers on the internet ask questions of my data without it going off the rails."
---

*part of the conversational analytics build-in-public series*

## outline

- architecture: browser → small serverless function (holds the api key) → llm → metric query → duckdb-wasm in the browser
- why the llm picks metrics + filters instead of writing raw sql
- guardrails: rate limiting, monthly spend cap, allowed metrics only, read-only by design
- showing the work: display the metric + filters it chose so people can trust (or correct) it
- example questions that work, and ones that (intentionally) don't

## notes

- track real questions people ask (anonymized) for a follow-up post

