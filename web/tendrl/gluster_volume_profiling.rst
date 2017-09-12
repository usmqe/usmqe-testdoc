Gluster Volume Profiling
************************

:authors:
          - dahorak@redhat.com

Description
===========

Enable/disable cluster wide volume profiling
(both on initial import and post import).

* `Gluster Volume Profiling`_

Setup
=====

Perform following Setup and Test Steps twice:

* firstly with enabling Volume Profiling during cluster import (default)
* secondly with disabling Volume Profiling during cluster import

Setup steps:

#. Prepare Gluster trusted storage pool (Gluster cluster).
#. Create two Gluster volumes, enable Volume profiling on one volume.
    (``gluster volume profile <VOLUME-NAME> start``)
#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`
#. Import cluster into Tendrl, see :doc:`/web/tendrl/cluster_import`

Test Steps
==========

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled or disabled for all Volumes.

      ``gluster volume profile <VOLUME-NAME> info``
   :result:
      Volume profiling for all volumes should be in the state (enabled or disabled) accordingly to the configured state during cluster import.

.. test_action::
   :step:
      Go to ``Clusters`` page.
   :result:
      List of clusters page is shown.

.. test_action::
   :step:
      Change the state of Volume Profiling by clicking on the respective menu item.
   :result:
      Popup message appear with following text: *Volume profiling updated successfully.*

.. test_action::
   :step:
      Wait a minute and check the state in *Volume Profile* column.
   :result:
      Volume profiling should be in the correct state (enabled or disabled).

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled or disabled for all volumes.

      ``gluster volume profile <VOLUME-NAME> info``

   :result:
      Volume profiling should be in the correct state (enabled or disabled) for all volumes.

.. test_action::
   :step:
      Repeat the previous steps and change the Volume Profiling state (enabled/disabled) multiple times.

   :result:

.. test_action::
   :step:
      Enable Volume profiling.
   :result:

.. test_action::
   :step:
      Create new Gluster Volume and wait a minute.
   :result:

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled or disabled for the new volume.

      ``gluster volume profile <VOLUME-NAME> info``

   :result:
      Volume profiling should be enabled for the new volume.


Teardown
========
#. Log out

#. Close browser

.. _Gluster Volume Profiling: https://gluster.readthedocs.io/en/latest/Administrator%20Guide/Monitoring%20Workload
