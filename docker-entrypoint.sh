set -e

CLOUD_PROVIDER=$(cat /config/provider.txt)

quok auditme -d $CLOUD_PROVIDER
