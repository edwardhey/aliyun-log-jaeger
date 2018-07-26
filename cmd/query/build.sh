#!/bin/bash -x
# cd $GOPATH/src/github.com/CodeInEverest/lhs_server_go
# govendor add +external
# git add vendor/vendor.json
# govendor sync
# cd -
# CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -v -o app ../main.go || exit 1
docker run \
	-v /opt/local/go/src:/go/src \
	-v /Volumes/data/xvdb/Projects/go/src:/go_project/src \
	-e CGO_ENABLED=1 \
	-e GOOS=linux \
	-e GOARCH=amd64 \
	-ti golang:alpine-1.9 sh -c "cd /go/src/github.com/jaegertracing/jaeger/cmd/query;go build -a -v -x -o query-linux main.go"
IMG_NAME=jaeger-collector:latest
#rsync -aP ../static ./ || exit 1
#rsync -aP ../swagger ./ || exit 1
docker build -t $IMG_NAME . || exit 1
#docker push $IMG_NAME || exit 1
docker tag $IMG_NAME registry.cn-shanghai.aliyuncs.com/goiot/jaeger-query:latest
docker push registry.cn-shanghai.aliyuncs.com/goiot/jaeger-query:latest
#cd $GOPATH/src/github.com/CodeInEverest/lhs_server_go/vendor
#ls -1 ./|grep -v vendor.json|xargs rm -rf
#rm -rf $GOPATH/github.com/CodeInEverest/lhs_server_go/vendor/

