Add some disk to OSD node of Ceph cluster
******************************************

:authors:
          - ltrilety@redhat.com
          - mkudlej@redhat.com

Description
===========

As an Admin, I want to be able to add a given OSD/drive media to my cluster systematically

Setup
=====

Have some Ceph cluster with pool(s) prepared

Test Steps
==========

.. test_action::
   :step:
       Add disk to some OSD node which is not part of some cluster
   :result:
       The disk is shown on the node on UI.
       The disk is ON - has a correct state.

.. test_action::
   :step:
       Add disk to some OSD node which is part of some cluster, but not yet in any storage/pool
   :result:
       The disk is shown on the node on UI.
       The disk is ON, has a correct state.
       TODO: Verify that it's possible to choose a storage profile for this disk.

.. test_action::
   :step:
       Add disk to some OSD node which is already part of some pool.
   :result:
       Verify that the number of node disks are increased on UI.
       The disk is ON, has a correct state.
       Verify that if the disk is in the proper storage profile the pool size is increased properly.
       Verify that PGs are correctly adjusted

Teardown
========

