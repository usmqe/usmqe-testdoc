Install Ubuntu clients for Tendrl
**********************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Install Tendrl cluster with Ubuntu clients.

Setup
=====

Prepare several machines/VMs for following roles: usm_server(1), ceph_mon(3),
ceph_osd(4), gluster(4) - (in brackets is example number of nodes).  On
ceph_mon and ceph_osd machines install Ubuntu.

Test Steps
==========

.. test_action::
   :step:
       Install Tendrl and create cluster accordingly to
       :doc:`/setup/install_default`.
   :result:
       It is possible to create cluster and perform additional tasks as with
       other Tendrl cluster.

Teardown
========
