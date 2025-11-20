---
filetags: ":snippets:epubnote:systemd:journal:"
id: bd625f38-5dee-464e-bf0f-da6b57b0c52b
title: Systemd, journal Snippets
---

``` shell

# Show all running services
systemctl status

# Show status of a unit
systemctl status unit
systemctl status portmaster

# List failed units
systemctl --failed

# Start/Stop/Restart/Reload/Show the status a service
systemctl start|stop|restart|reload|status unit

# Enable/Disable a unit to be started on system start
systemctl enable|disable unit

# Reload systemd, scan for new or changed units:
systemctl daemon-reload

# Show the contents & absolute path of a unit file or edit it:
systemctl cat|edit unit

```

## journalctl

``` shell

# Show all messages matching PATTERN
journalctl --grep=PATTERN

# Show all messages from this boot
journalctl -b

# Show all messages from date (and optional time)
journalctl --since="2012-10-30 18:17:16"

# Show all messages since 20 minutes ago
journalctl --since "20 min ago"

# Follow new messages
journalctl -f

# Show all messages by a specific executable
journalctl /usr/lib/systemd/systemd

# Show all messages by a specific unit
journalctl -u man-db.service

# Show only error, critical and alert priority messages
journalctl -p err..alert

```

## See Also

### Resources

- [systemd/Journal -
  ArchWiki](https://wiki.archlinux.md/title/Systemd/Journal)
