Utilization Alerts Related to Host
**********************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* cpu utilization (host)
* memory utilization (host)
* swap utilization (host)

Based on:

* `List of Alerts and Notifications in Tendrl`_

Setup
=====

#. You need a gluster volume.
#. Install stress tool on all Tendrl Nodes (Storage Servers)

Teardown
========

#. Stop and remove stress tool from afected machines.
