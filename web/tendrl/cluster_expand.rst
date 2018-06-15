Expand cluster
**************

:authors: 
  - fbalak@redhat.com
  - mbukatov@redhat.com
:requirements:
  - :rhbz:`1516417`
  - :rhbz:`1559368`

Description
===========

Cluster expansion as described in `Specification for cluster expansion`_.

See also `upstream issue for cluster expansion`_.

Setup
=====

#. Prepare Gluster cluster.

#. Login user into Tendrl, see :doc:`/web/tendrl/login_positive`

#. Import cluster, see :doc:`/web/tendrl/cluster_import`

#. Prepare another hosts with installed gluster that are going to be used for
   expansion.

Test Steps
==========

.. test_action::
   :step:
       From one of already imported hosts run:
       ``gluster peer probe [new_host]``
       where ``[new_host]`` is host that is going to be used to expand cluster.
       Repeat for all new hosts.
   :result:
       All new hosts are added to gluster trusted pool.

.. test_action::
   :step:
       In Tendrl UI click on imported cluster.
   :result:
       List of hosts is displayed and there are hosts from originally imported
       cluster. There are no new hosts.

.. test_action::
   :step:
       Run tendrl-ansible on new hosts from server that installed Tendrl on
       all other hosts. Command ran from tendrl-ansible repo could look like
       this:
       ``ansible-playbook site.yml -u root -i expand.hosts``
   :result:
       *tendrl-node-agent* is installed on all new nodes.

.. test_action::
   :step:
       Check list of hosts in Tendrl UI for given cluster.
   :result:
       There are listed all hosts of cluster. Original hosts are marked as *Up*
       and new hosts are marked as *Unknown*. In above the cluster list at
       right side is button *Expand Cluster*.

.. test_action::
   :step:
       Click on *Expand Cluster* button.
   :result:
       Popup with list of hosts to expand is shown. There should not be hosts
       that are already managed.

.. test_action::
   :step:
       Click on *Expand* button in expand popup.
   :result:
       New Cluster expansion task is created.

.. test_action::
   :step:
       Go to list of clusters in Tendrl UI.
   :result:
       Status of cluster that is being expanded is *In-progress* and there
       should be link to expansion job.

.. test_action::
   :step:
       Click on expansion job link and wait until the status of job is
       *finished*.
   :result:
       Page with expansion job progress is displayed. After a while it should
       finish correctly and status of job should change from *processing* to
       *finished*.

.. test_action::
   :step:
       Go to list of clusters in Tendrl UI.
   :result:
       Status of cluster that is *Healthy* and number of hosts is number of
       all hosts in cluster.

.. test_action::
   :step:
       Check list of hosts in Tendrl UI for given cluster.
   :result:
       There are listed all hosts of cluster and all are marked as *Up*.

Teardown
========

#. Log out

#. Close browser
