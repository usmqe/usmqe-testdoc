Unmanage cluster
****************

:authors: 
          - fbalak@redhat.com

Description
===========

Check validity of response from ``cluster/[cluster_id]/unmanage`` API call
where [cluster-id] is id of the imported cluster and check that cluster was
correctly unmanaged according to `specification`_.

Setup
=====

#. Generate *access_token*, see how to `login user`_

#. Import cluster with created volume, see :doc:`/api/tendrl/login_positive`

Test Steps
==========

.. test_action::
    :step:
        Call `List Clusters`_ API call.
    :result:
        Value of *is_managed* attribute for cluster with id [cluster_id]
        in received JSON is *yes*.
        Status of response is *200 OK*.

.. test_action::
    :step:
        Call `List Volumes`_ API call.
    :result:
        Received JSON is not empty list ``[]``.
        Status of response is *200 OK*.

.. test_action::
    :step:
        Wait for synchronization of imported cluster with Graphite.
        Get cluster status from Graphite. Graphite API can be used:
        ``curl -X GET http://[host]:10080/render/?target=tendrl.clusters.[cluster_id].status&format=json``
        where [host] is address of server with Graphite data.
    :result:
        Received JSON is list with datapoints related to cluster health:
        ``[{"target": "tendrl.clusters.[cluster-id].status","datapoints": [*list-of-datapoints*]}]``
        Status of response is *200 OK*.

.. test_action::
    :step:
        Call ``cluster/[cluster_id]/unmanage`` API call.
    :result:
        In response is message:
        ``{"job_id":"[job_id]"}`` where [job_id] is id of job that was
        generated by the API call.
        Status of response is *200 OK*.

.. test_action::
    :step:
        Repeat calling `Job Details`_ API call for [job_id] from previous
        step until there is ``"status": "finished"`` as part of the response.
    :result:
        Value of *status* attribute in received JSON is *finished*.
        Status of response is *200 OK*.

.. test_action::
    :step:
        Call `List Clusters`_ API call.
    :result:
        Value of *is_managed* attribute for cluster with id [cluster_id]
        in received JSON is *no*.
        Status of response is *200 OK*.

.. test_action::
    :step:
        Call `List Volumes`_ API call.
    :result:
        Received JSON is empty list ``[]``.
        Status of response is *200 OK*.

.. test_action::
    :step:
        Get cluster status from Graphite. Graphite API can be used:
        ``curl -X GET http://[host]:10080/render/?target=tendrl.clusters.[cluster_id].status&format=json``
        where [host] is address of server with Graphite data.
    :result:
        Received JSON is empty list ``[]``.
        Status of response is *200 OK*.

Tear-down
=========


.. _`Job Details`: https://github.com/Tendrl/api/blob/master/docs/jobs.adoc#job-details
.. _`login user`: https://github.com/Tendrl/api/blob/master/docs/authentication.adoc#login
.. _`List Clusters`: https://github.com/Tendrl/api/blob/master/docs/clusters.adoc#list-clusters
.. _`List Volumes`: https://github.com/Tendrl/api/blob/master/docs/volumes.adoc#list-volumes
.. _`specification`: https://github.com/Tendrl/specifications/pull/255/files

