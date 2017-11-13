Gluster Native Alerting for Geo Replication
*******************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Geo-replication checkpoint completed for session

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_

Setup
=====

#. You need two independent gluster trusted storage pools (with at lest one
   volume on each) with `Geo Replication`_ enabled.
