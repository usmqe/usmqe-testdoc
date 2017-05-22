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
       Click on ``Edit`` button.
   :result:
       Edit form for storage is open.

.. test_action::
   :step:
       # Add to pool name '_chng'
       # Increase replica count by 1
       # Enable quotas
       # Set/change ``Max percentage used`` to 90%
       # Set/chnage ``Max number of objects`` to 10
   :result:
       All values can be changed.

.. test_action::
   :step:
       Click on ``Save`` button.
   :result:
       Check ``Tasks`` for task for changing pool.

.. test_action::
   :step:
       Click ``Storage`` button.
   :result:
       Check if pool was changed correctly.

.. test_action::
   :step:
       Ssh to one of monitor and check changed pool.
   :result:
       # ``ceph osd pool get _pool_name_chng size`` returns number higher by 1
       # ``ceph osd pool get-quota _pool_name_chng`` returns 10 objects and percentage transtalted to MB

Teardown
========

#. Log out

#. Close browser
