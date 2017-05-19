Storage hierarchy status
******************************

:authors: 
          - mbukatov@redhat.com

Description
===========

Check Storage Tree hiararchy view, including status of:

* gluster volumes
* ceph pools
* ceph RBDs

TODO: this test case will be extended when the design is finalized

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Create the following storage items (or make sure such storage exists):

   * gluster volume
   * ceph pool
   * RBD (rados block device)

   TODO: add references of related test cases

Test Steps
==========

.. test_step:: 1

    Click on "Storage" button in the left menu of Tendrl web interface.

.. test_result:: 1

    List of storage items is shown (TODO: make this more specific).

.. test_step:: 2

    Go somehow (TODO: describe how - not implemented yet) to the page with
    *Storage Tree view*.

.. test_result:: 2

    Storage Tree view page is shown.

.. test_step:: 3

    Find each volume and select it.

.. test_result:: 3

    Volume is available in the Storage Tree view and when selected,
    further information and management operations are available for the volume.

    TODO: add details

.. test_step:: 4

    Find each pool and select it.

.. test_result:: 4

    Pool is available in the *Storage Tree view* and when selected,
    further information and management operations are available for the pool.

    TODO: add details

.. test_step:: 5

    Find each RBD and select it.

.. test_result:: 5

    RBD is available in the *Storage Tree view* and when selected,
    further information and management operations are available for the rbd.

    TODO: add details

Teardown
========

#. Undefine storage items (TODO: add more details here).

#. Log out

#. Close browser
