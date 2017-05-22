Delete snapshot
****************

:authors: - mkudlej@redhat.com

Description
===========

Delete snapshot.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. At least one cluster is created(*Cluster create* testcase)

#. At least one snapshot is created(*Create snapshot* testcase)

Test Steps
==========

.. test_action::
   :step:
       Go to ``Storage``
   :result:
       Storage list is shown.

.. test_action::
   :step:
       Click on menu at the end of storage description and click on ``Show snapshots``.
   :result:
       List of snapshots is shown.

.. test_action::
   :step:
       Click on menu at the end of snapshot description and click on ``Delete snapshot``.
   :result:
       Check if snapshot is deleted in UI and in storage.

Teardown
========
#. Log out

#. Close browser
