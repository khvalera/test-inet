test-inet
=================
Script to verify access to the Internet.
Can be used separately or together with the xfce4-genmon-plugin.

Usage: test-inet.sh [IP] [path_log] [use_a_loop]

IP         - Destination IP
path_log   - The path to save the log (optional parameter).
use_a_loop - Execute in a loop = 1 (optional parameter)

Example:
Used in conjunction with the xfce4-genmon-plugin: test-inet.sh 8.8.8.8
Starting in the loop with the record in a log file: test-inet.sh 8.8.8.8 /var/log 1
     
     
