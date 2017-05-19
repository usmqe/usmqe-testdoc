Import Ceph cluster installed  by ansible cluster
*************************************************

:authors:
          - mkudlej@redhat.com

Description
===========

Import existing cluster installed by Ceph Ansible.

Setup
=====
.. _`crush map`: http://docs.ceph.com/docs/master/rados/operations/crush-map/
.. _`ceph installation instruction`: https://access.qa.redhat.com/documentation/en/red-hat-ceph-storage/2/installation-guide-for-red-hat-enterprise-linux/#installing_red_hat_ceph_storage_using_ansible
.. _Design document for import: https://redhat.invisionapp.com/share/R88EUSGJK#/screens/193145496

#. Install Tendrl according installation instruction written in *Test Plan*

#. Install *ssh key* to *Server* machine

#. Follow `ceph installation instruction`_

    changes in all::

        fetch_directory: ~/ceph-ansible-keys
        cluster: ceph_ansible # cluster name
        ceph_stable: true # use ceph stable branch
        ceph_stable_rh_storage: true
        ceph_stable_rh_storage_iso_install: true # usually used when nodes don't have access to cdn.redhat.com
        ceph_stable_rh_storage_iso_path: /root/Ceph-2.0-RHEL-7-20160708.1-x86_64-dvd.iso
        ceph_stable_rh_storage_mount_path: /root/iso
        cephx: true
        monitor_interface: eth0
        journal_size: 4096
        public_network:  10.70.46.11/22

    and osds::

        crush_location: false
        osd_crush_location: "'root={{ ceph_crush_root }} rack={{ ceph_crush_rack }} host={{ ansible_hostname }}'"
        devices:
          - /dev/vdc
        raw_multi_journal: true
        raw_journal_devices:
          - /dev/vdb


    Change in /usr/share/ceph-ansible/roles/ceph-common/tasks/pre_requisites/prerequisite_rh_storage_iso_install.yml
    see :RHBZ:`1355762`::

        - name: create red hat storage package directories
          file:
            path: "{{ item }}"
            state: directory
          with_items:
            - "{{ ceph_stable_rh_storage_mount_path }}"
            - "{{ ceph_stable_rh_storage_repository_path }}"

        - name: fetch the red hat storage iso from the ansible server
          copy:
            src: "{{ ceph_stable_rh_storage_iso_path }}"
            dest: "/root"

#. (optional step) Change `crush map`_
    - get crush map::

      $ ceph osd getcrushmap > crush.map

    - decompile it::

      $ crushtool --decompile crush.map > crush.txt

    - add some new root and related rule to the crush.txt
        - add these lines to the ``# buckets`` section::

            root test_root {
                    id -20          # do not change unnecessarily
                    alg straw
                    hash 0  # rjenkins1
                    item <item_name1> weight 0.010
                    item <item_name2> weight 0.010
            }

          as ``<item_name1>`` and ``<item_name2>`` choose some items from existing ones, look for ``root default``

        - remove ``<item_name1>`` from ``root default`` list of items
        - add following lines to the ``# rules`` section::

            rule test {
                    ruleset 1
                    type replicated
                    min_size 1
                    max_size 10
                    step take test_root
                    step chooseleaf firstn 0 type osd
                    step emit
            }

    - compile it back::

      $ crushtool --compile crush.txt -o edited-crush.map

    - import the map::

      $ ceph osd setcrushmap -i edited-crush.map

#. (optional step) Create some pool and rbd
    - create pool (if possible use a new rule from previous step)::

          ceph osd pool create <pool_name> [<PG_number>] test

      if there is no new rule a pool could be created by::

          rados mkpool <pool_name>

      or::

          ceph osd pool create <pool_name> [<PG_number>]

    - create rbd::

        rbd create -p <pool_name> --size <size> <rbd_name>

During testing `Design document for import`_ should be considered.


Test Steps
==========

.. test_step:: 1

    Go to ``Clusters``

.. test_result:: 1

    List of clusters page is shown.

.. test_step:: 2

    Click on ``Import Cluster`` button

.. test_result:: 2

    Wizard for importing cluster is shown.

.. test_step:: 3

    Select node where Calamari is installed and click on ``Continue``

.. test_result:: 3

    ``Cluster Summary`` is shown with proper values.

.. test_step:: 4

   Click on ``Import`` button

.. test_result:: 4

   Import task is opened.

.. test_step:: 5

    Check if task and imported cluster.

.. test_result:: 5

    Import task pass and cluster is imported properly.
    Check that a new pool could be created.

Teardown
========
#. Remove added cluster(*Forget cluster* testcase)

#. Log out

#. Close browser
