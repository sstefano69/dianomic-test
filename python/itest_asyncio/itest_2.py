
import asyncio
import time
import concurrent

LOOP = 10

done = False

from concurrent.futures import ProcessPoolExecutor

async def main():
    while True:
        await asyncio.sleep(0)
        if done:
            break

async def itest3():
    x = 0
    while x < 2:
        print("test test 3")
        x += 1
        await asyncio.sleep(0)

async def itest4():
    x = 0
    while x < 4:
        print("test test 4")
        x += 1
        await asyncio.sleep(0)

async def itest5():
    asyncio.ensure_future(itest6())
    x = 0
    while x < LOOP:
        print("test test 5")
        x += 1
        await asyncio.sleep(0)

async def itest6():
    global done

    x = 0
    while x < LOOP:
        print("test test 6")
        x += 1
        await asyncio.sleep(0)

    done = True

print ("test Python 9")

# Way 0
#test2 ()

# Way 1
#asyncio.get_event_loop().run_until_complete(load ())

# Way2
# asyncio.Task(itest3 ())
# asyncio.Task(itest4 ())
# asyncio.get_event_loop().run_forever()
# asyncio.get_event_loop().run_until_complete()

# # Way
# loop = asyncio.get_event_loop()
# tasks = [
#     loop.create_task(itest3()),
#     loop.create_task(itest4())
# ]
# loop.run_until_complete(asyncio.wait(tasks))
# loop.close()

# # Way
asyncio.ensure_future(itest3())
asyncio.ensure_future(itest4())
asyncio.ensure_future(itest5())
asyncio.get_event_loop().run_until_complete(main())

#
# loop = asyncio.get_event_loop()
#
# asyncio.ensure_future(itest3())
# asyncio.ensure_future(itest4())
#
# loop.run_until_complete(asyncio.wait)
