Create Ceph cluster with 1 disk(OSD) peer node
***********************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

Create cluster (accordingly to *Create Ceph cluster* testcase) with specific configuration:
use 1 data (OSD) disk peer storage node.

Root/system disk is not counted in the number of mentioned disks!

Setup
=====

Configure all storage nodes to use 1 data (OSD) disk.

Test Steps
==========

.. test_action::
   :step:
       Follow test steps from *Create Ceph cluster* testcase.
   :result:
       Follow test results from *Create Ceph cluster* testcase.

Teardown
========

