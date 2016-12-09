FROM golang:1.6
RUN go get -d github.com/wsoula/cachet-monitor-header-fix
RUN go install github.com/wsoula/cachet-monitor-header-fix
#Copy in config template, then copy to env configs
COPY cachet-monitor.config.json /go
RUN sed s/@BASE_URL@/app-a-in.dev/g /go/cachet-monitor.config.json > /go/cachet-monitor.config.dev.json && \
    sed -i s/@API_KEY@/oKwE8l9bAwchZigFirFg/ /go/cachet-monitor.config.dev.json && \
    sed s/@BASE_URL@/app-a-in.preprod/g /go/cachet-monitor.config.json > /go/cachet-monitor.config.preprod.json && \
    sed -i s/@API_KEY@/oKwE8l9bAwchZigFirFg/ /go/cachet-monitor.config.preprod.json && \
    sed s/@BASE_URL@/app-a-in/g /go/cachet-monitor.config.json > /go/cachet-monitor.config.prod.json && \
    sed -i s/@API_KEY@/oKwE8l9bAwchZigFirFg/ /go/cachet-monitor.config.prod.json
#copy in main file
#COPY cli/main.go /go/src/cachet-monitor/cli/main.go
#RUN go build cachet-monitor && go run /go/src/cachet-monitor/cli/main.go /go/src/cachet-monitor/monitor.go /go/src/cachet-monitor/config.go /go/src/cachet-monitor/http.go /go/src/cachet-monitor/incident.go && ls -hal /go/src/cachet-monitor  && ls -hal /go/bin
#RUN curl -v app-a-in.dev.drillinginfo.com/webstats/piwik.js
#RUN go build cachet-monitor && go run /go/src/cachet-monitor/cli/main.go -c /go/cachet-monitor.config.json && ls -hal /go/src/cachet-monitor  && ls -hal /go/bin
#RUN go run /go/src/cachet-monitor/cli/main.go -c /go/cachet-monitor.config.json
#RUN /go/bin/cachet-monitor -c /go/cachet-monitor.config.json
#ENTRYPOINT ["go","run","/go/src/cachet-monitor/cli/main.go","-c","/go/cachet-monitor.config.json"]
ENTRYPOINT ["go","run","/go/src/cachet-monitor/cli/main.go","-c"]
