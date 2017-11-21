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
* RHG3-12335

Setup
=====

#. You need a gluster trusted storage pool.
#. You also need a machine which you can shutdown temporarily.
#. You also need access to a storage node which is part of **another**
   gluster trusted storage pool (eg. machine of your colleague, as long
   as it's up and running, is good enough).

Test Steps
==========

.. test_action::
   :step:
       Try to do a peer probe to a machine that does not have an existential
       presence (invalid hostname or ip address).
   :result:
       Tendrl sends the following alerts:

       * Peer has moved to unknown state (``UNKNOWN_PEER``)
       * Peer rejected (``PEER_REJECT``)

       Also make sure that the peer is identified in the alert.

.. test_action::
   :step:
       Try to do a peer probe to a machine that is unknown to the cluster
       (machine is not reachable, ping should timeout). You can temporary
       shutdown some machine to use it for this test step.
   :result:
       Tendrl sends the following alerts:

       * Peer has moved to unknown state (``UNKNOWN_PEER``)
       * Peer rejected (``PEER_REJECT``)

       Also make sure that the peer is identified in the alert.

.. test_action::
   :step:
       Try to do a peer probe to a node that is already part of **another**
       cluster (eg. machine from your colleague's cluster).
   :result:
       Tendrl sends the following alerts:

       * Peer has moved to unknown state (``UNKNOWN_PEER``)
       * Peer rejected (``PEER_REJECT``)

       Also make sure that the peer is identified in the alert.

Teardown
========

#. Make sure all machines used during testing are up again.
