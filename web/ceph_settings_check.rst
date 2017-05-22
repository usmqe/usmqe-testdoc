Check Ceph Storage Tuning & Optimizations settings
****************************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Check if OS on all nodes is set according recommendations.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. *Create cluster* testcase

Test Steps
==========

.. test_action::
   :step:
       Connect to all OSD nodes.  
   :result:
       There are set all required settings.

       Kernel params:
       * pid_max -- set to 10x default or max (4 MB)
       * vm.min_free_kbytes -- set to 1 GB (if > 64 GB RAM), 2 GB if 128 GB RAM, 3 GB if 256 GB RAM
       Ceph.conf:
       * max open files -- set to 10x default or max (4 MB) Set in ceph.conf


Teardown
========
#. Remove created cluster(*Delete cluster* testcase)

#. Log out

#. Close browser
