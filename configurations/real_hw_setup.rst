Testing on Real Hardware
************************

:authors: dahorak@redhat.com

Description
===========

.. note:: under construction - need update

Description of requirements for testing on real hardware cluster.

Requirements
============

- 1 Storage Console Server (``usm_server``)
- 1 Client Machine (``usm_client``)
- 8+ Storage Servers (``usm_node, gluster``)

Further mentioned requirements (RAM, CPU, Storage,...) are just minimal, anything more is better.

Storage Console Server
----------------------
- RAM: 16GB
- CPU: 4 cores
- storage: 1 disk, 200GB

Client Machine
--------------
- RAM: 16GB
- CPU: 4 cores
- storage: 1 disk, 200GB

Storage Servers
---------------
- RAM: 16GB
- CPU: 4 cores
- storage: 
    | 1 disk, 200GB for OS
    | 4+ disks 500GB for storage bricks

Setup
=====

Detailed setup is (will be) described in other related documents.
In brief overview it should look like this:

#. Install and configure Gluster Storage on Storage Servers.
#. Install and configure Tendrl Server on Storage Console Server.
#. Install and configure Gluster client on Client Machine.
#. Install and configure Tendrl node agents on Storage Servers.
#. Import Gluster Storage into Tendrl.
#. Perform any required tests and configuration changes related to particular test.
