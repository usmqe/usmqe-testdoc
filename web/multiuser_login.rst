Multiuser - Positive login
**************************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

.. _Design document for login: https://redhat.invisionapp.com/share/6T900V2ZX#/screens/198042643

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

Login as one or two users simultaneously from two browsers.
During testing `Design document for login`_ should be considered.

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

Test Steps
==========

.. test_action::
   :step:
       In both browsers go to login page ``https://TENDRL-SERVER/``.
   :result:
       In both browsers page should be loaded properly. Especially it should contain ``Username`` and ``Password`` inputs and ``Log In`` button.

.. test_action::
   :step:
       In both browsers enter (the same) intended username to ``Username`` input and related password to ``Password`` input. Simultaneously click on ``Log In`` button.
   :result:
       In both browsers user should log into Tendrl. Main page should be loaded.

.. test_action::
   :step:
       In both browsers log out from Tendrl. Simultaneously click on ``Log Out`` button.
   :result:
       In both browsers user should be loged out. Login page should be loaded.

.. test_action::
   :step:
       In both browsers enter different username to ``Username`` input and related password to ``Password`` input. Simultaneously click on ``Log In`` button.
   :result:
       In both browsers user should log into Tendrl. Main page should be loaded.

Teardown
========

#. Log out

#. Close browser
