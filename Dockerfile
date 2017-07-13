FROM alpine:3.6

ENV VERSION=0.6.2
ENV ARCH=linux_amd64

ADD docker/envconsul.hcl /envconsul.hcl
RUN apk add --no-cache curl && \
	curl -o /tmp/envconsul.tgz https://releases.hashicorp.com/envconsul/${VERSION}/envconsul_${VERSION}_${ARCH}.tgz && \
	tar -xvzf /tmp/envconsul.tgz -C /usr/bin && \
	rm -fr /tmp/envconsul.tgz

ENTRYPOINT ["/usr/bin/envconsul","-config","/envconsul.hcl"]