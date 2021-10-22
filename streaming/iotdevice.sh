iothub=`cat iothub.txt`
iotdevice=`cat iotdevice.txt`


az iot device simulate --device-id $iotdevice --hub-name $iothub --properties "key0=data;key1=$(( $RANDOM % 113 + 1 ))" --msg-count 100 --msg-interval 3;
