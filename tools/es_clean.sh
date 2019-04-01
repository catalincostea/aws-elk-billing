curl -X DELETE http://localhost:9200/`curl http://localhost:9200/_cat/indices | grep billing | awk '{print $3}' | sort -r | tail -n+2` > /var/log/myjob.log 2>&1
