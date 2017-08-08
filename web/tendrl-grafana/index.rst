Tendrl to Grafana Dashboards WEB UI Tests
=========================================

System tests of linking Grafana dashboards from Tendrl web interface without
checking values shown on the dashboard. Tests here checks that:

* every grafana dashboard is reachable from Tendrl UI from expected place(s)
* the dashboard linked from Tendrl UI has expected properties (name, graphs
  shown, ...)
* we are able to identify grafana definition file for every grafana dashboard
  which is reachable from Tendrl UI (we need to establish relationship between
  grafana dashboards and packaged definition files)

Besides that, we may consider a limited set of manual test cases based on
visual inspection of Tendrl grafana dashboards linked from Tendrl UI.

.. test_defaults::
   :casesubcomponent: tendrl_grafana_web

.. toctree::
   :caption: Test Cases
   :maxdepth: 1
   :glob:

   *
