'''
Created on 25 mag 2016

@author: admin
'''

import logging

# logging.basicConfig(level=logging.DEBUG,format='[%(levelname)s] (%(threadName)-10s) %(message)s',


logger = logging.getLogger('myapp')
hdlr = logging.FileHandler('c:\\tmp\\myapp.log')
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
hdlr.setFormatter(formatter)
logger.addHandler(hdlr)
logger.setLevel(logging.INFO)

logger.info('While this is just chatty')
logger.error('We have a problem')

