
#!/bin/bash

echo "========== Linux Log Analyzer =========="
echo "Hostname: $(hostname)"
echo "Date: $(date)"   
echo "----------------------------------------"

echo "Failed SSH Login Attempts:"
sudo journalctl | grep "Failed password" | wc -l
echo "----------------------------------------"

echo "Top 5 Failed Login IPs:"
sudo journalctl | grep "Failed password" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -5
echo "----------------------------------------"

echo "Total Error Messages:"
sudo journalctl | grep -i error | wc -l
echo "---------------------------------------"

