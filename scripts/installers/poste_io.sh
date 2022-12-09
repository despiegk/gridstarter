set -ex

docker run \
    --net=host \
    -e TZ=Europe/Prague \
    -v /var/data:/data \
    --name "mailserver" \
    -h "mail.lbndao.com" \
    -t analogic/poste.io


ufw allow 22
ufw allow 25
ufw allow 80
# ufw allow 110
ufw allow 143
ufw allow 443
ufw allow 465
ufw allow 587
ufw allow 993
ufw allow 995
# ufw allow 4190
ufw enable

# 25	SMTP - mostly processing incoming mails
# 80	HTTP - redirect to https (see options) and authentication for Let's encrypt service
# 110	POP3 - standard protocol for accessing mailbox, STARTTLS is required before client auth
# 143	IMAP - standard protocol for accessing mailbox, STARTTLS is required before client auth
# 443	HTTPS - access to administration or webmail client
# 465	SMTPS - Legacy SMTPs port
# 587	MSA - SMTP port used primarily for email clients after STARTTLS and auth
# 993	IMAPS - alternative port for IMAP encrypted since connection
# 995	POP3S - encrypted POP3 since connections
# 4190	Sieve - remote sieve settings