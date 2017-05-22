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

.. test_action::
   :step:
       Click on *Storage* link in the left menu bar.
   :result:
       The *Storage Landing Page* is shown. The title reads "Storage" and the page
       is empty.

.. test_action::
   :step:
       Configure 1st cluster: TODO - add details here (ceph one)

       Wait for a *Create Cluster* task to finish.
   :result:
       Cluster has been created without any error.

.. test_action::
   :step:
       Create storage in 1st cluster: new ceph pool
   :result:
       Ceph pool has been created without any error.
 
.. test_action::
   :step:
       Click on *Storage* link in the left menu bar.
   :result:
       The *Storage Landing Page* is shown. The title reads "Storage" and 
       the page contains list of storage items with just single item: ceph pool
       created in a previous step.

.. test_action::
   :step:
       See information provided in ceph pool storage item in the list on
       *Storage Langing Page*.
   :result:
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
