Elementary check of Ceph pool list
*************************************

:authors: 
          - mbukatov@redhat.com
          - mkudlej@redhat.com

.. _`Design document for Ceph pool list`: https://redhat.invisionapp.com/share/BR8JDCGSQ#/screens/198417118

Description
===========

This test case is concerned with *Pools Section* landing page and verifies the
core features as described in `Design document for Ceph pool list`_.

This test case is not concerned with all possible states of information
reported there, see other test cases which deals with information and
features related to this page in more detail.

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Make sure you have enough nodes for 2 clusters
   which are going to be created during this test case.

Test Steps
==========

.. test_step:: 1

    Click on *Storage* link in the left menu bar.

.. test_result:: 1

    The *Storage Landing Page* is shown. The title reads "Storage" and the page
    is empty.

.. test_step:: 2

    Configure 1st cluster: TODO - add details here (ceph one)

    Wait for a *Create Cluster* task to finish.

.. test_result:: 2

    Cluster has been created without any error.

.. test_step:: 3

    Create storage in 1st cluster: new ceph pool

.. test_result:: 3

    Ceph pool has been created without any error.
 
.. test_step:: 4

    Click on *Storage* link in the left menu bar.

.. test_result:: 4

    The *Storage Landing Page* is shown. The title reads "Storage" and 
    the page contains list of storage items with just single item: ceph pool
    created in a previous step.

.. test_step:: 5

    See information provided in ceph pool storage item in the list on
    *Storage Langing Page*.

.. test_result:: 5

    The item provides the following information for a ceph pool item:

    * Storage type in the left collumn is **CEPH**.
    * Pool name.
    * Pool type (TODO: clarify).
    * Utilization graph, used space as a total number and percentage
    * Cluster name and TODO
    * Number of OSDs (along with some error/warning if needed - TODO recheck)
    * Snapshot info
    * Other features (cache, tiering, ...) TODO: details
    * Total number of **Alerts** (TODO: add details)
    * Menu icon which provides pop up menu with operations which could be
      performed for this node
      TODO: list all actions available 

TODO: add a step for 2nd cluster setup (this is needed for a proper check)

Teardown
========

#. Undefine storage items (TODO: add more details go here).

#. Log out

#. Close browser
