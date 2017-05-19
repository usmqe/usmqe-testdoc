Cluster status
********************

:authors:
          - mkudlej@redhat.com

Description
===========

Check cluster status.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

#. There is cluster to be checked.

Test Steps
==========

.. test_step:: 1

    Click ``Clusters`` 

.. test_result:: 1

    Page with list of clusters is open.

.. test_step:: 2

    Check if information is correct.

.. test_result:: 2

    Shown information is correct.

Teardown
========
#. Log out

#. Close browser
