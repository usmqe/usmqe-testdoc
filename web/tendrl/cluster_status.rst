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

.. test_action::
   :step:
       Click ``Clusters`` 
   :result:
       Page with list of clusters is open.

.. test_action::
   :step:
       Check if information is correct.
   :result:
       Shown information is correct.

Teardown
========
#. Log out

#. Close browser
