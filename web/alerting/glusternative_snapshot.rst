Gluster Native Alerting for Snapshots
*************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Snapshot soft limit reached for volume
* Snapshot hard limit reached for volume

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_

Also note: Gluster snapshots are based on LVM Thin Pools

Setup
=====

#. You need a gluster volume, backed by bricks on real storage (where you can
   use all the space available).

Teardown
========

#. Remove all snapshots created during testing and make sure volume is up and
   healthy.
