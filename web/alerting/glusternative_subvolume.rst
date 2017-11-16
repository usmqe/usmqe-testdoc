Gluster Native Alerting for Subvolume
*************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Subvolume affected by split-brain

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_
* According to `Gluster Glossary`_, *subvolume* is "a brick after being
  processed by at least one translator"

Setup
=====

#. You need a gluster volume

Teardown
========

#. Make sure all machines and volume used during testing are up again.
