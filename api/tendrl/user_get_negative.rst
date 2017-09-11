user_get_negative
*******************************************************************************

:authors: 
          - fbalak@redhat.com

Description
===========

Check validity of responses from `Get Single User`_ API call with provided
invalid user.

Setup
=====

#. Ensure that user thardy is not in tendrl (delete him if he is).

Test Steps
==========

.. test_action::
    :step:
        Call `Get Single User`_ API call with username that was deleted and
        is not in database anymore.
    :result:
        Response should be json: `{"Error": "Not found"}` 
        with status code `404`.

.. _`Get Single User`: https://github.com/Tendrl/api/blob/master/docs/users.adoc#single-user
