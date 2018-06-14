Gluster brick utilization
*************************

:authors:
          - fbalak@redhat.com

Description
===========

Check utilization of bricks in Tendrl UI.

.. warning::

    This test case requires a replicated volume, which is not included in
    ``usmqe-setup/gdeploy_config/``. For this reason, **this test case should
    not be part of any test plan** until this test case is updated and one of
    the usmqe volumes is used instead. All tests we run have to use gluster
    volume which is described in gdeploy config files in
    ``usmqe-setup/gdeploy_config/`` directory.

Setup
=====

#. Prepare hosts for Gluster trusted storage pool with a volume hosted on
   multiple bricks.
#. Prepare host for Tendrl server.
#. Prepare Gluster trusted storage pool (Gluster cluster).
#. Create Gluster replicated volume.
#. Make sure you have Gluster volume mounted on a client machine.
#. Login user into Tendrl (see :doc:`/web/tendrl/login_positive`) in two
   browser windows.
#. Import cluster into Tendrl (see :doc:`/web/tendrl/cluster_import`) in first
   browser window.

Test Steps
==========

.. test_action::
   :step:
      After import cluster job finishes, click on **View cluster details**
      in first browser window.
   :result:
      **Hosts** page for given cluster is shown.

.. test_action::
   :step:
      Click on address of first host in first browse window window.
   :result:
      **Brick Details** page is shown.

.. test_action::
   :step:
      Click on **ID** of imported cluster in second browser window.
   :result:
      **Hosts** page for given cluster is shown.

.. test_action::
   :step:
      Click on **Volumes** in left panel in second browser window.
   :result:
      **Volumes** page with list of volumes for given cluster is shown.

.. test_action::
   :step:
      Click on a name of volume in second browser window.
   :result:
      **Brick Details** page for given volume with list of replica sets is shown.

.. test_action::
   :step:
      Click on all replica sets listed in second browser window.
   :result:
      All list items are expanded and list of bricks for each replica set is
      revealed.

.. test_action::
   :step:
      Open terminal, connect to host selected in previous step and run command:
      
      ``gluster volume info``
      
      Compare output of this command with information displayed in Tendrl UI
      in both browser windows.
   :result:
      In Tendrl UI are listed all bricks that are in output of gluster command.
      No brick is missing or is an extra.

.. test_action::
   :step:
      In terminal execute:
      
      ``gluster volume status [VOLUME] detail``
      
      Compare output of this command with information displayed in Tendrl UI
      in both browser windows.
   :result:
      Utilization of bricks in Tendrl UI corresponds with informations
      collected by the gluster command. Brick utilization could be computed
      from metrics *Disk Space Free* and *Disk Space Free*. Utilization for all
      bricks should be near 0% for all bricks at the moment.

.. test_action::
   :step:
      In second browser window check value of utilization for replica set.
   :result:
      Utilization of replica set consists of percentage of sums of metrics
      *Disk Space Free* and *Disk Space Free*.

.. test_action::
   :step:
      During testing change host for **Brick Details** page in first browser
      window: Click on **Hosts** label in breadcrumbs navigation and click on
      next host address when **Hosts** page is loaded. Do this for each host.
   :result:
      Utilization of bricks for all hosts are tested.

.. test_action::
   :step:
      Log into a client machine, where the volume is mounted. Try to fill the
      volume with data:

      ``for i in {1..N-1}; do dd if=/dev/zero of=/[MOUNT]/testfile$i bs=1G count=1; done``
      
      where ``N`` is capacity in GiB and ``[MOUNT]`` is directory with mounted
      volume. Monitor changes with:
      
      ``gluster volume status [VOLUME] [HOST]:/[BRICK] detail``
      
      where ``[VOLUME]`` is name of volume, ``[HOST]`` is monitored machine and
      ``[BRICK]`` is brick path.
   :result:
      In Tendrl UI is reflected change of utilization for all bricks.

Teardown
========
#. Log out

#. Close browser
