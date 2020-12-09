FROM centos:7
MAINTAINER WANG

ENV VERSION=1.18.0

COPY  CentOS-Base.repo  /etc/yum.repos.d/CentOS-Base.repo
RUN yum clean all 
RUN yum install -y gcc gcc-c++ make \
	openssl-devel pcre-devel gd-devel \
	iproute  wget && \
	yum clean all && \
	rm -rf /var/cache/yum/*
RUN wget  http://nginx.org/download/nginx-${VERSION}.tar.gz && \
	tar -zxf nginx-${VERSION}.tar.gz && \
	rm -f nginx-${VERSION}.tar.gz && \
	mv nginx-${VERSION} nginx && \
	cd /nginx && \
 	./configure --prefix=/usr/local/nginx \
	--with-http_ssl_module \
	--with-http_stub_status_module && \
	make -j 4 && make install && \
	rm -rf /usr/local/nginx/html/* && \
#	echo "ok" >> /usr/local/nginx/html/status.html && \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY index.html /usr/local/nginx/html/index.html

ENV PATH $PATH:/usr/local/nginx/sbin
WORKDIR /usr/local/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

