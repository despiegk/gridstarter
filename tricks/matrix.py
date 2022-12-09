import asyncio

from nio import AsyncClient, MatrixRoom, RoomMessageText


async def message_callback(room: MatrixRoom, event: RoomMessageText) -> None:
    print(
        f"Message received in room {room.display_name}\n"
        f"{room.user_name(event.sender)} | {event.body}"
    )


async def main() -> None:
    client = AsyncClient("https://matrix.maxux.net", "@despiegk:maxux.net")
    # client.add_event_callback(message_callback, RoomMessageText)

    print(await client.login("Kds007kds!"))

    await client.join("!test:maxux.net")

    await client.room_send(
        # Watch out! If you join an old room you'll see lots of old messages
        room_id="!test:maxux.net",
        message_type="m.room.message",
        content={"msgtype": "m.text", "body": "Hello world!"},
    )
    await client.sync_forever(timeout=30000)  # milliseconds


asyncio.get_event_loop().run_until_complete(main())