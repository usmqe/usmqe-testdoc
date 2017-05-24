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

.. test_action::
   :step:
       Click ``Storage`` button.
   :result:
       Page with list of storages is open.

.. test_action::
   :step:
       Click ``Add Storage`` button.
   :result:
       Add storage page is open. There should be the following choices:

       #. Object Storage
       #. Block Storage

.. test_action::
   :step:
       Select particular cluster and chose ``Object Storage``, click to ``Next`` button.
   :result:
       Wizard for creating *Object Storage* pool is open.

.. test_action::
   :step:
       Create few Object Storages with combination of following choices:

       * Pools to Create: ``1``, ``3``
       * Type: ``Replicated``, ``Erasure Coded``
       * Replicas (for Replicated type): ``1``, ``3``
       * EC Profile (for Erasure Coded): ``2+1``, ``4+2``, ``6+3``, ``8+4``

       Fill all required data into inputs and click on ``Next`` button.

       | TODO: specify details (there are lot of knobs now), maybe split further into another test cases.
       | TODO: check quotas
       | TODO: check to create a pool on more than 50 OSDs, to have a slider with size and number of PGs
       | TODO: missing advanced configuration, missing snapshots (design conflict)
   :result:
       Check Summary page, that all information is correct.

.. test_action::
   :step:
       Click on ``Submit`` button.
   :result:
       Check ``Tasks`` for task for creating pool.

.. test_action::
   :step:
       Click ``Storage`` button.
   :result:
       Check if pool was created correctly, try to use it.

Teardown
========

#. Log out

#. Close browser
