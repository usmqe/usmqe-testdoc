Install Ubuntu clients for Tendrl
**********************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Install Tendrl cluster with RHEL 6 clients.

Setup
=====

Prepare several machines/VMs for following roles: usm_server(1), ceph_mon(3),
ceph_osd(4), gluster(4) - (in brackets is example number of nodes).
On gluster machines install RHEL 6.

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
