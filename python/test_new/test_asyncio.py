
import asyncio
import time
import concurrent

from concurrent.futures import ProcessPoolExecutor


async def test1():
    print("test test 1")
    await  test3()
    print("test test 1.1")

def test2():
    print("test test 2")

def test6():
    print("test test 6")

async def test7():
    print("test test 7")
    loop.run_in_executor(p, test6)

async def test3():
    print("test test 3")

async def test4():
    print("test test 4")


print ("test Python 9")

# Way 0
#test2 ()

# Way 1
#asyncio.get_event_loop().run_until_complete(load ())

# Way2
asyncio.Task(test3 ())
asyncio.Task(test4 ())
asyncio.get_event_loop().run_forever()


# Way2
#asyncio.Task(test3 ())
#asyncio.Task(test4 ())


# Way3
#loop = asyncio.get_event_loop()
#loop.run_until_complete(load ())

# Way4
#loop = asyncio.get_event_loop()
#p = ProcessPoolExecutor(2)
#loop.run_in_executor(p, test6)


# Way4
# loop = asyncio.get_event_loop()
# pool = concurrent.futures.ProcessPoolExecutor(2)
# loop.run_in_executor(pool, test6)


# Way
#loop = asyncio.get_event_loop()
#loop.run_in_executor(None, test6)

# Way
# loop = asyncio.get_event_loop()
# t1 = loop.create_task(test3 ())
# t2 = loop.create_task(test3 ())
# loop.run_until_complete(asyncio.gather(t1,t2))
#

# Way
# loop = asyncio.get_event_loop()
# tasks = [
#     loop.create_task(test3()),
#     loop.create_task(test3())
# ]
# loop.run_until_complete(asyncio.wait(tasks))
# loop.close()
