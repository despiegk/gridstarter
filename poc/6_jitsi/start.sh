set -ex
# curl https://download.jitsi.org/jitsi-key.gpg.key -o jitsi-key.gpg.key
# sudo gpg --output /usr/share/keyrings/jitsi-key.gpg --dearmor jitsi-key.gpg.key

# cd /root/code
# git clone https://github.com/jitsi/docker-jitsi-meet.git
mkdir -p ~/.jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
cp .env docker-jitsi-meet/.env
cd docker-jitsi-meet

docker compose up -d
# docker compose up
