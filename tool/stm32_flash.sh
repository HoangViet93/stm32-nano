#!/bin/sh

# Let take two parameter 
OPENOCD_CFG=$1
BIN_IMAGE=$2

# send SIGKILL signal to kill openocd process
killall -s 9 openocd
# openocd flash command line
openocd -f ${OPENOCD_CFG} -c "reset halt" -c "flash write_image erase ${BIN}" \
	-c "verify_image ${BIN_IMAGE}" -c reset -c shutdown 

