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

.. test_step:: 1
  
    Go to ``Storage``
  
.. test_result:: 1
   
    Storage list is shown.

.. test_step:: 2

    Click on menu at the end of storage description and click on ``Show snapshots``.

.. test_result:: 2

    List of snapshots is shown.

.. test_step:: 3

    Click on menu at the end of snapshot description and click on ``Delete snapshot``.

.. test_result:: 3

    Check if snapshot is deleted in UI and in storage.

Teardown
========
#. Log out

#. Close browser
