---
layout: post
title: "a zero-dollar analytics stack: dbt, duckdb, and github actions"
description: "building a real dbt project that runs for free and publishes to a static site."
---

*part of the conversational analytics build-in-public series*

## outline

- the goal: a live, interactive dashboard on a static site with no servers and no bill
- picking a dataset (fake saas company: accounts, opportunities, subscriptions, product events)
- dbt + duckdb locally: staging → intermediate → marts
- running `dbt build` in github actions and exporting marts to parquet
- querying parquet in the browser with duckdb-wasm (evidence.dev or observable framework)
- what it costs: $0, and the limits (data size, freshness, no secrets in the browser)

## notes

- include the repo link and a screenshot of the dag
- show the github actions timing

