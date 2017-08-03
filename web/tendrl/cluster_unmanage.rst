Cluster unmanage
*****************

:authors:
          - mkudlej@redhat.com

Description
===========

Unmanage cluster.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is cluster to unmanage.

Test Steps
==========

.. test_action::
   :step:
       Click ``Clusters`` 
   :result:
       Page with list of clusters is open.

.. test_action::
   :step:
       Click on right cluster menu and click on ``UnManage``
   :result:
       Cluster status icon has changed.

.. test_action::
   :step:
       Go to unmanaged cluster dashboard.
   :result:
       Unmanaged cluster dashboard reflects cluster's state(cluster is unmanaged).

.. test_action::
   :step:
       Go to ``Storage``->``Pools`` and try to create one.
   :result:
       It is not possible to create new pool.
    
.. test_action::
   :step:
       Go to ``Storage``->``RBDs`` and try to create one.
   :result:
       It is not possible to create new RBD.


Teardown
========
#. Log out

#. Close browser
