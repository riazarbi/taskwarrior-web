#!/bin/sh

if ! test -e /root/.taskrc; then
    echo 'Container NEW.'   
    ln -s /root/.task/taskrc /root/.taskrc

    if ! test -e /root/.task/taskrc; then
    	echo 'Container config create.'   
    	echo "confirmation=off" > /root/.task/taskrc
    fi

    task config data.location -- /root/.task

    if [ "$TASKD_SERVER" ]; then
    	echo "Sync enable."

    	task config taskd.server 		-- $TASKD_SERVER
    	task config taskd.credentials 	-- $TASKD_CREDENTIALS
		task config taskd.certificate 	-- /root/.task/client.cert.pem
		task config taskd.key 			-- /root/.task/client.key.pem
		task config taskd.ca 			-- /root/.task/ca.cert.pem
        task config taskd.trust 		-- strict
    	task add "Docker hav0k/taskwarrior-web init with sync. Delete me."
    else
    	task add "Docker hav0k/taskwarrior-web init without sync. Delete me."
    fi
fi

if [ $# -gt 0 ];then
  exec "$@"
else
  exec task-web -F -L
fi
