# podman build --tag olgierdxyz/my-java-thread-count .
# podman run -it --name my-java-thread-count localhost/olgierdxyz/my-java-thread-count
# podman run -it --rm --name my-java-thread-count localhost/olgierdxyz/my-java-thread-count 3 3
# podman login -u olgierdxyz -p "?????????????" docker.io
# podman push olgierdxyz/my-java-thread-count

FROM registry.access.redhat.com/ubi8 as base
WORKDIR /opt/ThreadsTester
COPY ThreadsTester .
# If online maven repos are available:
#RUN set -eux && \
#    yum install -y maven java-11-openjdk-devel.x86_64 && \
#    yum clean all && \
#    mvn clean && \
#    mvn install

#RUN set -eux && \
#    yum install -y java-11-openjdk-devel.x86_64 && \
#    yum clean all 

FROM registry.access.redhat.com/ubi8 as base
WORKDIR /opt
COPY --from=base /opt/ThreadsTester/target/ThreadsTester-1.0-SNAPSHOT.jar .
RUN set -eux; \
    yum install -y java-11-openjdk-headless.x86_64

ENTRYPOINT ["java", "-jar", "ThreadsTester-1.0-SNAPSHOT.jar"]
CMD ["5", "4096"]
