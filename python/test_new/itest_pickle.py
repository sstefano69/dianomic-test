#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

import pickle


def save_object(obj, filename):
    """ save_object """

    with open(filename, 'wb') as output:
        pickle.dump(obj, output, pickle.HIGHEST_PROTOCOL)

tech_companies = [
    ['Apple', 114.18],
    ['Google', 908.60],
    ['Microsoft', 69.18]
]
save_object(tech_companies, 'tech_companies.pkl')

tech_companies = []

with open('tech_companies.pkl', 'rb') as input:
    tech_companies = pickle.load(input)


print ("tech ", tech_companies)

