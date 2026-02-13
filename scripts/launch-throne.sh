#!/bin/sh

timeout=10
count=0

while [ $count -lt $timeout ]; do
  if busctl --user status org.kde.StatusNotifierWatcher 2>/dev/null | grep -q "StatusNotifierWatcher"; then
    break
  fi
  sleep 0.5
  count=$((count + 1))
done

exec throne
