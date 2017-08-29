Positive login - Enter submit
******************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Login *admin* into Tendrl with valid credentials. 

Setup
=====

Test Steps
==========

.. test_action::
   :step:
       Go to login page 
   :result:
       Page should loaded properly. Especially it should contain ``Username`` and ``Password`` inputs and ``Log In`` button.

.. test_action::
   :step:
       Enter ``admin`` to ``Username`` input and ``admin`` to ``Password`` input. Set focus on ``Password`` input and press *Enter* key.
   :result:
       User should log into Tendrl. Main page should loaded.
    
Teardown
========

#. Log out

#. Close browser
