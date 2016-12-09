FROM golang:1.6
RUN go get -d github.com/wsoula/cachet-monitor-header-fix
RUN go install github.com/wsoula/cachet-monitor-header-fix
COPY cachet-monitor.config.json /go
#COPY . /go/src/cachet-monitor
COPY cli/main.go /go/src/cachet-monitor/cli/main.go
#RUN go build cachet-monitor && go run /go/src/cachet-monitor/cli/main.go /go/src/cachet-monitor/monitor.go /go/src/cachet-monitor/config.go /go/src/cachet-monitor/http.go /go/src/cachet-monitor/incident.go && ls -hal /go/src/cachet-monitor  && ls -hal /go/bin
#RUN curl -v app-a-in.dev.drillinginfo.com/webstats/piwik.js
#RUN go build cachet-monitor && go run /go/src/cachet-monitor/cli/main.go -c /go/cachet-monitor.config.json && ls -hal /go/src/cachet-monitor  && ls -hal /go/bin
#RUN go run /go/src/cachet-monitor/cli/main.go -c /go/cachet-monitor.config.json
#RUN /go/bin/cachet-monitor -c /go/cachet-monitor.config.json
ENTRYPOINT ["go","run","/go/src/cachet-monitor/cli/main.go","-c","/go/cachet-monitor.config.json"]
