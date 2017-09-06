Import cluster
********************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

Import existing cluster.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

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
      | Follow wizard for importing cluster.
      | Volume profiling (checkbox ``Enable Volume profiling.``) leave enabled (should be the default).
   :result:
      Cluster is successfully imported.

.. test_action::
   :step:
      | Login to one of the gluster storage server via SSH and check if Volume Profiling is enabled.
      | ``gluster volume profile <VOLUME-NAME> info``
   :result:
      Volume profiling should be enabled and the gluster command should print statistics.

Teardown
========
#. Log out

#. Close browser
