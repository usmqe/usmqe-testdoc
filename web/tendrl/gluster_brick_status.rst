Gluster brick status
********************

:authors:
          - fbalak@redhat.com

Description
===========

Check status of bricks in Tendrl UI.

Setup
=====

#. Prepare hosts for Gluster cluster with volume containing multiple bricks.
#. Prepare host for Tendrl server.
#. Prepare Gluster trusted storage pool (Gluster cluster).
#. Create Gluster replicated volume.
#. Mount Gluster volume on some machine. (add record in format
   ``[HOST]:/[VOLUME] /[MOUNT] glusterfs defaults,_netdev 0 0``
   into ``/etc/fstab`` and run command ``mount -a``)
#. Login user into Tendrl (see :doc:`/web/tendrl/login_positive`) in two
   browser windows.
#. Import cluster into Tendrl (see :doc:`/web/tendrl/cluster_import`) in first
   browser window.

Test Steps
==========

.. test_action::
   :step:
      After import cluster job finishes, click on ``View cluster details``
      in first browser window.
   :result:
      *Hosts* page for given cluster is shown.

.. test_action::
   :step:
      Click on address of first host in first browse window window.
   :result:
      *Brick Details* page is shown.

.. test_action::
   :step:
      Click on *ID* of imported cluster in second browser window.
   :result:
      *Hosts* page for given cluster is shown.

.. test_action::
   :step:
      Click on *Volumes* in left panel in second browser window.
   :result:
      *Volumes* page with list of volumes for given cluster is shown.

.. test_action::
   :step:
      Click on a name of volume in second browser window.
   :result:
      *Brick Details* page for given volume with list of replica sets is shown.

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
      In Tendrl UI are listed all bricks that are in output of gluster command.
      No brick is missing or is an extra.
      In second browser bricks should be listed in correct replica set.
      This can be checked from ``gluster volume status`` command. Replica sets
      are based on *replica count* for given volume. Hosts ordered by
      ``gluster volume status`` and split by *replica count* form replica sets.
      All bricks that have *Y* in *Online* column are marked as *started* in UI.
      All bricks that have *N* in *Online* column are marked as *stopped* in UI.
      For each status is displayed correct symbol.

.. test_action::
   :step:
      Gradually shut down all bricks:
      Get *PID* of process that handles the brick with:
      ``gluster volume status``
      Log into the machine where the brick is located and call ``kill [PID]``
   :result:
      After each calling of ``kill [PID]`` is stopped a brick and it is
      reflected in UI by symbol *stopped* next to displayed brick.

.. test_action::
   :step:
      During testing change host for *Brick Details* page in first browser
      window: Click on *Hosts* label in breadcrumbs navigation and click on
      next host address when *Hosts* page is loaded. Do this for each host.
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
