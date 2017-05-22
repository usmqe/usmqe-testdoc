Elementary check of Pool tab of a Ceph Cluster Details page
***********************************************************

:authors:
          - mbukatov@redhat.com
          - mkudlej@redhat.com

Description
===========

This test case is concerned with *Pool tab of a Ceph Cluster Details* page and
verifies the core features as described in Object Details Design document.

This test case is not concerned with all possible states and information
reported there, see other test cases which deals with each type of information
in more detail.

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Create a Ceph cluster with one pool (:doc:`/web/ceph_cluster_create`), set the
   cluster name to *alpha*.

#. Create another Ceph cluster with one pool (:doc:`/web/ceph_cluster_create`), set
   the cluster name to *beta*.

Test Steps
==========

.. test_action::
   :step:
       Click on *Clusters* link in the left menu bar.
   :result:
       The *Clusters Landing Page* is shown. The title reads "Clusters" and the
       cluster you have created in this testacase's setup phase is shown here.

.. test_action::
   :step:
       Click on the item for *alpha* cluster.
   :result:
       Default Cluster dashboard is shown with details about *alpha* cluster.

.. test_action::
   :step:
       Click on *Pools* tab.
   :result:
       List of pools is shown. There is just a single item which should belong
       to the *alpha* cluster.

.. test_action::
   :step:
       See information provided in ceph pool storage item in the list of the
       *Pools* tab.
   :result:
       The item provides the following information for a ceph pool item:

       * Storage type in the left collumn is **CEPH**.
       * Pool name is *aplha*.
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

       TODO: this is (almost) the same as in :doc:`/web/storage_page_check`
       (step 5), use import or redesing this test case.
       Maybe something like *pool list check* with a few ways to get there.

Teardown
========

#. Undefine storage items (TODO: add more details go here).

#. Log out

#. Close browser
