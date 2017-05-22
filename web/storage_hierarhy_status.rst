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

.. test_action::
   :step:
       Click on "Storage" button in the left menu of Tendrl web interface.
   :result:
       List of storage items is shown (TODO: make this more specific).

.. test_action::
   :step:
       Go somehow (TODO: describe how - not implemented yet) to the page with
       *Storage Tree view*.
   :result:
       Storage Tree view page is shown.

.. test_action::
   :step:
       Find each volume and select it.
   :result:
       Volume is available in the Storage Tree view and when selected,
       further information and management operations are available for the volume.

       TODO: add details

.. test_action::
   :step:
       Find each pool and select it.
   :result:
       Pool is available in the *Storage Tree view* and when selected,
       further information and management operations are available for the pool.

       TODO: add details

.. test_action::
   :step:
       Find each RBD and select it.
   :result:
       RBD is available in the *Storage Tree view* and when selected,
       further information and management operations are available for the rbd.

       TODO: add details

Teardown
========

#. Undefine storage items (TODO: add more details here).

#. Log out

#. Close browser
