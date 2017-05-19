Multiuser - Create two Ceph pools
**********************************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

Simultaneously create two Ceph pools.

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. There is cluster (or two) where it is possible to create pool.

* Perform following steps on one and on two different clusters.

* Perform following steps for ``Block Storage`` from same pool and different pool

Test Steps
==========

.. test_step:: 1

    In both browsers click ``Storage`` button.

.. test_result:: 1

    In both browsers page with list of storages is open.

.. test_step:: 2

    In both browsers click ``Add Storage`` button.

.. test_result:: 2

    In both browsers Add storage page is open. There should be the following choices:

    #. Object Storage
    #. Block Storage

.. test_step:: 3

    In both browsers click ``Object Storage`` link.

.. test_result:: 3

    In both browsers wizard for creating Object Storage pool is open.

.. test_step:: 4

    In both browsers fill all required data into inputs and simultaneously click ``Create Storage`` button.
    Use different name in each browser.

.. test_result:: 4

    In both browsers check ``Tasks`` for task for creating pools.

.. test_step:: 5

    In both browsers click ``Storage`` button.

.. test_result:: 5

    In both browsers check if pools was created correctly.

Teardown
========

#. Log out

#. Close browser
