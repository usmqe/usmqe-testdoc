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

.. test_action::
   :step:
       Enter login url to web-browser of smartphone and PC to see login page.
   :result:
       Check if design of login page is changing according web-browser on different devices.

.. test_action::
   :step:
       Login as in :doc:`/web/login_positive`
   :result:
       Check if design of dashboard page is changing according web-browser on different devices.

.. test_action::
   :step:
       Rotate smartphone.
   :result:
       Check if design changes according rotation.

Teardown
========

#. Log out

#. Close browser
