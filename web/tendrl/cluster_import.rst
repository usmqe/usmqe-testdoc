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

#. Prepare Gluster cluster with 2 Volumes.

#. Enable Gluster Volume Profiling on one Volume:

  ``gluster volume profile <VOLUME-NAME> start``

3. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

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
      | Login to one of the gluster storage server via SSH and check if Volume Profiling is enabled on both volumes.
      | ``gluster volume profile <VOLUME-NAME> info``
   :result:
      Volume profiling should be enabled on both volumes and the gluster command should print some statistics.

Teardown
========
#. Log out

#. Close browser
