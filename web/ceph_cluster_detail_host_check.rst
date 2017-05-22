Elementary check of Hosts tab of a Ceph Cluster Details page
************************************************************

:authors: 
          - mbukatov@redhat.com
          - mkudlej@redhat.com

.. .. include:: requirements/doc_list.rst

Description
===========

This test case is concerned with *Hosts tab of a Ceph Cluster Details* page and
verifies the core features as described in Object Details Design document.

This test case is not concerned with all possible states and information
reported there, see other test cases which deals with each type of information
in more detail.

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Create a Ceph cluster (:doc:`/web/ceph_cluster_create`), set the
   cluster name to *alpha*.

#. Create another Ceph cluster (:doc:`/web/ceph_cluster_create`), set
   the cluster name to *beta*.

If you don't have enough monitor machines to create 2 clusters (one needs 3
monitor machines for one cluster), you can reconfigure Tendrl to allow you
to use just a single monitor per cluster for the purpose of this test case.

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
       Click on *Hosts* tab.
   :result:
       List of hosts is shown. There are only machines which belongs to the
       *alpha* cluster. No machine from *alpha* cluster is missing in the list.

.. test_action::
   :step:
       See information provided in ceph pool storage item in the list of the
       *Hosts* tab.
   :result:
       For each host item in the list, there are the following details provided:

       * Assignment status in the left collumn is **CEPH**.
       * Hostname (fqdn)
       * IP address (TODO: what if there are multiple interfaces?)
       * Cluster type (Ceph in this case)
       * Cluster name reported as *alpha*
       * Cluster role (eg. monitor, OSD, ...)
       * Version of OS (distro), kernel and storage software (ceph or gluster)
       * Total number of **Alerts** (TODO: add details)
       * Menu icon which provides pop up menu with operations which could be
         performed for this node
         TODO: list all host actions (eg. Unmanage, Remove, ...) or maybe just
         left it to other test cases 
       * TODO: daemon actions (Start, Stop, ...)
       * TODO: something else?

       TODO: this is very similar to :doc:`/web/hosts_page_check`
       (step 4), use import or redesing this test case.
       Maybe something like *hosts list check* with a few ways to get there.

Teardown
========

#. Undefine storage items (TODO: add more details go here), including clusters.

#. Log out

#. Close browser

#. If you have reconfigured minimal monitor number, revert the configuration
   back.
