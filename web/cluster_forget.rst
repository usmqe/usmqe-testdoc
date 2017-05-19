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

.. test_step:: 1

    Click ``Clusters`` 

.. test_result:: 1

    Page with list of clusters is open.

.. test_step:: 2

    Find unmanaged cluster and click on right cluster menu and click on ``Forget``

.. test_result:: 2

    Cluster is not in list of clusters.

Teardown
========
#. Log out

#. Close browser
