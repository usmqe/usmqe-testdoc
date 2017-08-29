Grafana to Graphite Dashboards API Tests
========================================

Dashboard tests are concerned with actual values shown in the dashboards and
based on json grafana definition files from ``tendrl-monitoring-integration``
rpm package. This means that the dashboard values are tested by asking graphite
based on query from json dashboard definition file.

In general, test case for a particular value shown on Tendrl dashboard could
look like this:

* Setting up the Tednrl and storage cluster so that the value could be reported
  in the first place (eg. for volume snapshot utilization, we need to create a
  volume and snapshots there).
* Asking for particular value using graphite query from grafana dashboard file
  and checking the reported value based on expected state.
* Changing the state the of the cluster so that the reported value would need
  to change (eg. deleting few snapshots).
* Checking the value again, validating if the value changed in expected way.

.. test_defaults::
   :casesubcomponent: dashboard

.. toctree::
   :caption: Test Cases
   :maxdepth: 1
   :glob:
