import json
import sys
import os

import scrapelib
from scrapelib.cache import FileCache
from census_area import Census

target_variables = ('NAME',
                    'H1_001N',
                    'H1_002N',
                    'H1_003N',
                    'P2_001N',
                    'P2_002N',
                    'P2_003N',
                    'P2_004N',
                    'P2_005N',
                    'P2_006N',
                    'P2_007N',
                    'P2_008N',
                    'P2_009N',
                    'P4_001N',
                    'P4_002N',
                    'P4_003N',
                    'P4_004N',
                    'P4_005N',
                    'P4_006N',
                    'P4_007N',
                    'P4_008N',
                    'P4_009N',
                    'P5_001N',
                    'P5_002N',
                    'P5_003N',
                    'P5_004N',
                    'P5_005N',
                    'P5_006N',
                    'P5_007N',
                    'P5_008N',
                    'P5_009N',
                    'P5_010N')


c = Census(os.environ['CENSUS_API_KEY'])

pl_geojson = c.pl.state_place_block(target_variables,
                                    17,
                                    14000,
                                    return_geometry=True)

json.dump(pl_geojson, sys.stdout)
