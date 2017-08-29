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

#. Prepare environment as described in :doc:`/configurations/multiuser_initial_setup`.

Test Steps
==========

.. test_action::
   :step:
       In both browsers click on ``Admin`` button in left menu.
   :result:
       In both browsers list of users is shown.

.. test_action::
   :step:
       In both browsers click on ``Add`` button
   :result:
       In both browsers form for adding user is shown.

.. test_action::
   :step:
      In both browsers input the same ``User Id`` but different ``First Name``, ``Last Name``, ``Email``, ``Password`` and simultaneously click on button ``Save``
   :result:
      In one browser error message about existing user is shown. In second browser list of users with newly added user is shown.

.. test_action::
   :step:
      In both browsers input different ``User Id``, ``First Name``, ``Last Name``, ``Email``, ``Password`` and simultaneously click on button ``Save``
   :result:
      In both browsers list of users is shown. New added users are in list with all values input in this step.

.. test_action::
   :step:
      In both browsers try to login as new users as in :doc:`/web/tendrl/multiuser_login` testcase.
   :result:
      In both browsers users are logged in.
    
Teardown
========
#. Remove new added users :doc:`/web/tendrl/multiuser_user_delete`

#. Log out

#. Close browser
