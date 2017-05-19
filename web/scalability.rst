Check scalability readiness
*****************************

:authors: 
          - mkudlej@redhat.com

Description
===========

**Expand this testcase to variations with Gluster and Ceph**

Check if Tendrl is ready for medium cluster(50 nodes). Test all these testcases in teststeps for medium cluster.

Setup
=====

#. Prepare machines for 50 nodes cluster.

Test Steps
==========

.. test_step:: 1
   
   :doc:`/setup/install_default`

.. test_result:: 1

.. test_step:: 2

   :doc:`/web/node_add`

.. test_result:: 2
   
.. test_step:: 3
   
   :doc:`/web/ceph_cluster_create`
   :doc:`/web/gluster_cluster_create`

.. test_result:: 3
   
.. test_step:: 4
   
   :doc:`/web/cluster_import`

.. test_result:: 4
   
.. test_step:: 5
   
   :doc:`/web/cluster_status`

.. test_result:: 5

.. test_step:: 6

   :doc:`/web/ceph_crushmap_update`

.. test_result:: 6
   
.. test_step:: 7 
   
   :doc:`/web/ceph_settings_check`

.. test_result:: 7
   
.. test_step:: 8
   
   :doc:`/web/node_status`

.. test_result:: 8
   
.. test_step:: 9
   
   :doc:`/web/ceph_pool_create`

.. test_result:: 9

.. test_step:: 10

   :doc:`/api/index.rst`

.. test_result:: 10

.. test_step:: 11
   
   :doc:`/web/design_check`

.. test_result:: 11

Teardown
========

