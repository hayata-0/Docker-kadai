FROM centos:centos7
MAINTAINER hayata ohno <hayata1454@gmail.com>
# RUN: buildするときに実行される
# RUN echo "now building..."
# CMD: runするときに実行される
# CMD echo "now running..."
# CMD ["echo","now running..."]
RUN yum install -y httpd
ADD ./index.html /var/www/html
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
