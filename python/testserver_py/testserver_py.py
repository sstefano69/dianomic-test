import asyncio
import json
from aiohttp import web

async def status(request):
    return web.json_response('OK')

async def replystatus(request):
    data = await request.json()
    str_1 = str(data)
    print ("###  #########################################################################################:")

    print ("typ data  |{0}|".format(type(data) ) )
    print ("typ str_1 |{0}|".format(type(str_1) ) )

    print ("###:")

    str_1 = str_1.replace("'", "\"")

    step1 = json.loads(str_1)
    step2 = json.dumps(step1, sort_keys=True, indent=4)

    print("message 1 - chars |{0}|".format(step2))

    # print ("message 1 - 2000 chars |{0}|".format(str_1[:2000]))

    print ("###  #########################################################################################:")

    return web.json_response(data)

app = web.Application()  # pylint: disable=invalid-name
app.router.add_route('GET', '/status', status)
app.router.add_route('POST', '/ingress/messages', replystatus)


def main():    
    """Starts the aiohttp process to serve the REST API"""
    print ("Start")


    loop = asyncio.get_event_loop()
     # continue server bootstraping
    handler = app.make_handler()
    coroutine = loop.create_server(handler, '0.0.0.0', 8118)
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
