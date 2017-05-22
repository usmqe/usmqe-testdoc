Remove Ceph Object Storage
***************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Remove *Ceph Object Storage*.

Setup
=====

#. Install Tendrl according installation instructions written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is cluster and there is pool in it which can be removed(without bounded RBD).

Test Steps
==========

.. test_action::
   :step:
       Click ``Storage`` button.
   :result:
       Page with list of storages is open.

.. test_action::
   :step:
       Click menu button - 3 dots icon at the most right side of storage info line.
   :result:
       Action menu for storage is open.

.. test_action::
   :step:
       Click on ``Remove`` button.
   :result:
       Confirmation form is opened

.. test_action::
   :step:
       Click ``OK`` button.
   :result:
       Confirmation form is closed and there is new task for removing pool.
       Check ``Tasks`` for task for changing pool.

.. test_action::
   :step:
       Click ``Storage`` button.
   :result:
       After task is done there is no more removed pool in list of pools.

.. test_action::
   :step:
       Ssh to one of monitor and check if there is removed pool in cluster.
   :result:
       # ``ceph osd pool ls`` returns list of pools where is not removed pool

Teardown
========

#. Log out

#. Close browser
