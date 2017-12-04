Gluster Native Alerting for Geo Replication
*******************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Geo-replication checkpoint completed for session

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_

Setup
=====

#. You need two independent gluster trusted storage pools (with at lest one
   volume on each) with `Geo Replication`_ enabled.

Test Steps
==========

.. test_action::
   :step:
       * TODO: figure out which event maches the alert (see description
         section), I don't see anything which matches it in `Gluster Events
         APIs`_
       * TODO: figure out how to invoke the event
   :result:
