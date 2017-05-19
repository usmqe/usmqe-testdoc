Positive login - Enter submit
******************************

:authors: 
          - mkudlej@redhat.com

.. _Design document for login: https://redhat.invisionapp.com/share/6T900V2ZX#/screens/198042643

Description
===========

Login *admin* into Tendrl with valid credentials. 
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

    Enter ``admin`` to ``Username`` input and ``admin`` to ``Password`` input. Set focus on ``Password`` input and press *Enter* key.

.. test_result:: 2

    User should log into Tendrl. Main page should loaded.
    
Teardown
========

#. Log out

#. Close browser
