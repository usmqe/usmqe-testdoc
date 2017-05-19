Multiuser - remove disk from the Ceph cluster
**********************************************

:authors: 
          - ltrilety@redhat.com
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

As an Admin, I want to be able to remove a given OSD from my cluster systematically so that I can replace
existing failing media or otherwise replace with more performant or greater capacity media as needed

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. Follow instruction in :doc:`/web/ceph_cluster_shrink_disk`.


Test Steps
==========

.. test_step:: 1

    #. Follow instruction in :doc:`/web/ceph_cluster_shrink_disk` and perform all operation simultaneously in two browsers:
    #. for the same node/disk in both browsers,
    #. for different node/disk in each browser.


.. test_result:: 1

    #. In one browser it should raise meaningful error message, in second browser it should pass.
    #. The operation launched from both browsers should pass accordingly to test results from :doc:`/web/ceph_cluster_shrink_disk`

Teardown
========

