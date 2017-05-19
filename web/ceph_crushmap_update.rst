Update crushmap for Ceph cluster
*********************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Update crushmap testcase.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_step:: 1
  
    Go to Crushmap update page.
  
.. test_result:: 1
   
    Check Crushmap update page.

.. test_step:: 2

    Update Crushmap.

.. test_result:: 2

    Check if update of Crushmap correctly ends.

Teardown
========
#. Log out

#. Close browser
