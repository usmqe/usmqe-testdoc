Import cluster
********************

:authors: 
          - mkudlej@redhat.com

Description
===========

Import existing cluster.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_action::
   :step:
       Go to ``Clusters``
   :result:
       List of clusters page is shown.

.. test_action::
   :step:
       Click on ``Import Cluster`` button
   :result:
       Wizard for importing cluster is shown.

.. test_action::
   :step:
      Follow wizard for importing cluster.
   :result:
      Cluster is successfully imported.

Teardown
========
#. Remove added cluster(*Forget cluster* testcase)

#. Log out

#. Close browser
