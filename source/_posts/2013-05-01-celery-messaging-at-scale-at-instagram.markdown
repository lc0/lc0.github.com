---
layout: post
title: "Celery messaging at scale at Instagram"
date: 2013-05-01 15:27
comments: true
categories: [celery, python, scaling, rabbithq, pycon2013]
---

Interesting talk by an infrastructure engineer from Instagram.
Described idea of feed generation at scale from different points of view, starting with simple and very expensive O(∞),
after with Gearman & Python solutions and finally based on Celery and RabbitMQ. Considered different brokers to have reasonably fast time of response from one point
and also good replication and even chunking from another. Good overview of configuring Celery for big scale with different routings, queues and concurrency levels.

{% speakerdeck 057d90a07156013098d412313918245d %}

<!--more-->

And the video of the talk by Rick Branson, Infrastructure Engineer at Instagram
{% youtube E708csv4XgY %}



###Outline
####I. Concepts
 * A Brief History of Messaging and Queues
 * The 3 Messaging Topologies
 * Messaging Pattern: Request-Reply (RPC)
 * Messaging Pattern: Publish/Subscribe
 * Messaging Pattern: Push-Pull (Workers)
 * Why use a message broker anyway?

####II. Workers at Instagram
 * Use Case #1: Feed Delivery
 * Other Use Cases
 * Then: Gearman
 * Gearman in Python: Coding & Testing
 * Gearman in Production: Monitoring & what goes wrong?
 * Now: RabbitMQ & Celery
 * Celery in Python: Coding & Testing
 * RabbitMQ in Production: Monitoring, Availability, Scaling, Fault Tolerance, and What Goes Wrong
 * Our Hacks on Celery
 * Message Flow, Priority, and QoS
 * Fault Tolerance: Retries and Crash Safety
 * Concurrency & The Dark Magic of Evented Workers

####III. Alternatives
 * Not Everything is Crucial
 * Engineering Trade-Offs: Cost & Performance vs Correctness
 * The Hail-Mary: UDP & Python, Use Cases
 * The Event Bus
 * Real-Time Web Delivery
 * Why not use ...?