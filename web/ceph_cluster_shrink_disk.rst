Remove disk from the Ceph cluster
**********************************

:authors: 
          - ltrilety@redhat.com
          - mkudlej@redhat.com

Description
===========

As an Admin, I want to be able to remove a given OSD from Ceph cluster systematically so that I can replace
existing failing media or otherwise replace with more performant or greater capacity media as needed

Setup
=====
#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl UI, see :doc:`/web/login_positive`

#. There are some Ceph clusters.

#. Create some pool(s) on the cluster and fill it/them with some data.

Test Steps
==========

.. test_action::
   :step:
       Find an option for disk removal from node
   :result:
       The option is available

.. test_action::
   :step:
       Choose some OSD node which is not part of pool and follow required steps for disk removal
   :result:
       First the disk state change to some which indicates that the disk will be removed and then
       the disk is removed successfuly, it's not visible on UI and number of disks is reduced for the node.
       Verify that cluster size is reduced properly.
       Verify what happens to storage profiles - size of the related one should be reduced in cluster.
       If the disk is the last one in cluster there should be some error printed and removal should fail.

.. test_action::
   :step:
       Choose some OSD node which is part of some pool and follow required steps for disk removal
   :result:
       First the disk state change to some which indicates that the disk will be removed.
       Verify that some operation for transfer/rebalance data is started.
       If there is not enough space on remaining disks for the pool UI should print some error message
       and the operation fail or tell that to user and let him/her decide if he/she wants to continue.
       Verify that later the disk is removed successfuly,
       it's not visible on UI and number of disks is reduced for the node.
       Verify that cluster and pool sizes are reduced properly.
       Verify what happens to storage profiles - size of the related one should be reduced in cluster.
       Verify that all data are still available on the pool.
       If the disk is the last one in pool there should be some error printed and removal should fail. ??

Teardown
========
#. Log out

#. Close browser
