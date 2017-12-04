Gluster Native Alerting for Bitrot
**********************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* File with gfid corrupted due to bitrot in brick (``BITROT_BAD_FILE``)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* `Gluster Events APIs`_
* `Gluster BitRot Detection`_
* :rhbz:`1516484`

Setup
=====

#. You need a gluster volume.
#. Enable bitrot detection on the volume. On one of storage nodes, run:

   .. code-block:: console

      # gluster volume bitrot VOLNAME enable
      volume bitrot: success

Setup automation pending:

* TODO: create `gdeploy config file
  <https://github.com/usmqe/usmqe-setup/issues/159>`_ to replace manual steps
  listed above

Test Steps
==========

.. test_action::
   :step:
       On client machine (with mounted glusterfs volume), create a test file
       with simple content like this:

       .. code-block:: console

           # cd /mnt/VOLNAME
           # echo "this is a test file" > glusternative_bitrot.testfile
   :result:
       The file has been created with success:

       .. code-block:: console

           # cd /mnt/VOLNAME
           # cat glusternative_bitrot.testfile
           this is a test file

.. test_action::
   :step:
       On some storage machine, start ondemand scrubbing for Bitrot Detection
       on the volume:

       .. code-block:: console

           # gluster volume bitrot VOLNAME scrub ondemand

       and check the result:

       .. code-block:: console

           # gluster volume bitrot VOLNAME scrub status | grep -i error

   :result:
       The process is started with success, printing the following on stdout:

       .. code-block:: console

           volume bitrot: success

       and when checking the result, there are no errors detected.

.. test_action::
   :step:
       Create bitrot problem for the test file.

       Locate some brick which stores the testing file. You can use ansible
       for that, from usmqe server run something like:

       .. code-block:: console

           $ ansible -i usm1.hosts -m shell -a 'find /mnt/brick_VOLNAME* -name glusternative_bitrot.testfile' gluster

       Edit this file directly on the brick, changing it's content. So for
       example:

       .. code-block:: console

          [root@usm1-gl6 ~]# vim /mnt/brick_VOLNAME_3/3/glusternative_bitrot.testfile

.. test_action::
   :step:
       Rerun scrub on the volume:

       .. code-block:: console

           # gluster volume bitrot VOLNAME scrub ondemand

       and check the result:

       .. code-block:: console

           # gluster volume bitrot VOLNAME scrub status | less
   :result:
       The srub error should be detected, the scrub status output contains
       error details including::

           Error count: 1

           Corrupted object's [GFID]:

           420aa5a9-5444-4cee-9901-df606c600c6e

       Based on that, GlusterFS generates native event for this, as you can see
       in ``/var/log/glusterfs/events.log`` file on the machine which hosts
       brick with affected file.

       Tendrl should create an alert for this event, and GFID of affected file
       should match what you have seen in output of scrub status command.


Teardown
========

#. Disable bitrot on the volume. On one of storage nodes, run:

   .. code-block:: console

      # gluster volume bitrot VOLNAME disable

#. Make sure all machines and volume used during testing are up again.
#. Make sure that on the volume, there are no leftover files affected by bitrot
   errors (just delete them).
