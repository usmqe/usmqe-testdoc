Check logs
*************

:authors: 
          - mkudlej@redhat.com

Description
===========

Check logs.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Login user into Tendrl, see :doc:`/web/login_positive`

Test Steps
==========

.. test_step:: 1
  
    Set different log level as default one.
  
.. test_result:: 1
   
    Check if there are log entries in log only for set level.

.. test_step:: 2

    Go to main Dashboard.

.. test_result:: 2

    Chekc if there is all required information on Dashboard.

Teardown
========

#. Log out

#. Close browser
