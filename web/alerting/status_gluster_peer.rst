Status of Gluster Peer
**********************

:author: mbukatov@redhat.com
         mkudlej@redhat.com

Description
===========

Alerts covered in this test case:

* peer status (cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_

Setup
=====

#. You need a gluster trusted storage pool.

Test Steps
==========

.. test_action::
   :step:
       Turn off one of machine in Glsuter storage pool.

   :result:
       There is alert: "status changed of peer from Connected to Disconnected".
       There is info about cluster ID and peer hostname.

.. test_action::
   :step:
       Turn on back one of machine in Glsuter storage pool.

   :result:
       There is alert: "status changed of peer from Disconnected to Connected".
       There is info about cluster ID and peer hostname.


Teardown
========

#. Make sure all machines used during testing are up again.
