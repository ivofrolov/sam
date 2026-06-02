# System Activity Monitor

A simple program to display graphical system activity reports collected by sysstat in a
web browser.

Run it like that `sam --host localhost --port 8000`.

Or use <sam.service.example> systemd unit to run it as a service.

The following stats are displayed as graphs for different time periods (day, week, month, year).

| block devices activity         | rkB/s, wkB/s     | `sar -d [--dev=dev_list]`         |
| mounted filesystems statistics | %fsused          | `sar -F MOUNT [--fs=fs_list]`     |
| power management statistics    | degC             | `sar -m TEMP`                     |
| network statistics             | rxkB/s, txkB/s   | `sar -n DEV [--iface=iface_list]` |
| processor statistics           | 100-%idle        | `sar -u`                          |
| system load                    | ldavg-5, ldavg15 | `sar -q LOAD`                     |
| memory utilization statistics  | %memused         | `sar -r`                          |
