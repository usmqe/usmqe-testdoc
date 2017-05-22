Create Ceph RADOS block device
*******************************

:authors: 
          - mbukatov@redhat.com

Description
===========

This test case covers creatinon of RADOS block device using standard *Add
Storage* wizard.

This test case is (also) based on the following design proposals:

 * *Storage section - Add RBD* design from Overall Design
 * *Add Block Storage* design from Add Storage Workflow

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is a cluster where it is possible to create RBD storage, but no
   storage item is available for this cluster. Test Steps section refers
   this cluster as *cluster alpha*.

Test Steps
==========

.. test_action::
   :step:
       Click on ``Storage`` button.
   :result:
       Page with list of storage items is shown.

.. test_action::
   :step:
       Click ``Add Storage`` button on the page you opened in previous step.
   :result:
       Add Storage page is open. There should be the following choices presented:

       #. Object Storage
       #. Block Storage

       (specified in Tendrl 1.0 Overall Design)

.. test_action::
   :step:
       Select cluster *alpha* and ``Block Storage`` option. Then click on ``Next``
       button.
   :result:
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

.. test_action::
   :step:
       Fill out the 1st page of the wizard and specify:

       * name: ``rbd0``
       * devices to create: ``1``
       * size: ``1 GB`` (this is simplest test case possible)
       * backing pool: create new pool

       TODO:

       Branch out another basic test case where some pre existing pool is
       reused (via option *backing pool*).
   :result:
       The form allows you to enter given values.

.. test_action::
   :step:
       Having selected *create new pool*, specify:

       * pool name: ``rbd_pool``
       * type: ``standard``
       * number of replicas: ``3``
       * storage rofile: general

       TODO items:

       Branch out another test case for EC Pool option (known
       issue :RHBZ:`1342480`):

       * check that it's not possible to create RBD on EC pool
       * check that EC option is not available

       (via option *type*)

       Moreover, there is a conflict with the design document, which:

       * notes that one can specify the following for a storage profile:
          * optimal pool size
          * number of placement groups
       * shows a graph with utilization of selected pool wrt. the storage profile
   :result:
       It's possible to specify all listed options.

       Backing Pool Size default value matches storage space required for creating
       of all target BRDs (**RBDs to Create** ``x`` **Target Size**).

       If ``OSD count > 50``, it's possible to adjust pool size using slider
       control.

       TODO: check other default values?

       (specified in Add Storage Workflow, but the implementation intend may
       have hanged in the mean time - TODO: check this)

.. test_action::
   :step:
       When the configuration is done, click on **Next** button.
   :result:
       The summary of block devices to be created, including a backing pool (if
       any) is shown to the user.

       For each RBD, there is an item with it's name and target size.

       If a new backing pool is created, the following is shown:

       * name
       * type
       * storage profile
       * number of replicas
       * optimized for size (including units, eg. GB)
       * number of OSds
       * quotas status (Enabled vs Disabled) TODO: design doc conflict (missing)
       * journal status (eg. Optimized)

       The backing pool item doesn't contain any link to object details.

       TODO: edit button for a backing storage pool is not available, but it's
       specified in the design doc

       TODO: If a backing pool is an existing pool, staus is shown. Details can't
       be changed (this should be splitted into another case).

.. test_action::
   :step:
       Click on **Add Storage** button.

       TODO: design conflict, name of the button is actually **Submit**
   :result:
       New **Create Storage** taks is started.

       After some time, it finishes without any error.

.. test_action::
   :step:
       Click on ``Storage`` button again.
   :result:
       Just created RBD is shown in the list, there are no errors reported.

       (We do this just to check that RBD has been created, there is another
       test case for RBD listing)

.. test_action::
   :step:
       From monitor machine, see status of just created pool via::

           ceph -c /etc/ceph/alpha.conf osd pool ls
   :result:
       The command shows the just created pool::

           # ceph -c /etc/ceph/alpha.conf osd pool ls
           rbd_pool

.. test_action::
   :step:
       From monitor machine, see just created rbd device via::

           rbd -c /etc/ceph/alpha.conf ls rbd_pool

       And check details via::

           rbd -c /etc/ceph/alpha.conf -p rbd_pool info rbd0
   :result:
       The command shows the just created rbd device::

           # rbd -c /etc/ceph/alpha.conf ls rbd_pool
           rbd0

       And provided details matches what has been specified via web gui::

           # rbd -c /etc/ceph/alpha.conf -p rbd_pool info rbd0
           rbd image 'rbd0':
               size 1024 MB in 256 objects
               order 22 (4096 kB objects)
               block_name_prefix: rbd_data.135582ae8944a
               format: 2
               features: layering, exclusive-lock, object-map, fast-diff, deep-flatten
               flags:

Teardown
========

#. Log out

#. Close browser
