# System Activity Mapper

A simple program to display graphical system activity reports collected by sysstat in a
web browser.

It connects to remote hosts via ssh, dumps sar datafiles, and renders plots using gnuplot. So these are required, not to mention the python interpreter.

The following stats are displayed.

| 1                              | 2                | 3               |
|--------------------------------|------------------|-----------------|
| block devices activity         | rkB/s, wkB/s     | `sar -d`        |
| mounted filesystems statistics | %fsused          | `sar -F MOUNT ` |
| power management statistics    | degC             | `sar -m TEMP`   |
| network statistics             | rxkB/s, txkB/s   | `sar -n DEV `   |
| processor statistics           | 100-%idle        | `sar -u`        |
| system load                    | ldavg-5, ldavg15 | `sar -q LOAD`   |
| memory utilization statistics  | %memused         | `sar -r`        |

Run it like that `sam render HOST [HOST ...] > out.html` to render report once. Or `sam serve HOST [HOST ...]`. HOST is in the same format as for ssh destination.

See also <sam.service.example> systemd unit to run it as a service.
