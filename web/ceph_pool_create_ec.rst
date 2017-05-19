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

    Click ``Object Storage`` link.

.. test_result:: 3

    Wizard for creating Object Storage pool is open.

.. test_step:: 4

    Choose ``Erasure Coded`` as type of storage

.. test_result:: 4

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

.. test_step:: 5

    TODO: specify details (there are lot of knobs now), maybe split further
    into another test cases.

    Choose such k+m that it exactly correspond to number of disks available in the pool
    Set the replication option so there will be no replication
    Fill all other required inputs and ick on Next button

.. test_result:: 5

    A summary page with correct information is opened

.. test_step:: 6

    Click on 'Add Storage' button

    TODO: possibility to edit some settings will be in some future release
    TODO: Create more than one pool

.. test_result:: 6

    Task for pool creation was created.

.. test_step:: 7

    Wait until the task is finished

.. test_result:: 7

    Verify that a new event was created about pool creation.
    Check if EC pool was created correctly.
    Verify that EC profile cannot be changed for the pool.

    TODO: bad place for utilization, sometimes chart covers the usage number
      design conflict

.. test_step:: 8

    Load some data to the pool

.. test_result:: 8

    Data are created and available

.. test_step:: 9

    Make m disks to be unreachable.

.. test_result:: 9

    Data created in previous step are still available

Teardown
========

#. Make all disk available again

#. Erase data and remove the EC pool

#. Log out

#. Close browser
