export TOKEN=umBfC2IWPP4lRJZ30dCfXEu0s22DyF0Zx7q9lyDUJM8
set -ex
# curl --header "Authorization: Bearer $token" -X GET http://localhost:8008/_matrix/client/v3/publicRooms

curl --header "Authorization: Bearer $token" -X POST http://localhost:8008/_matrix/client/v3/createRoom -d '{"creation_content": {"m.federate": false},"name": "The Grand Duke Pub","preset": "public_chat","room_alias_name": "thepub","topic": "All about happy hour"}'
