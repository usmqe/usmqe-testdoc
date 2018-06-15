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
       Check list of hosts in Tendrl UI.
   :result:
       There are listed all hosts of expanded cluster.

.. test_action::
   :step:
       Click on *Dashboard* next to hostname of newly added host. Repeat with
       all new hosts.
   :result:
       Grafana *Hosts* dashboard for relevant host is displayed and populated
       with data.

Teardown
========

#. Log out

#. Close browser
