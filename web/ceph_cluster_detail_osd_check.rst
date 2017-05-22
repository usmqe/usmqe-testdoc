Elementary check of OSDs tab of a Ceph Cluster Details page
***********************************************************

:authors: 
          - mbukatov@redhat.com
          - mkudlej@redhat.com

Description
===========

This test case is concerned with *OSDs tab of a Ceph Cluster Details* page and
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
       Click on *OSDs* tab.
   :result:
       List of OSDs is shown for each pool of the *alpha* cluster. There are only
       OSDs from machines which belongs to the *alpha* cluster. No OSDs of *alpha*
       cluster is missing in the list.

.. test_action::
   :step:
       See information provided in OSD item in the list.
   :result:
       For each OSD item (card) in the list, there are the following details
       provided:

       * OSD name
       * status indicator
       * utilization bar
        
       Note: utilization bar is color coded:

       * blue ``=< 85%``
       * orange for a *near full* state
       * red for a *full* state

.. test_action::
   :step:
       TODO: filtering (left sidebar of OSDs tab) - by:
      
       * OSD status (up-in, up-out, down-in, down, + error/warnings)
       * PG status (see the design doc...)
       * Utilization (see the design doc...)

.. test_action::
   :step:
       TODO: group by host, pool or storage profile

.. test_action::
   :step:
       TODO: OSD details - header (includes status, name and type)

.. test_action::
   :step:
       TODO: OSD details - journal details

.. test_action::
   :step:
       TODO: OSD details - failure domain details
       (to identify location of this OSD)

.. test_action::
   :step:
       TODO: OSD details - failure domain details

.. test_action::
   :step:
       TODO: filter by search input field

.. test_action::
   :step:
       TODO: action list provided

.. test_action::
   :step:
       TODO: show utilization/weight (changes what's displayed in the OSD cards)

.. test_action::
   :step:
       TODO: hide filter sidebar

.. test_action::
   :step:
       TODO: selection model

Teardown
========

#. Undefine storage items (TODO: add more details go here).

#. Log out

#. Close browser
