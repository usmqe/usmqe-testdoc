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

.. test_step:: 1

    Go to login page 

.. test_result:: 1

    Page should loaded properly. Especially it should contain ``Username`` and ``Password`` inputs and ``Log In`` button.

.. test_step:: 2

   Click on ``Remember username`` checkbox.

.. test_result:: 2

    Checkbox is checked.

.. test_step:: 3

    Enter ``admin`` to ``Username`` input and ``admin`` to ``Password`` input. Click on ``Log In`` button.

.. test_result:: 3

    User should log into Tendrl. Main page should loaded.

.. test_step:: 4

   Do not log out and enter url _hostname_/#/dashboard into browser address bar.

.. test_result:: 4

   Dashboard page is loaded.

.. test_step:: 5

   Save expiration time of session cookie.

.. test_result:: 5

   Expiration time of session cookie.

.. test_step:: 6

   Log out.

.. test_result:: 6

   User is logged out.

.. test_step:: 7

   Log in with same credentials but ``Remember username`` checkbox is not checked and save Expiration time of cookie.

.. test_result:: 7

   User is logged in.

.. test_step:: 8

   Compare expiration times of session cookie from step 5 and step 7.

.. test_result:: 8

   Expiration time from step 5 should be longer then from step 7.
   
    
Teardown
========

#. Log out

#. Close browser
