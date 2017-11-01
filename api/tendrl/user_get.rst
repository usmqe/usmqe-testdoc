User get test
*******************************************************************************

:authors: 
          - fbalak@redhat.com

Description
===========

Check validity of responses from `List Users`_ and `Get Single User`_ API calls.

Setup
=====

#. Create user populated with user data specified in `Create user example`_:

.. code-block:: json

   {
     "email": "thardy@tendrl.org",
     "username": "thardy",
     "name": "Tom Hardy",
     "role": "admin",
     "email_notifications": true
   }


Test Steps
==========

.. test_action::
    :step:
        Call `List Users`_ API call.
    :result:
        In response should be two users: admin and thardy created according to
        `Create user example`_. Status of response should be `200 OK`.

.. test_action::
    :step:
        Call `Get Single User`_ API call.
    :result:
        In response should be details of user thardy. All returned values are
        compared to data from which the user was created. Status of response
        should be `200 OK`.

Tear-down
=========

#. Created user is removed from tendrl database.


.. _`List Users`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#list-users
.. _`Get Single User`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#single-user
.. _`Create user example`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#create-user
