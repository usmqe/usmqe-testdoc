Edit Ceph Object Storage
*************************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

Edit *Object Storage*.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is cluster and there is pool in it.

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

    Click on ``Edit`` button.

.. test_result:: 3

    Edit form for storage is open.

.. test_step:: 4

    # Add to pool name '_chng'
    # Increase replica count by 1
    # Enable quotas
    # Set/change ``Max percentage used`` to 90%
    # Set/chnage ``Max number of objects`` to 10

.. test_result:: 4

    All values can be changed.

.. test_step:: 5

    Click on ``Save`` button.

.. test_result:: 5

    Check ``Tasks`` for task for changing pool.

.. test_step:: 6

    Click ``Storage`` button.

.. test_result:: 6

    Check if pool was changed correctly.

.. test_step:: 7

    Ssh to one of monitor and check changed pool.

.. test_result:: 7

    # ``ceph osd pool get _pool_name_chng size`` returns number higher by 1
    # ``ceph osd pool get-quota _pool_name_chng`` returns 10 objects and percentage transtalted to MB

Teardown
========

#. Log out

#. Close browser
