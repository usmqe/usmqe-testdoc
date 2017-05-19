Multiuser - Create user
***********************

:authors: 
          - mkudlej@redhat.com
          - dahorak@redhat.com

Description
===========

**UNDER CONSTRUCTION - NEED UPDATE**

Create users simultaneously from two browsers.

Setup
=====

#. Prepare environment as described in :doc:`/web/multiuser_initial_setup`.

Test Steps
==========

.. test_step:: 1
  
    In both browsers click on ``Admin`` button in left menu.
  
.. test_result:: 1
   
    In both browsers list of users is shown.

.. test_step:: 2

    In both browsers click on ``Add`` button

.. test_result:: 2

    In both browsers form for adding user is shown.

.. test_step:: 3

   In both browsers input the same ``User Id`` but different ``First Name``, ``Last Name``, ``Email``, ``Password`` and simultaneously click on button ``Save``

.. test_result:: 3

   In one browser error message about existing user is shown. In second browser list of users with newly added user is shown.

.. test_step:: 4

   In both browsers input different ``User Id``, ``First Name``, ``Last Name``, ``Email``, ``Password`` and simultaneously click on button ``Save``

.. test_result:: 4

   In both browsers list of users is shown. New added users are in list with all values input in this step.

.. test_step:: 5

   In both browsers try to login as new users as in :doc:`/web/multiuser_login` testcase.

.. test_result:: 5

   In both browsers users are logged in.
    
Teardown
========
#. Remove new added users :doc:`/web/multiuser_user_delete`

#. Log out

#. Close browser
