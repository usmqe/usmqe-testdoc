Create Ceph cluster with large number of OSD nodes
***************************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat

Description
===========

Create Ceph cluster (accordingly to *Create Ceph cluster* testcase) with specific configuration:
use the large number of OSD nodes (at least 20).

Also consider to use more than one data disk peer storage node.

Setup
=====

Prepare number of nodes for Tendrl cluster with large number of OSD nodes.

Also consider to use more than one data disk peer storage node.

Test Steps
==========

.. test_action::
   :step:
       Follow test steps from *Create Ceph cluster* testcase.
   :result:
       Follow test results from *Create Ceph cluster* testcase.

Teardown
========

