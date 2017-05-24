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

.. test_action::
   :step:
      :doc:`/setup/install_default`

.. test_action::
   :step:
      :doc:`/web/node_add`

.. test_action::
   :step:
      :doc:`/web/ceph_cluster_create`
      :doc:`/web/gluster_cluster_create`

.. test_action::
   :step:
      :doc:`/web/cluster_import`

.. test_action::
   :step:
      :doc:`/web/cluster_status`

.. test_action::
   :step:
      :doc:`/web/ceph_crushmap_update`

.. test_action::
   :step:
      :doc:`/web/ceph_settings_check`

.. test_action::
   :step:
      :doc:`/web/node_status`

.. test_action::
   :step:
      :doc:`/web/ceph_pool_create`

.. test_action::
   :step:
      :doc:`/api/index.rst`

.. test_action::
   :step:
      :doc:`/web/design_check`

Teardown
========

