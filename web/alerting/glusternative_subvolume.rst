Gluster Native Alerting for Subvolume
*************************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* Subvolume affected by split-brain (``AFR_SPLIT_BRAIN``)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_
* According to `Gluster Glossary`_, *subvolume* is "a brick after being
  processed by at least one translator"
* AFR stands for `Automatic File Replication`_
* RHG3-12336
* `Split brain and the ways to deal with it`_

.. note::

   Since this test case requires volume `volume_alpha_distrep_6x2`_ which
   is not in our current set of volumes we test with, we should remove this
   test case from the test plan.

Setup
=====

#. You need a gluster volume with AFR translator, in a configuration prone to
   split brain (with 2 bricks in replica set, without arbiter one):
   `volume_alpha_distrep_6x2`_.

#. You need **2 client machines** (you can ask your colleague for 2nd client
   machine and follow test steps without disrupting his setup, if you are
   careful).

   Update your inventory file so that ``usm_client`` group contains 2 machines.

#. Create new file ``splitbrain.testfile`` on the volume (which is
   mounted on 1st client machine).

   .. code-block:: console

       [root@usm1-client]# cd /mnt/VOLNAME
       [root@usm1-client]# echo 'Hello GlusterFS!' > splitbrain.testfile

#. Find out on which replica set ``splitbrain.testfile`` is stored, and write
   down all it's bricks. You can use ansible (from qe server) like this:

   .. code-block:: console

       # ansible -i usm1.hosts -m shell -a 'find /mnt/brick_* -name splitbrain.testfile' gluster

#. Update your inventory file again, this time add 2 new groups based on
   previous observation:

   .. code-block:: ini

       [gluster_splitbrain0]
       usm1-gl5.usmqe.example.com  # machine with brick of 1st replica

       [gluster_splitbrain1]
       usm1-gl4.usmqe.example.com  # machine with brick of 2nd replica

#. Manually or using playbook `test_setup.splitbrain.yml`_,
   create new mountpoint on 2nd client for the GlusterFS volume and
   reconfigure firewall on both client machines to drop network trafic:

   * from ``usm_client[0]`` machine to ``gluster_splitbrain0`` machines
   * from ``usm_client[1]`` machine to ``gluster_splitbrain1`` machines


Test Steps
==========

.. test_action::
   :step:
       Create a file in split-brain: update ``splitbrain.testfile`` file on
       both client machines, so that each group will contain different version
       of the file.
   :result:
       On both client machines, the file has different content.

.. test_action::
   :step:
       From some storage node, launch index heal via the CLI:

       .. code-block:: console

           [root@usm1-gl1 ~]# gluster volume heal VOLNAME full
           [root@usm1-gl1 ~]# gluster volume heal VOLNAME info split-brain

       Basically, every time the self-heal
       daemon encounters a file in split-brain, it gives out this event.
   :result:
       Tendrl sends alert "Subvolume affected by split-brain"
       (``AFR_SPLIT_BRAIN``).

Teardown
========

#. Resolve split brain (remove affected file on both clients).
#. Manually or using playbook `test_teardown.splitbrain.yml`_,
   unount glusterfs volume on the 2nd client and
   drop firewall rules added to both client machines.
#. Remove 2nd clinent from inventory file
#. Remove gluster splitbrain groups from inventory file
