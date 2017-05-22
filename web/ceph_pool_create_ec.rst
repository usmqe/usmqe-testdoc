Create EC pool
****************

:authors: 
          - ltrilety@redhat.com

Description
===========

Create erasure coded pool.

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
       Click ``Object Storage`` link.
   :result:
       Wizard for creating Object Storage pool is open.

.. test_action::
   :step:
       Choose ``Erasure Coded`` as type of storage
   :result:
       Verify that EC options are shown - EC profiles
       Verify that there is a list of pre-defined default EC profiles (2+1, 4+2, 6+3, 8+4)

       TODO: To the right of the EC profile options, a small graphic helps illustrates
             the selected EC options. It updates as the input changes.
             design conflict (missing)
       TODO: Moving slide
             design conflict (missing)
       TODO: Advanced Configuration
             design conflict (missing)
       TODO: Snapshots
             design conflict (missing)
       TODO: Replicas - bad design
             design conflict (missing)

       REMOVED:
         Verify that it is possible to create a new EC profile. It is possible to set k,m numbers so they satisfy
          erasure plug-in requirements. If they don't satisfy UI rejects them appropriately.

         *  System will validate k+m values and warn them when sum of k+m is not divisible by 3,
            and when m is not half of k. This assumes a best practice of at least 3 failure domains.
         *  System will create new EC profile based on user-specified k+m,
            whereby the EC profile can be re-used, but does not become the default.

.. test_action::
   :step:
       TODO: specify details (there are lot of knobs now), maybe split further
       into another test cases.

       Choose such k+m that it exactly correspond to number of disks available in the pool
       Set the replication option so there will be no replication
       Fill all other required inputs and ick on Next button
   :result:
       A summary page with correct information is opened

.. test_action::
   :step:
       Click on 'Add Storage' button

       TODO: possibility to edit some settings will be in some future release
       TODO: Create more than one pool
   :result:
       Task for pool creation was created.

.. test_action::
   :step:
       Wait until the task is finished
   :result:
       Verify that a new event was created about pool creation.
       Check if EC pool was created correctly.
       Verify that EC profile cannot be changed for the pool.

       TODO: bad place for utilization, sometimes chart covers the usage number
         design conflict

.. test_action::
   :step:
       Load some data to the pool
   :result:
       Data are created and available

.. test_action::
   :step:
       Make m disks to be unreachable.
   :result:
       Data created in previous step are still available

Teardown
========

#. Make all disk available again

#. Erase data and remove the EC pool

#. Log out

#. Close browser
