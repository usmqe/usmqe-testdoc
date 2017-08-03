Remember login
***************

:authors: 
          - mkudlej@redhat.com

.. _Design document for login: https://redhat.invisionapp.com/share/6T900V2ZX#/screens/198042643

Description
===========

Login *admin* into Tendrl and remember login.
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
      Click on ``Remember username`` checkbox.
   :result:
       Checkbox is checked.

.. test_action::
   :step:
       Enter ``admin`` to ``Username`` input and ``admin`` to ``Password`` input. Click on ``Log In`` button.
   :result:
       User should log into Tendrl. Main page should loaded.

.. test_action::
   :step:
      Do not log out and enter url _hostname_/#/dashboard into browser address bar.
   :result:
      Dashboard page is loaded.

.. test_action::
   :step:
      Save expiration time of session cookie.
   :result:
      Expiration time of session cookie.

.. test_action::
   :step:
      Log out.
   :result:
      User is logged out.

.. test_action::
   :step:
      Log in with same credentials but ``Remember username`` checkbox is not checked and save Expiration time of cookie.
   :result:
      User is logged in.

.. test_action::
   :step:
      Compare expiration times of session cookie from step 5 and step 7.
   :result:
      Expiration time from step 5 should be longer then from step 7.
      
    
Teardown
========

#. Log out

#. Close browser
