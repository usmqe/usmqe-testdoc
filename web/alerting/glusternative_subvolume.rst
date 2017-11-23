Gluster Native Alerting for Subvolume
*************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Subvolume affected by split-brain (``AFR_SPLIT_BRAIN``)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_
* According to `Gluster Glossary`_, *subvolume* is "a brick after being
  processed by at least one translator"
* AFR stands for `Automatic File Replication`_
* RHG3-12336
* `Split brain and the ways to deal with it`_

Setup
=====

#. You need a gluster volume
   TODO: list of volumes from qe configurations which uses AFR translator

Test Steps
==========

.. test_action::
   :step:
       Create a file in split-brain. Launch index heal via the CLI to see this
       event. Basically, every time the self-heal daemon encounters a file in
       split-brain, it gives out this event.
   :result:
       Tendrl sends alert "Subvolume affected by split-brain"
       (``UNKNOWN_PEER``).

Teardown
========

#. Make sure all machines and volume used during testing are up again.
