# Wambenger

Wambenger is a set of cron jobs for running Quok.it single-node active health checks on a regular schedule.

## Deployment Options

There are two ways to deploy this cron job:

### Kubernetes

For Kubernetes deployments, see [kubernetes/README.md](kubernetes/README.md)

Runs as a CronJob in your cluster with configurable schedules

### Crontab

For traditional Linux cron daemon deployments, see [crontab/README.md](crontab/README.md)

Runs using the system crond daemon on Linux systems

## Requirements

Both deployment methods require:

- A valid Quok.it API key (if you don't have one yet, register at quok.it)
- Cloud provider name (e.g., AWS, GCP, Azure, Coreweave, Nebius, etc)
