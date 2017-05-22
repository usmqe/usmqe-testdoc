Create Ceph RADOS block device on predefined pool
**************************************************

:authors: 
          - mbukatov@redhat.com

Description
===========

This test case covers creatinon of RADOS block device on predefined pool 
using standard *Add Storage* wizard.

This test case is (also) based on the following design proposals:

 * *Storage section - Add RBD* design from Tendrl 1.0 Overall Design
 * *Add Block Storage* design from Add Storage Workflow

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl UI, see :doc:`/web/login_positive`

#. There is a cluster where it is possible to create RBD storage, with one
   already existing pool called ``rbd_pool``. Test Steps section refers this
   cluster as *cluster alpha*.

Test Steps
==========

.. test_step:: 1

    Click on ``Storage`` button.

.. test_result:: 1

    Page with list of storage items is shown.

.. test_step:: 2

    Click ``Add Storage`` button on the page you opened in previous step.

.. test_result:: 2

    Add Storage page is open. There should be the following choices presented:

    #. Object Storage
    #. Block Storage

    (specified in Tendrl 1.0 Overall Design)

.. test_step:: 3

    Select cluster *alpha* and ``Block Storage`` option. Then click on ``Next``
    button.

.. test_result:: 3

    A *Add Block Storage* wizard is shown.

    The 1st page of the wizard provides:

    #. input field to specify **Device Name**
    #. number selection to specify number of devices to create
       (the title should say **RBDs to Create**)
    #. number seclection to specify **Target Size** of the device
       (consists of 2 select boxes, one for the number and the other for units)
    #. section called **Backing Pool** with 2 mutualy exclusive options:
        * reuse existing pool (there are no such pool at this point though)
        * create a new pool
    #. section **Advanced Configuration** - TODO: design conflict (missing)
    #. section **Snapshots** - TODO: design conflict (missing)
    #. section **Quotas**

    (specified in Add Storage Workflow)

.. so far, the steps were the same as in web/rbc_creater.rst test case

.. test_step:: 4

    Fill out the 1st page of the wizard and specify:

    * name: ``rbd1``
    * devices to create: ``1``
    * size: ``1 GB`` (this is simplest test case possible)
    * backing pool: use *choose existing pool* option and select
      ``rbd_pool``

    TODO: branch out a negative test case for going over the available space in
    selected pool

.. test_result:: 4

    The form allows you to enter given values.

    Graph showing utilization of ``rbd_pool`` showns:

    * in use part
    * to be added part 
    * remaining part

    Check that the values presented are correct.
   
    Known BZs here so far:
   
    * :RHBZ:`1351703`

    TODO: I don's see 'in use' part when all I have is an empty RBD,
    research pending - but it's likely ok - but there is a possible conflict
    with the design doc

.. test_step:: 5

    Click next to submit the form filled in a previous step.

.. test_result:: 5

    An overview with list of RADOS block devices to be created is shown.

.. test_step:: 6

    Click on "Submit" button to start "Create Block Device" task.

.. test_result:: 6

    Create Block Device task is created and finishes without any errors.

.. test_step:: 7

    Got to **Storage - RBD** page with list of all RBDs.

.. test_result:: 7

    Just created RBD is shown in the list, there are no errors reported.

    Information shown for the new RBD matches the desired parameters.

    (There is another RBD in the list as expected by Setup section)

.. test_step:: 8

    From monitor machine, see just created rbd device via::

        rbd -c /etc/ceph/alpha.conf ls rbd_pool

    And check details via::

        rbd -c /etc/ceph/alpha.conf -p rbd_pool info rbd0

.. test_result:: 8

    The command shows the just created rbd device::

        # rbd -c /etc/ceph/alpha.conf ls rbd_pool
        rbd0
        rbd1

    And provided details matches what has been specified via web gui::

        # rbd -c /etc/ceph/alpha.conf -p rbd_pool info rbd1
        rbd image 'rbd1':
            size 1024 MB in 256 objects
            order 22 (4096 kB objects)
            block_name_prefix: rbd_data.1b5a1238e1f29
            format: 2
            features: layering, exclusive-lock, object-map, fast-diff, deep-flatten
            flags: 

    (compare with data checked during test step 7)

Teardown
========

#. Log out

#. Close browser
