#!/usr/bin/bash
#
#       _     _
#      (,\-~-/,)        Author			- Luka Medic
#      /  9 9  \        Release date	- 09.08.2021
#    __\   o   /__      Version			- 1.0
#   (::  '-^-'  ::)     Description		- Script appends config to rsyslog config file based on defined template and input file name.
#    '-/       \-`						  
#      \   '   /  		
#      /   I   \        
#     (___/ \___)       
#
#
#Setup:
# wget https://raw.githubusercontent.com/medaluka/lukam-public/main/rsyslog_add_conf/rsyslog_add_conf.sh
# mkdir -p /opt/halcom/bin/				  
# cp rsyslog_add_conf.sh /opt/halcom/bin/rsyslog_add_conf.sh
# ln -s /opt/halcom/bin/rsyslog_add_conf.sh /usr/bin/rsyslog_add_conf
# chmod 744 /opt/halcom/bin/rsyslog_add_conf.sh


# mkdir -p /opt/halcom/bin/
# touch /opt/halcom/bin/backup_file.sh
# ln -s /opt/halcom/bin/backup_file.sh /usr/bin/backup_file
# chmod 755 /opt/halcom/bin/backup_file.sh
# vi /opt/halcom/bin/backup_file.sh

## Params ##
logfile_fullpath=$1
logfile_name=`basename ${logfile_fullpath}`
logfile_name_no_ext=`basename ${logfile_fullpath} | cut -d. -f1`
logfile_path=`dirname ${logfile_fullpath}`
tmp_filename=./tmp.conf
conf_filename=/etc/rsyslog.d/halcom.conf
## Params ##

if [ ! -f ${logfile_fullpath} ]; then
    echo "File ${logfile_fullpath} not found. Exiting"
	exit 1
fi

## Template ##
echo '' >> ${tmp_filename}
echo '# ###LOGFILE_NAME###                                 ' >> ${tmp_filename}
echo '$InputFileName ###LOGFILE_PATH###/###LOGFILE_NAME### ' >> ${tmp_filename}
echo '$InputFileTag ###LOGFILE_NAME###:                    ' >> ${tmp_filename}
echo '$InputFileStateFile ###LOGFILE_NAME###.stat          ' >> ${tmp_filename}
echo '$InputFileSeverity info                              ' >> ${tmp_filename}
echo '$InputFileFacility local6                            ' >> ${tmp_filename}
echo '$InputFilePollInterval 1                             ' >> ${tmp_filename}
echo '$InputFilePersistStateInterval 1                     ' >> ${tmp_filename}
echo '$InputRunFileMonitor                                 ' >> ${tmp_filename}
## Template ##


sed "s|###LOGFILE_NAME###|${logfile_name}|g" ${tmp_filename} | sed "s|###LOGFILE_PATH###|${logfile_path}|g" >> ${conf_filename}

rm -f ${tmp_filename}
