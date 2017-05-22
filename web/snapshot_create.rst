Create snapshot
****************

:authors: 
          - mkudlej@redhat.com

Description
===========

Create pool snapshot.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. At least one cluster is created(*Cluster create* testcase)

Test Steps
==========

.. test_action::
   :step:
       Go to ``Storage``
   :result:
       Storage list is shown.

.. test_action::
   :step:
       Click on menu at the end of storage description and click on ``Create snapshot`` and wait for end of process.
   :result:
       Check if snapshot was created.


Teardown
========
#. Remove created snapshot

#. Log out

#. Close browser
