Cluster forget
********************

:authors:
          - mkudlej@redhat.com

Description
===========

Forget cluster.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is unmanaged cluster.

Test Steps
==========

.. test_action::
   :step:
       Click ``Clusters`` 
   :result:
       Page with list of clusters is open.

.. test_action::
   :step:
       Find unmanaged cluster and click on right cluster menu and click on ``Forget``
   :result:
       Cluster is not in list of clusters.

Teardown
========
#. Log out

#. Close browser
