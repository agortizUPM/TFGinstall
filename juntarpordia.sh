#!/bin/bash

tempfile=$(mktemp)

awk -F' ' '{
    date = $1; 
    zone = $2; 
    if (zone == "Capital" || zone == "Norte" || zone == "Sur" || zone == "Este" || zone == "Oeste") {
        sum[date, zone]++
    }
} 
END {
    for (key in sum) {
        split(key, parts, SUBSEP); 
        print parts[1] "," parts[2] "," sum[key] ",,"  
    }
}' fechayzona.txt > "$tempfile"


{
    echo "Fecha,zone,valor,latitudes,longitudes"
    sort -t, -k1,1 -k2,2 "$tempfile"
} >> tfgsumatorio.csv

rm "$tempfile"

