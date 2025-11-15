This is a cron job for Quok single-node audits

Right now we require two volume mounts:

/config/provider.txt -> This is the name of the cloud provider

~/.config/quok/config.json -> This is your API key in form {"api_key": "KEY HERE"}
