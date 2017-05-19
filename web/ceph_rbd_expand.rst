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

.. test_step:: 1

    Click on "Storage" button in the left menu of Tendrl web interface.

.. test_result:: 1

    The rbd storage is in the list of storage items.

.. test_step:: 2

    Login on some machine in RADOS cluster and check maximum capacity of the
    rbd via ``rbd info $rbd_name``.

.. test_result:: 2

    Size reported by Tendrl and ``rbd info`` matches.

.. test_step:: 3

    Select rbd storage item and see all operations available for it.

.. test_result:: 3

    Device resize is in the list of available operations. 

.. test_step:: 4

    Extend rbd by half of free space available (using maximum capacity as a
    reference).    

.. test_result:: 4

    Tendrl reports success.

.. test_step:: 5

    Login on some machine in RADOS cluster and check maximum capacity of the
    rbd via ``rbd info $rbd_name``.

.. test_result:: 5

    Size reported by Tendrl and ``rbd info`` matches so that the RADOS block device
    has been extended as expected.

Teardown
========

#. Undefine storage items.

#. Log out

#. Close browser
