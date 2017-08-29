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

#. Create user(``test_user``) with non-administrator role in Tendrl

Test Steps
==========

.. test_action::
   :step:
       Go to login page
   :result:
       Page should loaded properly. Especially it should contain ``Username`` and ``Password`` inputs and ``Log In`` button.

.. test_action::
   :step:
       Enter ``test_user`` to ``Username`` input and ``test_user`` to ``Password`` input. Click on ``Log In`` button.
   :result:
       User should log into Tendrl. Main page should loaded.

.. test_action::
   :step:
      Check all differencies between admin user interface and non-administrator roles.


Teardown
========

#. Log out

#. Close browser
