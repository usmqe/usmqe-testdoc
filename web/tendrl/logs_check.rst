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

.. test_action::
   :step:
       Set different log level as default one.
   :result:
       Check if there are log entries in log only for set level.

.. test_action::
   :step:
       Go to main Dashboard.
   :result:
       Chekc if there is all required information on Dashboard.

Teardown
========

#. Log out

#. Close browser
