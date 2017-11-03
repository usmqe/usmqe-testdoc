Hosts status
*******************************************************************************

:authors:
        - fbalak@redhat.com

Description
===========

Check correct brick and host status in Grafana dashboards.

Setup
=====

#. Login as an admin user into Tendrl (:doc:`/web/tendrl/login_positive`)

#. Import cluster and open Grafana (:doc:`/web/tendrl/grafana_open`)

#. Click on button with name of the current dashboard (Tendrl-Gluster-at-a-Glance) and select ``Hosts``.


Test Steps
==========

.. test_action::
   :step:
       Log into monitored machine via ssh and remove one brick:
       ``gluster volume remove-brick [VOLUME] [HOST]:/[BRICK] start``
   :result:
       After a while there should be one less brick in Bricks Panel.

.. test_action::
   :step:
       Add removed brick:
       ``gluster volume add-brick [VOLUME] [HOST]:/[BRICK]``
   :result:
       After a while there should be one more brick in Bricks Panel.

.. test_action::
   :step:
       Shutdown monitored host.
   :result:
       After a while there should be red label ``Down`` in Health panel and Bricks should be Down.

.. test_action::
   :step:
       Start monitored host.
   :result:
       After a while there should be green label ``Up`` in Health panel and Bricks should be Up.

Teardown
========

#. Log out

#. Close browser

