FROM rabbitmq:3.7-management

# Define environment variables.

ARG IN_USER=novoprd
ARG IN_PASS=n0v0.2002

ENV RABBITMQ_USER ${IN_USER}
ENV RABBITMQ_PASSWORD ${IN_PASS}
ENV RABBITMQ_PID_FILE /tmp/pid-rabbit


ADD init.sh /init.sh
RUN chmod +x /init.sh
EXPOSE 15672

# Define default command
CMD ["/init.sh"]