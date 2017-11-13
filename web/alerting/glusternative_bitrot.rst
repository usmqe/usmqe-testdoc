Gluster Native Alerting for Bitrot
**********************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* File with gfid corrupted due to bitrot in brick

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_

Setup
=====

#. You need a gluster volume
#. Enable bitrot detection on the volume TODO: gdeploy config file

Teardown
========

#. Disable bitrot
#. Make sure all machines and volume used during testing are up again.
