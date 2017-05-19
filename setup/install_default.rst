Install default
***************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Default installation of Tendrl cluster.

Setup
=====

Prepare several machines/VMs for following roles: usm_server(1), ceph_mon(3),
ceph_osd(4), gluster(4)- (in brackets is example number of nodes).

Test Steps
==========

.. test_action::
   :step: Follow current documentation from `Tendrl Package Installation Reference`_.
   :result: Tendrl UI is available via web browser on ``http://TENDRL-SERVER``.

Teardown
========
