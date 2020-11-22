#!/bin/bash
# Using API zipcodebase.com, and get state by zip code, 3600 requests takes 35 min aprox.

while read zipcode; do
    echo "working on: $zipcode"
    API_KEY=""
    #search the state_code value
    STATE=$(curl -s "https://app.zipcodebase.com/api/v1/search?codes=$zipcode&country=US&apikey=$API_KEY" | python -mjson.tool | grep '"state_code"' | awk {'print $2'} )
    echo $STATE
    # save zipcode and state on csv
    echo "$zipcode,$STATE" >> final_codes.csv
done <zipcodes.csv
