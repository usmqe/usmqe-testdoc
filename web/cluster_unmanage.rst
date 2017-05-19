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

.. test_step:: 1

    Click ``Clusters`` 

.. test_result:: 1

    Page with list of clusters is open.

.. test_step:: 2

    Click on right cluster menu and click on ``UnManage``

.. test_result:: 2

    Cluster status icon has changed.

.. test_step:: 3

    Go to unmanaged cluster dashboard.

.. test_result:: 3

    Unmanaged cluster dashboard reflects cluster's state(cluster is unmanaged).

.. test_step:: 4

    Go to ``Storage``->``Pools`` and try to create one.

.. test_result:: 4

    It is not possible to create new pool.
    
.. test_step:: 5

    Go to ``Storage``->``RBDs`` and try to create one.

.. test_result:: 5

    It is not possible to create new RBD.


Teardown
========
#. Log out

#. Close browser
