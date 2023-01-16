import asyncio
from nio import AsyncClient,RoomMessageText

async def message_cb(room, event):
    print(
        "Message received for room {} | {}: {}".format(
            room.display_name, room.user_name(event.sender), event.body
        )
    )


async def main():
    client = AsyncClient("http://localhost:8008", "@alice:localhost")

    client.add_event_callback(message_cb, RoomMessageText)

    await client.login("kds007kds")
    await client.room_send(
        room_id="!test",
        message_type="m.room.message",
        content={
            "msgtype": "m.text",
            "body": "Hello World"
        }
    )
    await client.sync_forever(timeout=30000)
    await client.close()


asyncio.get_event_loop().run_until_complete(main())