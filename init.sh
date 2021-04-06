#!/bin/sh

# Create Rabbitmq user
(
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_USER administrator ; \
rabbitmqctl add_vhost kubo ; \
rabbitmqctl add_vhost gnb ; \
rabbitmqctl add_vhost dale ; \
rabbitmqctl add_vhost validator ; \
rabbitmqctl set_permissions -p / $RABBITMQ_USER  ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p kubo $RABBITMQ_USER  ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p gnb $RABBITMQ_USER  ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p dale $RABBITMQ_USER  ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p validator $RABBITMQ_USER  ".*" ".*" ".*" ; \
echo "*** User '$RABBITMQ_USER' with password '$RABBITMQ_PASSWORD' completed. ***" ; \
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***") &



# $@ is used to pass arguments to the rabbitmq-server command.
# For example if you use it like this: docker run -d rabbitmq arg1 arg2,
# it will be as you run in the container rabbitmq-server arg1 arg2
rabbitmq-server $@