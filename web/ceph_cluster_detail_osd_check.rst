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

.. test_step:: 1

    Click on *Clusters* link in the left menu bar.

.. test_result:: 1

    The *Clusters Landing Page* is shown. The title reads "Clusters" and the
    cluster you have created in this testacase's setup phase is shown here.

.. test_step:: 2

    Click on the item for *alpha* cluster.

.. test_result:: 2

    Default Cluster dashboard is shown with details about *alpha* cluster.

.. test_step:: 3

    Click on *OSDs* tab.

.. test_result:: 3

    List of OSDs is shown for each pool of the *alpha* cluster. There are only
    OSDs from machines which belongs to the *alpha* cluster. No OSDs of *alpha*
    cluster is missing in the list.

.. test_step:: 4

    See information provided in OSD item in the list.

.. test_result:: 4

    For each OSD item (card) in the list, there are the following details
    provided:

    * OSD name
    * status indicator
    * utilization bar
     
    Note: utilization bar is color coded:

    * blue ``=< 85%``
    * orange for a *near full* state
    * red for a *full* state

.. test_step:: 5

    TODO: filtering (left sidebar of OSDs tab) - by:
   
    * OSD status (up-in, up-out, down-in, down, + error/warnings)
    * PG status (see the design doc...)
    * Utilization (see the design doc...)

.. test_step:: 6

    TODO: group by host, pool or storage profile

.. test_step:: 7

    TODO: OSD details - header (includes status, name and type)

.. test_step:: 8

    TODO: OSD details - journal details

.. test_step:: 9

    TODO: OSD details - failure domain details
    (to identify location of this OSD)

.. test_step:: 10

    TODO: OSD details - failure domain details

.. test_step:: 11

    TODO: filter by search input field

.. test_step:: 12

    TODO: action list provided

.. test_step:: 13

    TODO: show utilization/weight (changes what's displayed in the OSD cards)

.. test_step:: 14

    TODO: hide filter sidebar

.. test_step:: 15

    TODO: selection model

Teardown
========

#. Undefine storage items (TODO: add more details go here).

#. Log out

#. Close browser
