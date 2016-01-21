FROM ubuntu:latest

MAINTAINER benharker@mac.com

RUN apt-get update ; apt-get install -y wget ;

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - ; 
RUN echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-chunkserver ;
RUN mv /etc/mfs/mfschunkserver.cfg.sample /etc/mfs/mfschunkserver.cfg ;

CMD ["/usr/sbin/mfschunkserver", "-f", "start"]
