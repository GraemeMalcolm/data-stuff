iothub=`cat iothub.txt`
iotdevice=`cat iotdevice.txt`


az iot device simulate --device-id $iotdevice --hub-name $iothub --data "IOT Device Message" --properties "key0=$(( $RANDOM % 113 + 1 ));key1=$(( $RANDOM % 113 + 1 ))" --msg-count 120 --msg-interval 1;
