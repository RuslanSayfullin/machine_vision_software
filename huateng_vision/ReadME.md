Инструкция для использования LinuxSDK huatengvision V2.1.0.43(240126)
1. Загрузите систему, создайте директорию MVSDK, распакуйте архив linuxSDK.tar.gz в созданной директорий:
	$ mkdir MVSDK
	$ cd MVSDK
	$ tar -zxvf linuxSDK_V2.1.0.43\(240126\).tar.gz
	$ rm linuxSDK_V2.1.0.43\(240126\).tar.gz
2. Скопируйте библиотеку и заголовочные файлы в текущую директорию:
	$ cp -r ./linuxSDK_V2.1.0.43\(240126\)/. .
	$ rm -r ./linuxSDK_V2.1.0.43\(240126\)
3. Выполните скрипт, скопируйте библиотеку и заголовочные файлы в системный каталог.:
	$ sudo ./install.sh

# для корректной работы систем требуется установка Python3 версий 11 или новее.
- Обновите вашу систему:
	$ sudo apt update && sudo apt upgrade
- Сначала нам нужно установить необходимые зависимости, чтобы иметь возможность собирать Python 3.10 из исходного кода:
	$ sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
- Скачать Python 3.12 для Debian:
	$ wget https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz
- Загрузив архив, распакуйте его:
	$ tar -xf Python-3.12.2.tgz
- Перейдите в извлеченный каталог и запустите команду configure, чтобы проверить, доступны ли необходимые зависимости. В команде флаг –enable-optimizations используется для оптимизации двоичного файла и запуска нескольких тестов:
	$ cd Python-3.12.2
	$ ./configure --enable-optimizations
- Когда проверка будет завершена, соберите Python 3.12 из исходного кода:
	$ make -j 4
- Когда make будет завершена, продолжите и установите Python 3.12 на Debian:
	$ sudo make altinstall
- Проверьте вашу установку:
	$ python3.12 --version
- Создайте виртуальную среду Python:
	$ python3.12 -m venv venv
- Следующим шагом будет активация окружения:
	$ ./source/venv/activate

# Установка OpenCV с помощью Python:
- Установите необходимые зависимости, связанные с GTK+:
	(venv) $ sudo apt update
	(venv) $ sudo apt install libgtk2.0-dev pkg-config
- Обновите cmake до последней версии. Вы можете использовать инструмент pip для этого:
	(venv) $ pip install --upgrade cmake
- Установите OpenCV с поддержкой GUI, указав флаг WITH_GTK=ON во время компиляции:
	(venv) $ pip install numpy
	(venv) $ pip install opencv-python-headless --no-cache-dir -vvv --global-option="build_ext" --global-option="-j8" --global-option="-DWITH_GTK=ON"
	(venv) $ pip install opencv-python
- Перейдите в директорию:
 (venv) $ cd demo/python_demo
- Запустите демо-сценарий:
 (venv) $ python3 cv_grab2.py

# Скомпилировать OpenCv:
- Установить пакеты OpenCV с помощью менеджера пакетов apt:
	$ sudo apt update
	$ sudo apt install libopencv-dev
- После установки пакетов OpenCV выполните команду make для компиляции:
	$ cd MVSDK/demo/OpenCv
	$ make
- Запустить проект:
	$ sudo ./main