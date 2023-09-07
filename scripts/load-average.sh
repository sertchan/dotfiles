#!/bin/bash
load_avarage() {
	load_average=$(uptime | awk '{print $(NF-2), $(NF-1), $NF}' | sed 's/,//g')
	echo "$load_average"
}

load_avarage
