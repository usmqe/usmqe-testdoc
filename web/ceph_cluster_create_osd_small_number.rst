Create Ceph cluster with small number of OSD nodes
***************************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat

Description
===========

Create Ceph cluster (accordingly to *Create Ceph cluster* testcase) with specific configuration:
use the smallest supported number of OSD nodes (TODO: 4?).

Setup
=====

Prepare number of nodes for Tendrl cluster and choose the smallest supported number of OSD nodes.

Test Steps
==========

.. test_action::
   :step:
       Follow test steps from *Create Ceph cluster* testcase.
   :result:
       Follow test results from *Create Ceph cluster* testcase.

Teardown
========

