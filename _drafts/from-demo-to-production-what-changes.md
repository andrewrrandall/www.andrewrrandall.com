---
layout: post
title: "from demo to production: what changes"
description: "the demo runs for free on a static site. here's what it takes to run this for a real company."
---

*part of the conversational analytics build-in-public series*

## outline

- what the demo skips: real sources (salesforce, product db, stripe), freshness, access control, pii
- swapping duckdb for snowflake, github actions for prefect/dagster
- ci/cd, testing, and cost controls (lessons from cutting $200k/yr off snowflake)
- governance for ai questions: who can ask what, auditing answers
- rough timeline and team size to get there

## notes

- this is the "hire me" post; link to /work-with-me.html at the end

