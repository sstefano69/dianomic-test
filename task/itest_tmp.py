#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs


b = {'API': False}

v = b'The FogLAMP Core REST API'

v2 = v.decode("utf-8")


def get_utc_time(dt):
    import dateutil.parser  # move to imports section
    from datetime import datetime  # move to imports section
    your_date = dateutil.parser.parse(dt)
    print("before ", your_date)

    ts = your_date.timestamp()
    your_utc_dt = datetime.utcfromtimestamp(ts).strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    return your_utc_dt


if __name__ == "__main__":
    print("India", get_utc_time("2018-01-22 18:58:00.603994+05:30"))

    print("Milan", get_utc_time("2018-03-26 18:58:00.603994+01:00"))


