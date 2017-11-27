Gluster Volume Profiling - Initially Enabled (default)
******************************************************

:authors:
          - dahorak@redhat.com

Description
===========

Enable/disable cluster wide volume profiling
(both on initial import and post import).

This Test Case cover situation, when Volume Profiling is Enabled on cluster
level during cluster import process (which is default behaviour of Tendrl).

* `Gluster Volume Profiling`_

Setup
=====

#. Prepare hosts for Gluster cluster with enough bricks for three Volumes.
#. Prepare host for Tendrl server.
#. Prepare Gluster trusted storage pool (Gluster cluster).
#. Create two Gluster volumes, enable Volume profiling on one of them.
    (``gluster volume profile <VOLUME-NAME> start``)
#. Login user into Tendrl (see :doc:`/web/tendrl/login_positive`).
#. Import cluster into Tendrl and leave the checkbox *Enable Volume profiling*
   in default (True) state (see :doc:`/web/tendrl/cluster_import`).

Test Steps
==========

.. test_action::
   :step:
      When the cluster is fully imported, login to one of the gluster storage
      server via SSH and check if Volume Profiling is enabled for all Volumes.

      ``gluster volume profile <VOLUME-NAME> info``
   :result:
      Volume profiling for all volumes should be enabled
      (it will print number of statistics data).

.. test_action::
   :step:
      Go to *Clusters* page.
   :result:
      List of Clusters is shown.

.. test_action::
   :step:
      Disable cluster vide Volume Profiling by clicking on the *Disable Profiling* button.
   :result:
      Popup message appear with following text:

      *Volume profiling disabled successfully.*

.. test_action::
   :step:
      Wait few minutes and check the state in *Volume Profile* column in Tendrl on *Clusters* page.
   :result:
      Volume profiling should be *Disabled*.

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is disabled for all volumes.

      ``gluster volume profile <VOLUME-NAME> info``

   :result:
      Volume profiling should be disabled for all volumes.

      ``Profile on Volume <VOLUME-NAME> is not started``

.. test_action::
   :step:
      Enable cluster vide Volume Profiling by clicking on the *Enable Profiling* button.
   :result:
      Popup message appear with following text:

      *Volume profiling enabled successfully.*

.. test_action::
   :step:
      Wait few minutes and check the state in *Volume Profile* column in Tendrl on *Clusters* page.
   :result:
      Volume profiling should be *Enabled*.

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled for all volumes.

      ``gluster volume profile <VOLUME-NAME> info``

   :result:
      Volume profiling should be enabled for all volumes
      (it will print number of statistics data).

.. test_action::
   :step:
      Create new Gluster Volume and wait few minutes.
   :result:

.. test_action::
   :step:
      Login to one of the gluster storage server via SSH and check
      if Volume Profiling is enabled for the newly created volume.

      ``gluster volume profile <VOLUME-NAME> info``

   :result:
      Volume profiling should be enabled for the new volume.
      (it will print number of statistics data).


.. test_action::
   :step:
      Change the Volume Profiling state multiple times (Enable and Disable it
      as described above) and check if the Volume Profiling is correctly
      enabled/disabled in Gluster for each Volume.
      Between each step, wait few minutes.

   :result:
      Volume Profiling should reflect the state configured in Tendrl.

Teardown
========
#. Log out

#. Close browser

.. _Gluster Volume Profiling: https://gluster.readthedocs.io/en/latest/Administrator%20Guide/Monitoring%20Workload
