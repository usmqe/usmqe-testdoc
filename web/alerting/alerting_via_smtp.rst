Alerting via SMTP
*****************

:author: mbukatov@redhat.com

Description
===========

Besides notifications shown in the UI, we need to check that the same
notifications are send via `SMTP`_ protocol.

Setup
=====

#. You need gluster volume, details differ based on particular test case.
#. Enable SNMP notifications via `test_setup.smtp.yml`_ playbook from
   ``usmqe-setup`` repo.

Test Steps
==========

.. test_action::
   :step:
       Perform all alerting test cases, while monitoring ``postfix`` logs on
       the client machine and checking incoming emails for root user there.
   :result:
       On the client machine, you should be able to see that postfix is
       receiving emails from tendrl notifier when tendrl detects an event like
       this:

       .. code-block:: console

           [root@usm1-client ~]# journalctl -u postfix -fe
           Nov 15 03:18:08 usm1-client.example.com postfix/smtpd[5887]: connect from usm1-server.example.com[10.37.169.90]
           Nov 15 03:18:08 usm1-client.example.com postfix/smtpd[5887]: 477C2461CD9: client=usm1-server.example.com[10.37.169.90]
           Nov 15 03:18:08 usm1-client.example.com postfix/cleanup[6136]: 477C2461CD9: message-id=<>
           Nov 15 03:18:08 usm1-client.example.com postfix/qmgr[5882]: 477C2461CD9: from=<tendrl@usm1-server.example.com>, size=511, nrcpt=1 (queue active)
           Nov 15 03:18:08 usm1-client.example.com postfix/local[6137]: 477C2461CD9: to=<root@usm1-client.example.com>, relay=local, delay=0.01, delays=0/0/0/0, dsn=2.0.0, status=sent (delivered to mailbox)
           Nov 15 03:18:08 usm1-client.example.com postfix/qmgr[5882]: 477C2461CD9: removed
           Nov 15 03:18:08 usm1-client.example.com postfix/smtpd[5887]: disconnect from usm1-server.example.com[10.37.169.90]


       And you should be able to see the emails delivered to the root user
       on the client, you can use ``mail`` or ``mutt`` email client for this:

       .. code-block:: console

           [root@usm1-client ~]# mail
           No mail for root
           [root@usm1-client ~]# mail
           Heirloom Mail version 12.5 7/5/10.  Type ? for help.
           "/var/spool/mail/root": 1 message 1 new
           >N  1 tendrl@mbukatov-usm1  Wed Nov 15 03:52  11/902   "[Tendrl Alert] Brick Status, WARNING: status changed"
           &

       You need to check that all expected events (described in each
       test case) are delivered via email as well.

       Note: be aware that some actions (eg. stopping a volume) can result in
       large number of email notifications.

Teardown
========

#. Disable SNMP notifications via `test_teardown.smtp.yml`_ playbook from
   ``usmqe-setup`` repo.
