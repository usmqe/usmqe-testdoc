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

.. test_step:: 1

    Click ``Storage`` button.

.. test_result:: 1

    Page with list of storages is open.

.. test_step:: 2

    Click menu button - 3 dots icon at the most right side of storage info line.

.. test_result:: 2

    Action menu for storage is open.

.. test_step:: 3

    Click on ``Remove`` button.

.. test_result:: 3

    Confirmation form is opened

.. test_step:: 4

    Click ``OK`` button.

.. test_result:: 4

    Confirmation form is closed and there is new task for removing pool.
    Check ``Tasks`` for task for changing pool.

.. test_step:: 5

    Click ``Storage`` button.

.. test_result:: 5

    After task is done there is no more removed pool in list of pools.

.. test_step:: 6

    Ssh to one of monitor and check if there is removed pool in cluster.

.. test_result:: 6

    # ``ceph osd pool ls`` returns list of pools where is not removed pool

Teardown
========

#. Log out

#. Close browser
