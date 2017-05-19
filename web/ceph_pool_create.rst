Create Ceph Object Storage
***************************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

Create *Object Storage*.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is cluster where it is possible to create pool.

Test Steps
==========

.. test_step:: 1

    Click ``Storage`` button.

.. test_result:: 1

    Page with list of storages is open.

.. test_step:: 2

    Click ``Add Storage`` button.

.. test_result:: 2

    Add storage page is open. There should be the following choices:

    #. Object Storage
    #. Block Storage

.. test_step:: 3

    Select particular cluster and chose ``Object Storage``, click to ``Next`` button.

.. test_result:: 3

    Wizard for creating *Object Storage* pool is open.

.. test_step:: 4

    | TODO: specify details (there are lot of knobs now), maybe split further into another test cases.
    | TODO: check quotas
    | TODO: check to create a pool on more than 50 OSDs, to have a slider with size and number of PGs
    | TODO: missing advanced configuration, missing snapshots (design conflict)
    |

    Create few Object Storages with combination of following choices:

    * Pools to Create: ``1``, ``3``
    * Type: ``Replicated``, ``Erasure Coded``
    * Replicas (for Replicated type): ``1``, ``3``
    * EC Profile (for Erasure Coded): ``2+1``, ``4+2``, ``6+3``, ``8+4``

    Fill all required data into inputs and click on ``Next`` button.

.. test_result:: 4

    Check Summary page, that all information is correct.

.. test_step:: 5

    Click on ``Submit`` button.

.. test_result:: 5

    Check ``Tasks`` for task for creating pool.

.. test_step:: 6

    Click ``Storage`` button.

.. test_result:: 6

    Check if pool was created correctly, try to use it.

Teardown
========

#. Log out

#. Close browser
