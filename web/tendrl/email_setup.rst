Set email notifications 
*************************

:authors: 
          - mkudlej@redhat.com

Description
===========

This testcase describes how to set up email and which emails are send for which thresholds.

Setup
=====

#. Install Tendrl according installation instruction written in the *Test Plan*

#. Login as an admin user into Tendrl (:doc:`/web/login_positive`)

Test Steps
==========

.. test_action::
   :step:
       Click on *Admin* link in the left menu bar and on *Mail Settings* in submenu.
   :result:
       The *Email Settings* page is shown. The title reads "Configure Mail Server".

.. test_action::
   :step:
       Fill form with:

       * Email Notifications == True
       * Outgoing MailServer SMTP Address == "_smtp_server_"
       * See :RHBZ:`1358621` if it is needed to uncheck both SSL and TLS
       * Port == 25
       * User Name == "_email_"
       * Password == ""
       * From == "Tendrl1"
       * Subject Prefix == "TENDRL2"
       * Test Message Recipient == Your email address
   :result:
      It is possible to set all parameters.

.. test_action::
   :step:
       Click on *Test* button and wait for email in Test Message Recipient's inbox.
   :result:
       There is testing email in Test Message Recipient's inbox and no error message.

.. test_action::
   :step:
       Click on *Save* button.
   :result:
       There is no error message and there is message that email settings are saved.

.. test_action::
   :step:
       Check if settings are saved in Tendrl by reloading settings page and from API by
   ..  .. code-block:: bash
   ..      # TODO login
   ..      curl -i -k -X GET ${URL}/mailnotifier
   ..      # TODO logout
   :result:
       All settings are properly saved.

.. test_action::
   :step:
       Check if settings are saved in Etcd.
   ..  .. code-block:: bash
   ..      # TODO correct this etcd directory
   ..      etcdctl --endpoints http://${HOSTNAME}:2379 get /_tendrl/
   :result:
       All settings are properly saved.

Teardown
========
#. Disable email settings by unchecking Email Notifications in email settings.

#. Log out

#. Close browser
