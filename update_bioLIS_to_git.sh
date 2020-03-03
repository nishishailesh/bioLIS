#!/bin/bash
cp /var/www/html/* . -f
cp /var/www/html/date . -Rf
cp /var/www/html/docs . -Rf
cp /var/www/html/tcpdf . -Rf

echo "Give mysql password"
read password

mysqldump -d -uroot -p$password biochemistry >biochemistry.blank

#Tables_in_biochemistry

touch biochemistry_table_with_data.sql

for tname in TAT abnormal_alert  \
clinician \
code \
critical_alert \
delta_alert \
detection_limit \
environmental-parameter \
equipment \
equipment-log \
equipment_name \
equipment_record \
equipment_record_type \
location \
preservative \
profile \
qc_equipment \
qc_target \
reagent_name \
reagent_status \
reflex_alert \
refrigerator \
reminder \
reportable_alert \
sample_details \
sample_type \
schedule \
scope \
status \
suggestion \
technician \
unit \
urgent \
user \
view_data
do
        mysqldump  -uroot biochemistry $tname -p$password >> "biochemistry_table_with_data.sql"
done

git add *
git commit -a
git push https://github.com/nishishailesh/bioLIS master

