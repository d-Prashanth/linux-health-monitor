# Linux Health Monitor 🚀

## 📌 Description

A Bash-based system monitoring tool that tracks CPU, memory, and disk usage and logs alerts using cron automation.

## 📁 Project Structure

* scripts/ → monitoring script
* logs/ → system & alert logs
* path_var/ → configuration file
* crontab.txt → cron job setup

## ⚙️ Setup

```bash
chmod +x scripts/monitor.sh
crontab crontab.txt
```

## ⏰ Cron Job

Runs every minute:

```bash
* * * * * /linux-health-monitor/scripts/monitor.sh
```

## 📊 Logs

* system.log → system stats
* alert.log → alerts only

## 🧠 Tech Used

* Bash scripting
* Linux commands (top, free, df, awk, sed)
* Cron jobs
