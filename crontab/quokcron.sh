#!/bin/bash
set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: sudo $0 <api_key> <provider>"
    exit 1
fi

API_KEY="$1"
PROVIDER="$2"

# Install quok
curl -fsSL https://repo.quok.it/quok.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/quok.gpg
echo "deb https://repo.quok.it/ cross main" | tee /etc/apt/sources.list.d/quok-stable.list
apt-get update && apt-get install -y quok

# Setup config
mkdir -p ~/.config/quok
echo "{\"api_key\": \"$API_KEY\"}" > ~/.config/quok/config.json

# Setup provider
mkdir -p /etc/quok
echo "$PROVIDER" > /etc/quok/provider.txt

# Create run script
cat > /usr/local/bin/quok-audit <<'EOF'
#!/bin/bash
set -e
quok auditme -d "$(cat /etc/quok/provider.txt)"
EOF
chmod +x /usr/local/bin/quok-audit

# Setup cron job (4am EST daily)
(crontab -l 2>/dev/null | grep -v "quok-audit"; echo "0 4 * * * /usr/local/bin/quok-audit >> /var/log/quok-audit.log 2>&1") | crontab -

echo "Done. Quokkas will be auditing this node at 4am EST daily."
