Negative login - empty login and password
***********************************************

:authors: 
          - mkudlej@redhat.com

Description
===========

Try to login not valid user(empty string) into Tendrl.

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
       Make sure there is no character in ``Username`` and ``Password`` inputs. Click on ``Log In`` button.
   :result:
       User should not log into Tendrl. Proper error message should appear.


Teardown
========

#. Close browser
