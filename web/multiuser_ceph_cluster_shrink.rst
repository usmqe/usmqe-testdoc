Multiuser - Shrink Ceph cluster
********************************

:authors: 
          - ltrilety@redhat.com
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

As an Admin, I want to be able to resize the overall cluster as desired by reducing the overall node count,
so I can add new HW (within improved capabilities, storage densities, etc. - swap 1 shiny new box for
2 crusty old boxes), or otherwise decommission / reprovision a node in the current cluster

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. Follow instruction in :doc:`/web/ceph_cluster_shrink`.


Test Steps
==========

.. test_action::
   :step:
       #. Follow instruction in :doc:`/web/ceph_cluster_shrink` and perform all operation simultaneously in two browsers:
       #. for the same nodes in both browsers,
       #. for different nodes in each browser.
   :result:
       #. In one browser it should raise meaningful error message, in second browser it should pass.
       #. The operation launched from both browsers should pass accordingly to test results from :doc:`/web/ceph_cluster_shrink`

Teardown
========
