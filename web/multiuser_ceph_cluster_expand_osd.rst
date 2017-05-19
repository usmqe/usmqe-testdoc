Multiuser - expand Ceph cluster with osd
*****************************************

:authors: 
          - ltrilety@redhat.com
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

As an Admin, I want to be able to add a given OSD/drive media to my cluster systematically

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. Follow instruction in :doc:`/web/node_add`.

Test Steps
==========

.. test_step:: 1

    Follow instruction in :doc:`/web/node_add` and perform all operation simultaneously in two browsers:

    #. for one (the same) disk in both browsers,
    #. for different disk in each browser.

.. test_result:: 1

    #. In one browser it should raise error message about already used disk/osd, in second browser it should pass.
    #. It should extend cluster with both added disks/OSDs.


Teardown
========
