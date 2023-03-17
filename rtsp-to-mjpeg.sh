#!/bin/sh

while : # forever
do
    until /bin/ping -c1 -W1 $CAMERAIP >/dev/null 2>&1;
    do
        echo "$CAMERAIP not available..."
        sleep 5
    done
    echo "$CAMERAIP available, waiting 5 seconds to connect..."
    sleep 5
    /usr/bin/vlc --play-and-exit --no-video-title-show --no-interact --no-audio --intf dummy rtsp://$CAMERAUSER:$CAMERAPASSWORD@$CAMERAIP:554//stream1 --sout '#transcode{vcodec=mjpg,scale=1.0,acodec=none}:standard{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:8080/}'
    echo "no connection to $CAMERAIP..."
done