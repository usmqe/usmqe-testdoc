Create Ceph cluster with second disk already used.
**************************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat

Description
===========

Create Ceph cluster (accordingly to *Create Ceph cluster* testcase) with specific configuration:
Use at least 2 additional disks peer storage node and mount the fist one somewhere (e.g. use it as /home disk).

Root/system disk is not counted in the number of mentioned disks!

Setup
=====

Configure all storage nodes to use at least 2 disks and mount the fist one somewhere (e.g. use it as /home disk).

Test Steps
==========

.. test_step:: 1

    Follow test steps from *Create Ceph cluster* testcase.

.. test_result:: 1

    Follow test results from *Create Ceph cluster* testcase.

    Check that used disk (mounted as /home) is not counted as part of storage cluster. 

Teardown
========

