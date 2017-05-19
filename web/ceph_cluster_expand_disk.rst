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

.. test_step:: 1

    Add disk to some OSD node which is not part of some cluster

.. test_result:: 1

    The disk is shown on the node on UI.
    The disk is ON - has a correct state.

.. test_step:: 2

    Add disk to some OSD node which is part of some cluster, but not yet in any storage/pool

.. test_result:: 2

    The disk is shown on the node on UI.
    The disk is ON, has a correct state.
    TODO: Verify that it's possible to choose a storage profile for this disk.

.. test_step:: 3

    Add disk to some OSD node which is already part of some pool.

.. test_result:: 3

    Verify that the number of node disks are increased on UI.
    The disk is ON, has a correct state.
    Verify that if the disk is in the proper storage profile the pool size is increased properly.
    Verify that PGs are correctly adjusted

Teardown
========

