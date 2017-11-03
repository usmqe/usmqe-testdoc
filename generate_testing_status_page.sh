#!/bin/bash

if [ "$#" -gt 0 ]; then
  echo "Script generates empty page for testing status result for all testcases from: api, web, minimal-acceptance, system-integration"
  echo "Usage:"
  echo "  1. Run script without any params in root of repository,"
  echo "  2. store script output to Doc wiki page,"
  echo "  3. set RST syntax,"
  echo "  4. edit list of tested testcases,"
  echo "  5. create link to main list of test runs."
else
  echo "# Test cases for version **TODO**"
  echo
  echo "<table>"
  echo "<tr>"
  echo "<th>test case</th>"
  echo "<th>assigned</th>"
  echo "<th>status</th>"
  echo "<th>issues</th>"
  echo "</tr>"
  
  for f in $(find {api,web,minimal-acceptance,system-integration} -name "*.rst" -not -name "index.rst" | sort ); do
    echo "<tr><td><a href='https://usmqe-testdoc.readthedocs.io/en/latest/$(echo $f | sed 's/.rst$/.html/')'>$f</a></td><td></td><td></td><td></td><td></td></tr>"
  done
  
  echo "</table>"


fi
