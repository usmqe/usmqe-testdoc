Gluster Native Alerting for Peers
*********************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Peer has moved to unknown state (``UNKNOWN_PEER``)
* Peer rejected (``PEER_REJECT``)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_

Setup
=====

#. You need a gluster trusted storage pool.

Test Steps
==========

.. test_action::
   :step:
       TODO: figure out how to invoke ``UNKNOWN_PEER`` event
   :result:

.. test_action::
   :step:
       TODO: figure out how to invoke ``PEER_REJECT`` event
   :result:

Teardown
========

#. Make sure all machines used during testing are up again.
