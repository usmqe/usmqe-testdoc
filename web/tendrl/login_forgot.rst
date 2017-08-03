TODO(impl): Login - forgotten username or password
***************************************************

:authors: 
          - mkudlej@redhat.com

.. _Design document for login: https://redhat.invisionapp.com/share/6T900V2ZX#/screens/198042643

Description
===========

User forgets username or password. Tendrl provides username or password to user.
During testing `Design document for login`_ should be considered.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

Test Steps
==========

.. test_action::
   :step:
       Go to login page 
   :result:
       Page should loaded properly. Especially it should contain ``Username`` and ``Password`` inputs and ``Log In`` button.

.. test_action::
   :step:
       Click on ``Forgot username`` link or ``password`` link.
   :result:
       Check if Tendrl sends to user forgotten username or resets password.
    
Teardown
========

#. Log out

#. Close browser
