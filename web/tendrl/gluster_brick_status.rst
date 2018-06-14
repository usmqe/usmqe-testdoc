Gluster brick status
********************

:authors:
          - fbalak@redhat.com

Description
===========

Check status of bricks in Tendrl UI.

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
      Open terminal, connect to host selected in previous steps and run command:
      
      ``gluster volume status``
      
      Compare output of this command with information displayed in Tendrl UI
      in both browser windows.
   :result:
      All bricks present in an output of the gluster command are listed in
      Tendrl UI. No brick is missing or extraneous.

      In the second browser, bricks should be listed in correct replica set.
      This can be checked from ``gluster volume status`` command. Replica sets
      are based on *replica count* for given volume. Hosts ordered by
      ``gluster volume status`` and split by *replica count* form replica sets.

      All bricks that have *Y* in *Online* column are marked as *started* in UI.

      All bricks that have *N* in *Online* column are marked as *stopped* in UI.

      For each status a correct symbol is displayed.

.. test_action::
   :step:
      Gradually shut down all bricks:
      Get PID of process that handles the brick with ``gluster volume status``,
      then log into the machine where the brick is located and call
      ``kill [PID]``.
   :result:
      After each calling of ``kill [PID]`` is stopped a brick and it is
      reflected in UI by symbol *stopped* next to displayed brick.

.. test_action::
   :step:
      During testing change host for **Brick Details** page in first browser
      window: Click on **Hosts** label in breadcrumbs navigation and click on
      next host address when **Hosts** page is loaded. Do this for each host.
   :result:
      Utilization of bricks for all hosts are tested.

.. test_action::
   :step:
      On one of the nodes call:
      ``gluster volume [VOLUME] start force``
   :result:
      In UI are all bricks in *started* state.

Teardown
========

#. Log out

#. Close browser
