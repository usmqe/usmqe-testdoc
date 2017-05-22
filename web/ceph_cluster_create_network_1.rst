Create Ceph cluster with 1 network
***********************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

Create cluster (accordingly to *Create Ceph cluster* testcase) with specific configuration:
use only 1 network as both *Cluster Network* and *Access Network*.


Setup
=====

Configure all storage nodes to use only 1 network as both *Cluster Network* and *Access Network*.

Test Steps
==========

.. test_action::
   :step:
       Follow test steps from *Create Ceph cluster* testcase.
   :result:
       Follow test results from *Create Ceph cluster* testcase.

Teardown
========

