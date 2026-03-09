#!/usr/bin/expect

set timeout 300
spawn sh boot/qemu -ci
#exp_internal 1

# Boot up
expect "Selection: "
send "3\r"
expect "bootfile: "
send "2\r"
expect "\\\[tcp\\\]: "
sleep 1
send "tcp\r"

# Build sources
expect "term% "
send "cd /sys/src/9k\r"
expect "term% "
send "objtype=mk all\r"
#expect "term% "
#send "mk release clean\r"

# Halt
expect "term% "
send "fshalt\r"
expect "done halting"

# Enter QEMU monitor
send "\x1d" ; # Ctrl+Alt+2
send "close\r"
