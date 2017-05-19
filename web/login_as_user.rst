Positive login as user with non-administrator role.
****************************************************

:authors: 
          - mkudlej@redhat.com

.. _Design document for login: https://redhat.invisionapp.com/share/6T900V2ZX#/screens/198042643

Description
===========

Login *user* with non-administrator role into Tendrl with valid credentials.
During testing `Design document for login`_ should be considered.

Setup
=====

#. Install Tendrl according installation instruction written in *Test Plan*

#. Create user(``test_user``) with non-administrator role in Tendrl

Test Steps
==========

.. test_step:: 1

    Go to login page

.. test_result:: 1

    Page should loaded properly. Especially it should contain ``Username`` and ``Password`` inputs and ``Log In`` button.

.. test_step:: 2

    Enter ``test_user`` to ``Username`` input and ``test_user`` to ``Password`` input. Click on ``Log In`` button.

.. test_result:: 2

    User should log into Tendrl. Main page should loaded.

.. test_step:: 3

   Check all differencies between admin user interface and non-administrator roles.

.. test_result:: 3



Teardown
========

#. Log out

#. Close browser
