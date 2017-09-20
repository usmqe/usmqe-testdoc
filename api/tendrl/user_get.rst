User get test
*******************************************************************************

:authors: 
          - fbalak@redhat.com

Description
===========

Check validity of responses from `List Users`_ and `Get Single User`_ API calls.

Setup
=====

#. Create user via `valid_new_user` fixture populated with user data specified
   in `Create user example`_.

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
        compared to data sent in `valid_new_user` fixture. Status of response
        should be `200 OK`.

Tear-down
=========

#. User created in `valid_new_user` is removed from tendrl database.


.. _`List Users`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#list-users
.. _`Get Single User`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#single-user
.. _`Create user example`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#create-user
