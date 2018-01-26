
import asyncio
import time
import concurrent

LOOP = 10

done3 = False
done4 = False

from concurrent.futures import ProcessPoolExecutor

async def main():
    print("main start ")
    while True:
        print("main")
        await asyncio.sleep(0)
        if done3 and done4:
            break
    print("main end")

async def itest3():
    global done3
    x = 0
    while x < 10:
        print("test test 3")
        x += 1
        await asyncio.sleep(0)

    done3 = True

async def itest4(par):
    global done4

    x = 0
    while x < 4:
        print("test test 4 -{}-".format(par))
        x += 1
        await asyncio.sleep(0)

    done4 = True

# # Way
future_main = asyncio.ensure_future(main())
asyncio.ensure_future(itest3())
asyncio.ensure_future(itest4(1))
asyncio.ensure_future(itest4(2))
asyncio.get_event_loop().run_until_complete(future_main)
