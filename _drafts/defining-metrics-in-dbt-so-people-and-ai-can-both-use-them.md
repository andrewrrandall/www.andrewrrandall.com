---
layout: post
title: "defining metrics in dbt so people and ai can both use them"
description: "the semantic layer is the contract between your data and anything that asks it questions."
---

*part of the conversational analytics build-in-public series*

## outline

- what a semantic layer actually is (without the vendor pitch)
- defining semantic models, measures, dimensions, and metrics in dbt (metricflow yaml)
- examples from the demo: arr, net revenue retention, win rate, pipeline created
- descriptions matter: writing metric docs for humans and llms at the same time
- testing metrics so they don't silently drift

## notes

- side-by-side: the same question answered with raw sql vs. a defined metric

