#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# foglamp_begin
# see: http://foglamp.readthedocs.io/
# foglamp_end

""" purges a namespace deleting all the types and streams """

import common.ocs as ocs
import os

__author__ = "stefano simonelli"
__copyright__ = "copyright (c) 2018 osisoft, llc"
__license__ = "apache 2.0"
__version__ = "${version}"


# ### main ##############################################################################


tenant = "4be9ded8-c6a6-44ac-8e1a-9db44e58fa49"
client_id = "34571f14-d7d5-4cee-aaf6-0a5395bb6a10"
client_secret = "ia9xcirnuciicv793m7eu24knt5re+gfwg2abwopfay="
namespace = "test_19"



headers = ocs.retrieve_authentication_token(tenant, client_id, client_secret)

ocs.delete_types_streams(headers, tenant, namespace)
