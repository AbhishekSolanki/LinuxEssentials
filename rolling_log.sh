#!/bin/bash 
logFile=test.log
MaxFileSize=20 #Size in KB

#latest log will remain in test.log file and the old one will be moved to test.log_timestamp based on size
function rollingLogBySize() {
# $1 Message in log
file_size=`du -h $logFile | awk '{print $1}' | rev | cut -c 2- | rev`
    if [ ${file_size%.*} -gt ${MaxFileSize} ];then
        timestamp=`date +%s`
        mv $logFile $logFile.$timestamp
        touch $logFile
    fi
echo "`date '+%Y-%m-%d %H.%m.%S'` :: $1" >> $logFile
}


# Every time when the batch executes it generates log_0,_1..files indicating the no. of script execution.
getExecutionNoFlag=true
function rollingLogByExecutionNo() {
 # $1 message to write in log
 if [ "$getExecutionNoFlag" == true ] 
 then
 	execution_number=`ls -lrth | grep test.log | tail -n 1 | awk '{print $9}' | awk -F "_" '{print $2}'`
 	if [ -z "$execution_number" ]
 	then
 		execution_number=0
 	else
 		execution_number=`expr $execution_number + 1`
 	fi
 	getExecutionNoFlag=false
 fi
 echo "`date '+%Y-%m-%d %H.%m.%S'` :: $1" >> ${logFile}_$execution_number
}

function rollingLogByTime() {
	echo " "
}


while true
do
	rollingLogBySize "Hello World !"
	rollingLogByExecutionNo "Hello World !" 
done
