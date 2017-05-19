List snapshots
****************

:author: mkudlej@redhat.com

Description
===========

List pool snapshots.

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

    Check all snapshots in list.

.. test_result:: 3

    Check if all snapshot in list have same attributes in UI and in storage.

Teardown
========
#. Log out

#. Close browser
