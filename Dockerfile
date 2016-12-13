FROM golang:1.6
COPY . /go/src/cachet-monitor/
RUN go install cachet-monitor
#Copy in config template, then copy to env configs
COPY cachet-monitor.config.json /go
RUN sed s/@BASE_URL@/dev.drillinginfo/g /go/cachet-monitor.config.json > /go/cachet-monitor.config.dev.json && \
    sed -i s/@API_KEY@/oKwE8l9bAwchZigFirFg/ /go/cachet-monitor.config.dev.json && \
    sed s/@BASE_URL@/preprod.drillinginfo/g /go/cachet-monitor.config.json > /go/cachet-monitor.config.preprod.json && \
    sed -i s/@API_KEY@/oKwE8l9bAwchZigFirFg/ /go/cachet-monitor.config.preprod.json && \
    sed s/@BASE_URL@/drillinginfo/g /go/cachet-monitor.config.json > /go/cachet-monitor.config.prod.json && \
    sed -i s/@API_KEY@/oKwE8l9bAwchZigFirFg/ /go/cachet-monitor.config.prod.json
ENTRYPOINT ["go","run","/go/src/cachet-monitor/cli/main.go","-c"]
