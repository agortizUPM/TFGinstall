#!/bin/bash

for file in fichlogin.*; do
    zcat "$file" | awk -F'[][]| for | ' '/Successful login/ {
        split($2, date, "-");
        months = "JanFebMarAprMayJunJulAugSepOctNovDec";
        month_num = index(months, substr(date[2], 1, 3)) / 3 + 1;
        split($0, parts, " ");
        user = parts[8];
        printf "%04d-%02d-%02d %s\n", date[3], month_num, date[1], user
    }'
done >> tfgnombreyfecha.txt