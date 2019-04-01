curl -X DELETE http://localhost:9200/`curl http://localhost:9200/_cat/indices | grep billing | awk '{print $3}' | sort -r | tail -n+2`
# > /var/log/myjob.log 2>&1

. /root/aws-elk-billing/prod.env

aws s3 ls s3://${S3_BUCKET_NAME}/${S3_REPORT_PATH}/ | grep '/' | awk '{ print $2 }' | sort -r | tail -n+2 > /tmp/es_clean_s3.tmp

for line in `cat /tmp/es_clean_s3.tmp`
do
  aws s3 rm s3://${S3_BUCKET_NAME}/${S3_REPORT_PATH}/${line} --recursive
done

