Extend Ceph RADOS block device
*******************************

:authors: 
          - mbukatov@redhat.com

Description
===========

This test case covers expansion of RADOS block device (setting *maximum
capacity* of rbd to a higher value).

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

#. Create a RBD storage (:doc:`/web/ceph_rbd_create`)

#. Load some data into the rbd

Test Steps
==========

.. test_action::
   :step:
       Click on "Storage" button in the left menu of Tendrl web interface.
   :result:
       The rbd storage is in the list of storage items.

.. test_action::
   :step:
       Login on some machine in RADOS cluster and check maximum capacity of the
       rbd via ``rbd info $rbd_name``.
   :result:
       Size reported by Tendrl and ``rbd info`` matches.

.. test_action::
   :step:
       Select rbd storage item and see all operations available for it.
   :result:
       Device resize is in the list of available operations. 

.. test_action::
   :step:
       Extend rbd by half of free space available (using maximum capacity as a
       reference).    
   :result:
       Tendrl reports success.

.. test_action::
   :step:
       Login on some machine in RADOS cluster and check maximum capacity of the
       rbd via ``rbd info $rbd_name``.
   :result:
       Size reported by Tendrl and ``rbd info`` matches so that the RADOS block device
       has been extended as expected.

Teardown
========

#. Undefine storage items.

#. Log out

#. Close browser
