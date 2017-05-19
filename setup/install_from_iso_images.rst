Install Tendrl server from ISO
*******************************

:author: - dahorak@redhat.com
         - mkudlej@redhat.com

Description
===========

Install Tendrl server from ISO image.

Setup
=====

Prepare VM and install it from Tendrl server ISO image.

Test Steps
==========

.. test_action::
   :step: Boot from the ISO.
   :result: It is possible to boot from the iso and start installation.

.. test_action::
   :step: Install RHEL 7 and Tendrl.
   :result:
       It is possible to complete whole installation of RHEL 7 and Tendrl
       server from the ISO.

.. test_action::
   :step: Create cluster accordingly to :doc:`/setup/install_default`.
   :result:
       It is possible to create cluster and perform additional tasks as with
       other Tendrl server.

Teardown
========
