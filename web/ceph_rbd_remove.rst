Remove Ceph RADOS block device
*********************************

:author: 
          - mkudlej@redhat.com
          - mbukatov@redhat.com

Description
===========

This testcase covers removing of RBD.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is a cluster with one already existing pool called ``rbd_pool`` and with already
   existing RBD called ``rbd1``. Test Steps section refers this cluster as *cluster alpha*.

Test Steps
==========

.. test_step:: 1

    Click on ``Storage`` button and ``RBDs`` in submenu.

.. test_result:: 1

    Page with list of RBD items is shown.

.. test_step:: 2

    Click "3 dots" button on the end of ``rbd1`` row.

.. test_result:: 2

    Menu with ``Resize`` and ``Remove`` is opened.

.. test_step:: 3

    Click on ``Remove`` button.

.. test_result:: 3

    Confirmation dialog is opened.

.. test_step:: 4

    Click on ``OK`` button.

.. test_result:: 4

    New task in created in ``Tasks``.

.. test_step:: 5

    Wait till task for removing ``rbd1`` ends.

.. test_result:: 5

    Check if task for removing ``rbd1`` pass.

.. test_step:: 6
    
    Ssh to one of monitor and check if there is still ``rbd1``.

.. test_result:: 6

    # ``rbd --pool rbd_pool ls`` returns list of rbds without ``rbd1``

Teardown
========

#. Log out

#. Close browser
