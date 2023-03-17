FROM alpine:latest
RUN apk add --no-cache vlc iputils
RUN adduser --disabled-password streamer
WORKDIR /home/streamer
COPY rtsp-to-mjpeg.sh .
USER streamer
ENTRYPOINT [ "/home/streamer/rtsp-to-mjpeg.sh" ]
EXPOSE 8080