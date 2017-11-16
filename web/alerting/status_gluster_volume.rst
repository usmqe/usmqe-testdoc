Status of Gluster Volume
************************

:author: mbukatov@redhat.com

Description
===========

Alerts covered in this test case:

* volume status (volume, cluster), which means either started or stopped
* volume state (volume, cluster), which means one of up/down/partial/degraded
* quorum of volume lost (volume, cluster)
* quorum of volume regained (volume, cluster)

Based on:

* `List of Alerts and Notifications in Tendrl`_
* conversation on ``tendrl-devel`` channel::

      [11/13/17 13:04] <sankarshanmukhopadhyay> state = healthy/unhealthy isn't it?
      [11/13/17 13:04] <sankarshanmukhopadhyay> status was the up/down etc which came up because of the GeoRep conversation?
      [11/13/17 13:05] <shtripat> @sankarshanmukhopadhyay volume level state means `up/down/partial/degraded` and status means `Started/Stopped`
      [11/13/17 13:17] <shtripat> >> @shtripat does it mean I could have volume in state down, but with status started?
      [11/13/17 13:17] <shtripat> No. If all the bricks are down for a volume state is marked as `down` and in this scenario volume would be marked as Stopped
      [11/13/17 13:18] <shtripat> Started/Stopped didnt have partial and degraded so we added another field for state

Setup
=====

#. You need a gluster volume.

Teardown
========

#. Make sure all machines and volumes used during testing are up again.
