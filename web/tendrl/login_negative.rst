Negative login
****************

:authors: 
          - mkudlej@redhat.com

Description
===========

Try to login not valid user into Tendrl. 

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
       Enter ``negative`` to ``Username`` input and ``negative`` to ``Password`` input. Click on ``Log In`` button.
   :result:
       User should not log into Tendrl. Proper error message should appear.


Teardown
========

#. Close browser
