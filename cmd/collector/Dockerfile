FROM alpine:latest as certs
RUN apk add --update --no-cache ca-certificates

#FROM alpine:latest
FROM alpine:3.6
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

EXPOSE 14267
COPY collector-linux /go/bin/
#CMD ["/go/bin/collector-linux"]
WORKDIR /go/bin
CMD ["./collector-linux"]
