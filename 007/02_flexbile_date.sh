#!/bin/bash

# Accept date in any format

clean_date=$( echo $1 | sed 's/[/:\^#]/-/g' )

echo $clean_date