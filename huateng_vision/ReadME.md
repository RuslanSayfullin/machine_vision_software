Инструкция для использования LinuxSDK huatengvision V2.1.0.43(240126)
1. Загрузите систему, создайте директорию MVSDK, распакуйте архив linuxSDK.tar.gz в созданной директорий:
	$ cd MVSDK
	$ tar -zxvf linuxSDK_V2.1.0.43.tar.gz
2. Скопируйте библиотеку и заголовочные файлы в текущую директорию:
	$ cp -r ./linuxSDK_V2.1.0.43\(240126\)/. .
	$ rm -r ./linuxSDK_V2.1.0.43\(240126\)
3. Выполните скрипт, скопируйте библиотеку и заголовочные файлы в системный каталог.:
	$ sudo ./install.sh