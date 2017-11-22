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

#. You need a gluster volume (no gluster volume usmqe team uses right now
   seem to work, see :rhbz:`1516484`)
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
       On some storage machine, run on demand scrubbing for Bitrot Detection on
       the volume:

       .. code-block:: console

           # gluster volume bitrot VOLNAME scrub ondemand
   :result:
       The process ends with success, printing the following on stdout:

       .. code-block:: console

           volume bitrot: success

.. test_action::
   :step:
       Create bitrot problem for the test file.

       Locate some brick which stores the testing file. You can use ansible
       for that, from usmqe server run something like:

       .. code-block:: console

           $ ansible -i usm1.hosts -m shell -a 'tree /mnt/brick_VOLNAME*' all

       Edit this file directly on the brick, changing it's content. So for
       example:

       .. code-block:: console

          [root@usm1-gl6 ~]# vim /mnt/brick_VOLNAME_3/3/glusternative_bitrot.testfile

.. test_action::
   :step:
       Rerun scrub on the volume:

       .. code-block:: console

           # gluster volume bitrot VOLNAME scrub ondemand
   :result:
       TODO: verify (this didn't happened on volume_beta_arbiter_2_plus_1x2)

       The srub error should be detected, and Tendrl should create an alert
       for this event.


Teardown
========

#. Disable bitrot on the volume. On one of storage nodes, run:

   .. code-block:: console

      # gluster volume bitrot VOLNAME disable

#. Make sure all machines and volume used during testing are up again.
#. Make sure that on the volume, there are no leftover files affected by bitrot
   errors (just delete them, TODO: verify).
