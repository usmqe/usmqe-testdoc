Create Ceph cluster with HDD and SSD disks and check journal mappings
***********************************************************************

:authors:
          - dahorak@redhat.com
          - mkudlej@redhat.com

Description
===========

TODO: This testcase should be checked with current mappings

Create cluster (accordingly to *Create Ceph cluster* testcase)
with specific disk configuration to test journal mappings.

Reference and description about old journal mapping:

    https://github.com/skyrings/bigfin/blob/master/provider/cluster.go#L805

Reference and description about new journal mapping:

    https://github.com/Tendrl/node-agent/blob/master/tendrl/node_agent/provisioner/ceph/utils.py#L30

Setup
=====

Use following additional disks schema for storage nodes:

1. scenario

    - node1: 0 SSD,  8 HDD (1T, 1T, 1T, 1T, 1T, 1T, 1T, 1T)
    - node2: 0 SSD,  8 HDD (10G, 10G, 10G, 10G, 1T, 1T, 1T, 1T)
    - node3: 0 SSD,  8 HDD (4G, 5G, 10G, 1T, 1T, 1T, 1T, 1T)
    - node4: 0 SSD,  8 HDD (4G, 4G, 4G, 4G, 1T, 1T, 1T, 1T)

    Disk creation:
    ::

        IMAGES_PATH=/var/lib/libvirt/images/
        CLUSTER_NAME=dahorak-usm3
        
        # node1
        for i in $(seq 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node1-$i.img 1T;
        done
          
        # node2
        for i in $(seq 4); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 10G;
        done
        
        for i in $(seq 5 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 1T;
        done

        # node3
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-1.img 4G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-2.img 5G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-3.img 10G
        for i in $(seq 4 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-$i.img 1T
        done
       
        # node4 
        for i in $(seq 4); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-$i.img 4G
        done

        for i in $(seq 5 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-$i.img 1T
        done

    HDD/SSD disk configuration:
    ::

        ansible -i usersys_dahorak-usm3.hosts all  -m shell -a 'rm -f /etc/cron.d/ssd'
        ansible -i usersys_dahorak-usm3.hosts ceph_osd -m shell -a 'echo 1 > /sys/block/vdb/queue/rotational'

--------------------------

2. scenario

    - node1: 2 SSD (100G, 100G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
    - node2: 2 SSD (10G, 10G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
    - node3: 2 SSD (15G, 20G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
    - node4: 1 SSD (100G), 7 HDD (10G, 10G, 1T, 1T, 1T, 1T, 1T)

    Disk creation:
    ::

        IMAGES_PATH=/var/lib/libvirt/images/
        CLUSTER_NAME=dahorak-usm3
        
        # node1
        for i in $(seq 2); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node1-$i.img 100G
        done
        for i in $(seq 3 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node1-$i.img 1T
        done

        # node2
        for i in $(seq 2); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 10G
        done
        for i in $(seq 3 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 1T
        done

        # node3
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-1.img 15G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-2.img 20G
        for i in $(seq 3 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-$i.img 1T
        done

        # node4
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-1.img 100G
        for i in $(seq 2 3); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-$i.img 10G
        done
        for i in $(seq 4 8); do 
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-$i.img 1T
        done

    HDD/SSD disk configuration:
    ::

        CLUSTER_NAME=dahorak-usm3
        DOMAIN=localdomain
        # set /dev/vdb as SSD
        for i in $(seq 4); do
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} "echo 0 > /sys/block/vdb/queue/rotational"
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} 'echo "@reboot root echo 0 > /sys/block/vdb/queue/rotational" > /etc/cron.d/ssd'
        done

        # set /dev/vdc as SSD
        for i in $(seq 3); do
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} "echo 0 > /sys/block/vdc/queue/rotational"
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} 'echo "@reboot root echo 0 > /sys/block/vdc/queue/rotational" >> /etc/cron.d/ssd'
        done
        
--------------------------

3. scenario (use **16GB journal**!!)

    - node1: 2 SSD (32G, 32G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
    - node2: 2 SSD (64G, 64G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
    - node3: 2 SSD (65G, 65G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
    - node4: 2 SSD (40G, 80G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)

    Disk creation:
    ::

        IMAGES_PATH=/var/lib/libvirt/images/
        CLUSTER_NAME=dahorak-usm3
        
        # set node1 disks
        for i in $(seq 2); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node1-$i.img 32G
        done
        
        for i in $(seq 3 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node1-$i.img 1T
        done
        
        # set node 2
        for i in $(seq 2); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 64G
        done
        
        for i in $(seq 3 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 1T
        done
        
        # set node 3
        for i in $(seq 2); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-$i.img 65G
        done
        
        for i in $(seq 3 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-$i.img 1T
        done
        
        # set node 4
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-1.img 40G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-2.img 80G
        
        for i in $(seq 3 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-$i.img 1T
        done

    HDD/SSD disk configuration:
    ::

        CLUSTER_NAME=dahorak-usm3
        DOMAIN=localdomain
        for i in $(seq 4); do
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} "echo 0 > /sys/block/vdb/queue/rotational"
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} 'echo "@reboot root echo 0 > /sys/block/vdb/queue/rotational" > /etc/cron.d/ssd'
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} "echo 0 > /sys/block/vdc/queue/rotational"
          ssh root@${CLUSTER_NAME}-node$i.${DOMAIN} 'echo "@reboot root echo 0 > /sys/block/vdc/queue/rotational" > /etc/cron.d/ssd'
        done
        
--------------------------

4. scenario

    - node1: 8 SSD (1T, 1T, 1T, 1T, 1T, 1T, 1T, 1T), 0 HDD
    - node2: 8 SSD (100G, 100G, 1T, 1T, 1T, 1T, 1T, 1T), 0 HDD
    - node3: 8 SSD (11G, 11G, 11G, 1T, 1T, 1T, 1T, 1T), 0 HDD
    - node4: 8 SSD (6G, 11G, 16G, 100G, 1T, 1T, 1T, 1T), 0 HDD

    Disk creation:
    ::

        IMAGES_PATH=/var/lib/libvirt/images/
        CLUSTER_NAME=dahorak-usm3
        
        # set disks for node1
        for i in $(seq 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node1-$i.img 1T
        done
        
        # set disks for node2
        for i in $(seq 2); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 100G
        done

        for i in $(seq 3 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node2-$i.img 1T
        done

        # set disks for node3
        for i in $(seq 3); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-$.img 11G
        done 
        
        for i in $(seq 4 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node3-$i.img 1T
        done

        # set disks for node4
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-1.img 6G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-2.img 11G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-3.img 16G
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-4.img 100G

        for i in $(seq 5 8); do
          qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-node4-$i.img 1T
        done

    HDD/SSD disk configuration:
    ::

        ansible -i usersys_dahorak-usm3.hosts all  -m shell -a 'rm -f /etc/cron.d/ssd'
        for dev in vd{b..i}; do
          ansible -i usersys_dahorak-usm3.hosts ceph_osd -m shell -a "echo 0 > /sys/block/${dev}/queue/rotational"
          ansible -i usersys_dahorak-usm3.hosts ceph_osd -m shell -a "echo '@reboot root echo 0 > /sys/block/${dev}/queue/rotational' >> /etc/cron.d/ssd"
        done



Root/system disk is not counted in the number of mentioned disks!

--------------------------

.. note:: TODO

    Add details about SSD simulation (virtual disk geometry, virtual block
    size, physical block size, speed, ....).

    Evaluate which test cases should be tested with such SSD disk.

    See also:

        - :RHBZ:`1334344` OSDs and journal "randomly" and absurdly distributed across available disks
        - :RHBZ:`1356876` Skying wants to create journal partition on disk with not enough space
        - :RHBZ:`1358627` Properly created OSD not synced and visible in USM

Test Steps
==========

.. test_action::
   :step:
       Prepare cluster with 4 OSD nodes and 8 spare disks on each OSD node.

       Disks should be created accordingly to schema for the first, second or third scenario in Setup section (part *Disk creation*).

       The commands should be launched from the hypervisor server after proper modification!
   :result:
       Check the created disks (especially the disk sizes).

       ::

           IMAGES_PATH=/var/lib/libvirt/images/
           CLUSTER_NAME=dahorak-usm3
           for node in node{1..4}; do
             for disk in {1..8}; do
               echo "== ${node}-${disk} ====================================="
               qemu-img info ${IMAGES_PATH}${CLUSTER_NAME}-${node}-${disk}.img
             done
           done

.. test_action::
   :step:
       Run *Cluster create* job for the cluster, do not run *Cluster install* (RUN_CLUSTER_INSTALL=False).

       Download inventory file from the job *Workspace* (e.g. ``usersys_dahorak-usm3.hosts``)

       Try to ping all the nodes via ansible:
       ::

           ansible -i usersys_dahorak-usm3.hosts all -m ping
   :result:
       Bunch of nodes for the cluster should be prepared and available.

       You should be able to succesfully ping all machines.

.. test_action::
   :step:
       Configure the particular disks to behave as SSD or HDD accordingly to the Setup section (part *HDD/SSD disk configuration*).

       ::

           ansible -i usersys_dahorak-usm3.hosts ceph_osd -m shell -a 'cat /sys/block/vd*/queue/rotational'

       - SSD means ``0`` in ``/sys/block/vdX/queue/rotational``.
       - HDD means ``1`` in ``/sys/block/vdX/queue/rotational``.
   :result:
       Check that the HDD/SSD configuration match the desired schema.

.. test_action::
   :step:
       Run *Cluster install* job and when finish, follow test steps from *Create cluster* testcase and install and configure
       Ceph cluster via Tendrl web UI.

       Use 5GB journal size.
   :result:
       Check the mapping of journal.

       1. scenario

           - node1: 0 SSD,  8 HDD (1T, 1T, 1T, 1T, 1T, 1T, 1T, 1T)
             4 OSDs created (randomly spread across all the available disks - :RHBZ:`1334344`)
           - node2: 0 SSD,  8 HDD (10G, 10G, 10G, 10G, 1T, 1T, 1T, 1T)
             4 OSDs created (``vdb,vdc,vdd,vde`` used as journal, ``vdf,vdg,vdh,vdi`` used for data, also not sorted - :RHBZ:`1334344`)
           - node3: 0 SSD,  8 HDD (4G, 5G, 10G, 1T, 1T, 1T, 1T, 1T)
             2 OSDs created (creation of 2 OSDs fails because of journal creation from 4GB and 5GB disks fails - :RHBZ:`1356876`)
           - node4: 0 SSD,  8 HDD (4G, 4G, 4G, 4G, 1T, 1T, 1T, 1T)
             no OSD created (creation of any journal fails because of not enough space on 4GB disks - :RHBZ:`1356876`)

       2. scenario

           - node1: 2 SSD (100G, 100G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             6 OSDs created from 1TB disks, journal on 100GB disks (one used for 4 OSDs, second for 2 OSDs)
           - node2: 2 SSD (10G, 10G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             TODO: what should be the correct result?
             CURRENT STATE: created 3 OSDs one journal peer SSD, one journal on HDD,
             creation of 2 OSD failed because of 10GB SSD is too small for 2x5GB journal
           - node3: 2 SSD (15G, 20G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             TODO: what should be the correct result?
             CURRENT STATE: created 5 OSDs, two journals on 15GB SSD, 3 journals on 20GB SSD,
             creation of one OSD failed because of 15GB SSD is too small for 3x5GB journal
           - node4: 1 SSD (100G), 7 HDD (10G, 10G, 1T, 1T, 1T, 1T, 1T)
             created 5 OSDs, journal for 4 OSDs on the SSD disk, journal for one OSD on HDD
             one HDD left untouched because of no available disk for journal

       3. scenario (used **16GB journal**)

           - node1: 2 SSD (32G, 32G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             TODO: what should be the correct result?
             CURRENT STATE: created 3 OSDs, 1 journal peer 1 SSD, 1 journal on HDD,
             creation of 2 OSDs failed because of 32GB SSD is too small for 2x16GB journal
           - node2: 2 SSD (64G, 64G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             TODO: what should be the correct result?
             CURRENT STATE: created 5 OSDs, 3 journals on first SSD, 2 journas on second SSD,
             creation of 1 OSD failed because of 64GB SSD is too small for 4x16GB journal
           - node3: 2 SSD (65G, 65G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             6 OSDs created, 4 journals on one SSD, 2 journals on the second
           - node4: 2 SSD (40G, 80G), 6 HDD (1T, 1T, 1T, 1T, 1T, 1T)
             6 OSDs created, 4 journals on 80GB SSD, 2 journals on 40GB SSD


       4. scenario

           - node1: 8 SSD (1T, 1T, 1T, 1T, 1T, 1T, 1T, 1T), 0 HDD
             6 OSDs created (OSDs and journals randomly spread across all the available disks - :RHBZ:`1334344`)
           - node2: 8 SSD (100G, 100G, 1T, 1T, 1T, 1T, 1T, 1T), 0 HDD
             6 OSDs created (journals on the 100G disks)
           - node3: 8 SSD (11G, 11G, 11G, 1T, 1T, 1T, 1T, 1T), 0 HDD
             5 OSDs created (journals on the 11G disks) - :RHBZ:`1358627`
           - node4: 8 SSD (6G, 11G, 16G, 100G, 1T, 1T, 1T, 1T), 0 HDD
             5 OSDs created (journals on the 6G, 11G and 16G disks) - :RHBZ:`1358627`


Teardown
========

Recreate OSD disks to some reasonable default (2x256G and 6x1T for each node)

::

    IMAGES_PATH=/var/lib/libvirt/images/
    CLUSTER_NAME=dahorak-usm3
    for node in node{1..4}; do
      for disk in {1..2}; do
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-${node}-${disk}.img 256G
      done
      for disk in {3..8}; do
        qemu-img create -f qcow2 ${IMAGES_PATH}${CLUSTER_NAME}-${node}-${disk}.img 1T
      done
    done
