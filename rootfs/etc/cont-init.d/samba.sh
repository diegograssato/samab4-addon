#!/usr/bin/with-contenv bashio
# ==============================================================================
# Prepare the Samba service for running
# ==============================================================================
set -x
# declare password
# declare username
# declare -a interfaces=()
# export HOSTNAME

# # Check Login data
# if ! bashio::config.has_value 'username' || ! bashio::config.has_value 'password'; then
#     bashio::exit.nok "Setting a username and password is required!"
# fi

# # Read hostname from API or setting default "hassio"
# HOSTNAME=$(bashio::info.hostname)
# if bashio::var.is_empty "${HOSTNAME}"; then
#     bashio::log.warning "Can't read hostname, using default."
#     HOSTNAME="hassio"
# fi
# bashio::log.info "Hostname: ${HOSTNAME}"

SAMBA_DC_REALM='corp.example.net'
SAMBA_DC_DOMAIN='EXAMPLE'
SAMBA_DC_ADMIN_PASSWD='5u3r53cur3!'
SAMBA_DC_DNS_BACKEND='SAMBA_INTERNAL'
# Configure the AD DC
if [ ! -f /samba/etc/smb.conf ]; then
    mkdir -p /samba/etc /samba/lib /samba/log
    echo "${SAMBA_DC_DOMAIN} - Begin Domain Provisioning"
    samba-tool domain provision --domain="${SAMBA_DC_DOMAIN}" \
        --adminpass="${SAMBA_DC_ADMIN_PASSWD}" \
        --server-role=dc \
        --realm="${SAMBA_DC_REALM}" \
        --dns-backend="${SAMBA_DC_DNS_BACKEND}"
    echo "${SAMBA_DC_DOMAIN} - Domain Provisioned Successfully"
fi
cat /etc/samba/smb.conf

# Get supported interfaces
# for interface in $(bashio::network.interfaces); do
#     interfaces+=("${interface}")
# done
# if [ ${#interfaces[@]} -eq 0 ]; then
#     bashio::exit.nok 'No supported interfaces found to bind on.'
# fi
# bashio::log.info "Interfaces: $(printf '%s ' "${interfaces[@]}")"

# # Generate Samba configuration.
# jq ".interfaces = $(jq -c -n '$ARGS.positional' --args -- "${interfaces[@]}")" /data/options.json \
#     | tempio \
#       -template /usr/share/tempio/smb.gtpl \
#       -out /etc/samba/smb.conf

# # Init user
# username=$(bashio::config 'username')
# password=$(bashio::config 'password')
# addgroup "${username}"
# adduser -D -H -G "${username}" -s /bin/false "${username}"
# # shellcheck disable=SC1117
# echo -e "${password}\n${password}" \
#     | smbpasswd -a -s -c "/etc/samba/smb.conf" "${username}"
