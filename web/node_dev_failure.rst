Simulate failure of physical drive
************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Tescase try to simulate device failure and check if all related part of Tendrl indicate this failure.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan* where nodes are VMs on physical host

#. On nodes prepare disks with https://en.wikipedia.org/wiki/Device_mapper

#. Create cluster as in testcase *Cluster create* with disks from previous point

#. Create pool and RBD as in testcases *Create pool* and *Create RBD* in cluster from previous point

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_step:: 1

   Activate mode flakey on disks where are RBD and pool.

.. test_result:: 1

   There are alerts about errors on disks.

.. test_step:: 2

   Try to write data on RBD and pool.

.. test_result:: 2

   There are alerts about errors on disks.

Teardown
========

#. Disable flakey mode on disks

#. Log out

#. Close browser
