
#hugo server -w --minify  -b http://${HOSTNAME} -p 1313  --bind 0.0.0.0 --debug --theme hugo-pathogens-portal & 
hugo server -w --minify  -p 1313  --bind 0.0.0.0 --debug --theme hugo-pathogens-portal & 

while [ 1 > 0 ]
do
	bash /usr/bin/check_repo_change.sh 
	sleep 300
done
