
import string
import random
import sys
import time

import psycopg2
import asyncio
import aiopg
import aiopg.sa
import sqlalchemy as sa

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

#dsn = 'dbname=foglamp user=foglamp password=foglamp host=127.0.0.1 port=7800'
dsn = 'dbname=foglamp user=foglamp password=foglamp host=127.0.0.1'
#dsn = 'dbname=foglamp user=foglamp password=foglamp host=192.168.1.100 port=5432'

cmd = "SELECT * FROM public.sensor_values_t"
cmd_select = "SELECT count(*) FROM sensor_values_t"
cmd_insert = "SELECT * FROM public.sensor_values_t"

ROWS_COUNT = 1 * 10 * 1000

def test_1 ():


    cmd = "SELECT * FROM public.sensor_values_t"

    async def go():
        async with aiopg.create_pool(dsn) as pool:
            async with pool.acquire() as conn:
                async with conn.cursor() as cur:
                    await cur.execute(cmd)
                    ret = []
                    async for row in cur:
                        ret.append(row)

                    print ("Results  " + str(ret))
                    print("Results  " + str(ret[0][0] ))
                    print("Results  " + str(ret[0][1]))
                    print("Results  " + str(ret[0][4]))
                    print("Results  " + str(ret[1]))

    loop = asyncio.get_event_loop()
    loop.run_until_complete(go())

def test_2 ():



    metadata = sa.MetaData()

    tbl = sa.Table('sensor_values_t',
                   metadata,
                   sa.Column('id', sa.BigInteger, primary_key=True),
                   sa.Column('key', sa.String(50)))

    async def go():
        async with aiopg.sa.create_engine (dsn) as engine:
            async with engine.acquire() as conn:
                await conn.execute(tbl.insert().values(key=id_generator(10)))

                # !F!
                print ("DBG 1")
                #async for row in conn.execute(tbl.select().where(tbl.c.key=='9f2acad687df4ae7b7faeef8affdd0a9') ):
                async for row in conn.execute(tbl.select().where(tbl.c.key == '6b110c8ca02')):
                    print(row.id, row.key)

                print("DBG 2")


    loop = asyncio.get_event_loop()
    loop.run_until_complete(go())

def test_count ():
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()

    cur.execute (cmd_select)
    rows = cur.fetchall()
    for row in rows:
        print ("Rows count {:>10,} : ". format (row[0]))



def test_4():
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()

    cur.execute("TRUNCATE TABLE foglamp.sensor_values_t;")

    for idx in range(0, ROWS_COUNT):
        cmd_insert = "INSERT INTO sensor_values_t (key) VALUES ('{0}')".format(id_generator(10))
        cur.execute(cmd_insert)

    conn.commit()


def test_4_1():
    conn = psycopg2.connect(dsn)
    cur = conn.cursor()

    cur.execute("TRUNCATE TABLE foglamp.sensor_values_t;")

    for idx in range(0, ROWS_COUNT):
        cmd_insert = "INSERT INTO sensor_values_t (key) VALUES ('{0}')".format(id_generator(10))
        cur.execute(cmd_insert)
        conn.commit()


def test_5 ():

    metadata = sa.MetaData()

    tbl = sa.Table('sensor_values_t',
                   metadata,
                   sa.Column('id', sa.BigInteger, primary_key=True),
                   sa.Column('key', sa.String(50)))

    async def go():
        async with aiopg.sa.create_engine (dsn) as engine:
            async with engine.acquire() as conn:
                await conn.execute("TRUNCATE TABLE foglamp.sensor_values_t;")

                for idx in range(0, ROWS_COUNT):
                    await conn.execute(tbl.insert().values(key=id_generator(10)))



    loop = asyncio.get_event_loop()
    loop.run_until_complete(go())


print("TEST : aiopg")
#test_1 ()


t0 = time.time()
test_4 ()
t1 = time.time()

test_count ()
print("psycopg2 |{0}|".format(t1 - t0))


t0 = time.time()
test_4_1 ()
t1 = time.time()

test_count ()
print("psycopg2/commit |{0}|".format(t1 - t0))


t0 = time.time()
test_5 ()
t1 = time.time()

test_count ()
print("aiopg |{0}|".format(t1 - t0))




