Cluster manage
*****************

:authors:
          - mkudlej@redhat.com

Description
===========

Manage cluster.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl UI, see :doc:`/web/login_positive`

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
       Find unmanaged cluster and click on right cluster menu and click on ``Manage``
   :result:
       Cluster status icon has changed.
    
.. test_action::
   :step:
       Go to unmanaged cluster dashboard.
   :result:
       Managed cluster dashboard reflects cluster's state(cluster is Managed).

.. test_action::
   :step:
       Go to ``Storage``->``Pools`` and try to create one.
   :result:
       It is possible to create new pool.
    
.. test_action::
   :step:
       Go to ``Storage``->``RBDs`` and try to create one.
   :result:
       It is possible to create new RBD.


Teardown
========
#. Log out

#. Close browser
