Status of Gluster Automatic File Replicaiton
********************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* AFR quorum met for subvolume (volume, cluster)
* AFR quorum fail for subvolume (volume, cluster)
* AFR subvolume up (volume, cluster)
* AFR subvolume down (volume, cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* AFR stands for `Automatic File Replication`_

Setup
=====

#. You need a gluster volume.
   TODO: list of volumes from qe configurations which uses AFR translator

Teardown
========

#. Make sure all machines and volumes used during testing are up again.
