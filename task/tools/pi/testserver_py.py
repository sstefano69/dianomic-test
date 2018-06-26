import asyncio
from aiohttp import web

async def status(request):
    return web.json_response('OK')

async def replystatus(request):
    data = await request.json()
    return web.json_response(data)

app = web.Application()  # pylint: disable=invalid-name
app.router.add_route('GET', '/status', status)
app.router.add_route('POST', '/ingress/messages', replystatus)


def main():
    """Starts the aiohttp process to serve the REST API"""
    loop = asyncio.get_event_loop()
     # continue server bootstraping
    handler = app.make_handler()
    coroutine = loop.create_server(handler, '0.0.0.0', 8181)
    server = loop.run_until_complete(coroutine)
    print('Serving on http://%s:%s' % server.sockets[0].getsockname()) # HERE!
    try:
        loop.run_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.close()
        loop.run_until_complete(server.wait_closed())
        loop.run_until_complete(handler.finish_connections(1.0))
        loop.close()

main()
