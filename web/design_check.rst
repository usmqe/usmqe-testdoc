Check Responsive design
************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Check Tendrl web UI design on various devices.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

Test Steps
==========

.. test_step:: 1
  
    Enter login url to web-browser of smartphone and PC to see login page.
  
.. test_result:: 1
   
    Check if design of login page is changing according web-browser on different devices.

.. test_step:: 2

    Login as in :doc:`/web/login_positive`

.. test_result:: 2

    Check if design of dashboard page is changing according web-browser on different devices.

.. test_step:: 3

    Rotate smartphone.

.. test_result:: 3

    Check if design changes according rotation.

Teardown
========

#. Log out

#. Close browser
