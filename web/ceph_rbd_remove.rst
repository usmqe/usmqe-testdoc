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

.. test_action::
   :step:
       Click on ``Storage`` button and ``RBDs`` in submenu.
   :result:
       Page with list of RBD items is shown.

.. test_action::
   :step:
       Click "3 dots" button on the end of ``rbd1`` row.
   :result:
       Menu with ``Resize`` and ``Remove`` is opened.

.. test_action::
   :step:
       Click on ``Remove`` button.
   :result:
       Confirmation dialog is opened.

.. test_action::
   :step:
       Click on ``OK`` button.
   :result:
       New task in created in ``Tasks``.

.. test_action::
   :step:
       Wait till task for removing ``rbd1`` ends.
   :result:
       Check if task for removing ``rbd1`` pass.

.. test_action::
   :step:
       Ssh to one of monitor and check if there is still ``rbd1``.
   :result:
       # ``rbd --pool rbd_pool ls`` returns list of rbds without ``rbd1``

Teardown
========

#. Log out

#. Close browser
