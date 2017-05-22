Elementary check of Main Dashboard page for Ceph
*************************************************

:authors: 
          - mbukatov@redhat.com
          - mkudlej@redhat.com

.. _`Design document for Ceph main dashboard`: https://redhat.invisionapp.com/share/589XIRJBW#/screens/213318367

Description
===========

This test case is concerned with *Ceph Main Dashboard* page and verifies the
core features as described in `Design document for Ceph main dashboard`_.

This test case is not concerned with all possible states of information
reported there, see other test cases which deals with each type of information
in more detail.

.. note:: TODO

    Create a test case for each Information card of *Main Dashboard*, so that
    the reporting could be properly tested. Each test case would need to tweak
    cluster status (change something or make something fail and see if it's
    properly reported there).

    - *Cluster* card
    - *Utilization* card
    - *Most Used Storage Profiles* card
    - *Most Used Pools* card
    - *Hosts* card
    - *Monitors* card
    - *PGs* card
    - *Pools* card
    - *OSDs* card
    - *Objects* card
    - *System performance* card, which includes:
        - CPU
        - Memory
        - IOPS
        - Throughput
        - Latency

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Create the some cluster and storage items.

.. note:: TODO

    We need to improve a description of setup steps to create elementary
    storage items (clusters, pools, rbd/rgw/...) inlcuding bulkloading test
    data.

    Example how to load 1GB object into Ceph:

    Generate some data first::

        dd if=/dev/zero of=zero.data bs=1M count=1024

    Push it as a object into ceph::

        rados put -p alpha_pool0 test_object_01 zero.data
        rados put -p alpha_pool0 test_object_02 zero.data

    Then one can check it by listing and getting the object back::

        rados ls -p alpha_pool0
        rados get -p alpha_pool0 test_object_02 test_object_02.data

Test Steps
==========

.. test_action::
   :step:
       Click on *Dashboard* link in the left menu bar.
   :result:
       The *Main Dashboard* page is shown (at this point the page is not empty).

.. test_action::
   :step:
       Find *Clusters* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of clusters
       * overall status
         
       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of clusters in an error/fail state
           * number of clusters in a warning state
           * number of active alerts (if any)

.. test_action::
   :step:
       Find *Hosts* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of hosts
       * overall status

       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of hosts in an error/fail state
           * number of hosts in a warning state

.. test_action::
   :step:
       Find *Monitors* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of Monitors
       * overall status

       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of monitors in an error/fail state
           * number of monitors in a warning state

.. test_action::
   :step:
       Find *PGs* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of PGs
       * overall status

       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of PGs in an error/fail state
           * number of PGs in a warning state

.. test_action::
   :step:
       Find *Pools* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of pools
       * overall status

       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of pools in an error/fail state
           * number of pools in a warning state

.. test_action::
   :step:
       Find *OSDs* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of OSDs
       * overall status

       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of OSDs in an error/fail state
           * number of OSDs in a warning state

.. test_action::
   :step:
       Find *Objects* card in *Main Dashboard* page.
   :result:
       Such item exists and reports:

       * total number of objects
       * overall status

       The status may be one of (depends on the actuall cluster state): 

       * green icon which means that everything is ok
       * or the following details are provided in case of some error/failure:
           * number of objects in an error/fail state
           * number of objects in a warning state

.. test_action::
   :step:
       Find *System Performance* card in *Main Dashboard* page.
   :result:
       Such item exists and contains:

       * CPU utilization graph
       * Memory ulitization graph
       * IOPS graph
       * Throughput graph
       * Latency graph

       Data there are computed based on status of all clusters.

.. test_action::
   :step:
       Find *Most Used Storage Profiles* card in *Main Dashboard* page.
   :result:
       Such item exists and contains list of utilization bars of 3 most utilized
       storage profiles.
      
       If more are defined, there should be a item called Others aggregating
       utilization of the rest of storage profiles.

       Data there are agregated based on status of all clusters.

.. test_action::
   :step:
       Find *Most Used Pools* card in *Main Dashboard* page.
   :result:
       Such item exists and contains list of utilization bars, one for each
       ceph pool.

       Utilization and maximum capacity is correct for each pool shown there.

       TODO: what about a limit there? How many pools is a maximum?

       Data there are agregated based on status of all clusters.

Teardown
========

#. Undefine storage items (TODO: add more details go here).

#. Log out

#. Close browser
