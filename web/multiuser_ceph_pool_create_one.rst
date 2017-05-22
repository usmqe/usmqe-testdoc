Multiuser - Create one pool
***************************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

Simultaneously create one pool.

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

#. There is cluster where it is possible to create pool.

* Perform following steps for ``Block Storage`` from same pool and different pool

Test Steps
==========

.. test_action::
   :step:
       In both browsers click ``Storage`` button.
   :result:
       In both browsers page with list of storages is open.

.. test_action::
   :step:
       In both browsers click ``Add Storage`` button.
   :result:
       In both browsers Add storage page is open. There should be the following choices:

       #. Object Storage
       #. Block Storage

.. test_action::
   :step:
       In both browsers click ``Object Storage`` link.
   :result:
       In both browsers wizard for creating Object Storage pool is open.

.. test_action::
   :step:
       In both browsers fill all required data into inputs and simultaneously click ``Create Storage`` button.
       Use the same name in both browsers.
   :result:
       In one browser, error message about already existing pool is shown.
       In second browser, message about creating pool is shown.

.. test_action::
   :step:
       In both browsers click ``Storage`` button.
   :result:
       In both browsers check if pool was created correctly.

Teardown
========

#. Log out

#. Close browser
