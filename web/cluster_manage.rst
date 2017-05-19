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

.. test_step:: 1

    Click ``Clusters`` 

.. test_result:: 1

    Page with list of clusters is open.

.. test_step:: 2

    Find unmanaged cluster and click on right cluster menu and click on ``Manage``

.. test_result:: 2

    Cluster status icon has changed.
    
.. test_step:: 3

    Go to unmanaged cluster dashboard.

.. test_result:: 3

    Managed cluster dashboard reflects cluster's state(cluster is Managed).

.. test_step:: 4

    Go to ``Storage``->``Pools`` and try to create one.

.. test_result:: 4

    It is possible to create new pool.
    
.. test_step:: 5

    Go to ``Storage``->``RBDs`` and try to create one.

.. test_result:: 5

    It is possible to create new RBD.


Teardown
========
#. Log out

#. Close browser
