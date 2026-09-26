---
layout: post
title: "why chat-with-your-data tools get the answer wrong"
description: "the problem isn't the model, it's that nobody told it what revenue means."
---

*part of the conversational analytics build-in-public series*

## outline

- the demo vs. reality: "what was revenue last month?" gets three different answers
- why raw text-to-sql breaks: ambiguous columns, fan-out joins, missing filters (test accounts, refunds), no definition of "active"
- a real example from work where two dashboards disagreed (anonymized)
- the fix: give the ai a semantic layer (defined metrics + dimensions) instead of raw tables
- what i'm building next on this site to prove it out

## notes

- keep it opinionated, this is the hook for the whole series
- end with a link to the next post

