#!/bin/bash

# этот код помогает установить рабочую директорию скрипта в директорию, в которой он находится.
DIRNAME=`dirname $0`
cd $DIRNAME


source ~/.bashrc
if [ ! -d "/opt/MVS" ]; then
	echo "Install MVS,Please wait..."
	tar -C /opt -xzf ./MVS.tar.gz
else
	echo "Uninstall MVS,Please wait..."
	rm -rf /opt/MVS
	echo "Install MVS,Please wait..."
	tar -C /opt -xzf ./MVS.tar.gz
fi
#
if [ ! -d "/usr/local/Qt-5.6.3/lib/fonts" ]; then
	mkdir -p /usr/local/Qt-5.6.3/lib/fonts
	cp -r /opt/MVS/bin/fonts/* /usr/local/Qt-5.6.3/lib/fonts
else
	echo "path exist..."
fi


echo "Set up the SDK environment..."

sh $DIRNAME/set_usb_priority.sh
sh $DIRNAME/set_virtualserial_priority.sh
source $DIRNAME/set_env_path.sh
sh $DIRNAME/set_sdk_version.sh

cd /opt/MVS/driver/gige
if [ -f /opt/MVS/driver/gige/unload.sh ]; then
	./unload.sh
fi
if [ -f /opt/MVS/driver/gige/driver_self_starting.sh ]; then
    /opt/MVS/driver/gige/driver_self_starting.sh 1 
fi
cd /opt/MVS/bin
if [ -f /opt/MVS/bin/script_self_starting.sh ]; then
    /opt/MVS/bin/script_self_starting.sh 1 
fi

cd /opt/MVS/logserver
./RemoveServer.sh
./InstallServer.sh


cd /opt/MVS/driver/pcie
if [ -f /opt/MVS/driver/pcie/unload.sh ]; then
	bash ./unload.sh
fi
if [ -f /opt/MVS/driver/pcie/driver_self_starting.sh ]; then
    /opt/MVS/driver/pcie/driver_self_starting.sh 1 
fi


cd /opt/MVS/MVFG/logserver
./RemoveServer.sh
./InstallServer.sh




echo "Install MVS complete!"
echo "Tips: You should be launch a new terminal or execute source command for the bash environment!"
cd $PWD



