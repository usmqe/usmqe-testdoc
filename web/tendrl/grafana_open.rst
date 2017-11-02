Open Grafana
******************************************************************************

:authors:
          - fbalak@redhat.com

Description
===========

Open Grafana dashboard ``Tendrl-Gluster-at-a-Glance`` for imported cluster from Tendrl.

Setup
=====

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

#. Import cluster into Tendrl, see :doc:`/web/tendrl/cluster_import`

Test Steps
==========

.. test_action::
   :step:
       Click on ``Clusters`` button in left menu if current page doesn't show list of clusters.
   :result:
       List of clusters is shown.

.. test_action::
   :step:
       Click on ``Dashboard`` button next to listed imported cluster.
   :result:
       New browser tab is opened with grafana dashboard ``Tendrl-Gluster-at-a-Glance``.


Teardown
========
#. Log out

#. Close browser
