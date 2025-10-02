#!/bin/bash

total_download=0
total_upload=0
results_json='{"results":[]}'

for i in {1..20}; do
    result=$(speedtest | grep 'Hosted\|Download:\|Upload:')
    download_speed=$(echo "$result" | grep -oP 'Download:\s+\K[0-9.]+')
    upload_speed=$(echo "$result" | grep -oP 'Upload:\s+\K[0-9.]+')
    echo "[$i] Download: $download_speed Mbps, Upload: $upload_speed Mbps" 
    total_download=$(bc <<< "scale=2; $total_download + $download_speed")
    total_upload=$(bc <<< "scale=2; $total_upload + $upload_speed")
    
    result_json='{"Test":'$i', "download_speed":"'$download_speed'", "upload_speed":"'$upload_speed'"}'
    results_json=$(echo $results_json | jq --argjson result "$result_json" '.results += [$result]')
done

average_download=$(bc <<< "scale=2; $total_download / 2")
average_upload=$(bc <<< "scale=2; $total_upload / 2")

echo "[AVG] Download: $average_download Mbps"
echo "[AVG] Upload: $average_upload Mbps"

average_json='{"average_download_speed":"'$average_download'", "average_upload_speed":"'$average_upload'"}'
results_json=$(echo $results_json | jq --argjson average "$average_json" '. += $average')

echo $results_json > speedtest_results.json
