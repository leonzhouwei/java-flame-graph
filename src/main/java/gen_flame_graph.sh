#!/bin/bash

JAVA_PROCESS_ID=$1
VAR_DIR="var"
FLAME_GRAPH_FILE=${VAR_DIR}/flamegraph.svg

echo "\n"
echo "--- rm perf.data ..."
sudo rm perf.data
echo "--- rm perf.data done"

echo "\n"
echo "--- input java proccess id is ${JAVA_PROCESS_ID}"
if [ ! ${JAVA_PROCESS_ID} ]; then
	echo "Input Java process id cannot be null"
	exit -1
fi 

echo "\n"
echo "--- perf started ..."
sudo perf record -F 99 -a -g -- sleep 30
echo "--- perf done"

echo "\n"
echo "--- perf-map-agent started ..."
java -cp attach-main.jar:$JAVA_HOME/lib/tools.jar net.virtualvoid.perf.AttachOnce ${JAVA_PROCESS_ID}
echo "--- perf-map-agent done"

sudo chown root /tmp/perf-*.map

echo "\n"
echo "--- generating flamegraph.svg ..."
if [ ! -d "${VAR_DIR}" ]; then
	mkdir -p "${VAR_DIR}"
fi

sudo rm ${FLAME_GRAPH_FILE}

sudo perf script | stackcollapse-perf.pl | flamegraph.pl --color=java --hash > ${FLAME_GRAPH_FILE}
echo "--- generating flamegraph.svg done"

exit 0

