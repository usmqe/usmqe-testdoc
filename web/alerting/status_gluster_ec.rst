Status of Gluster Dispersed Volume
**********************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* minimum number of bricks not up in EC subvolume (volume, cluster)
* minimum number of bricks up in EC subvolume (volume, cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* According to `Gluster Glossary`_, *subvolume* is "a brick after being
  processed by at least one translator"

Setup
=====

#. You need a `dispersed gluster volume`_, which should be created via
   `volume_gama_disperse_4_plus_2x2`_ gdeploy conf file from ``usmqe-setup``
   repo.

Teardown
========

#. Make sure all machines and volumes used during testing are up again.
