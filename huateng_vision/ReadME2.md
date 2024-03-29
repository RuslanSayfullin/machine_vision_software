Инструкция для использования LinuxSDK huatengvision V2.1.0.43(240126)
1. Установить драйвера камеры из архива:
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

2. Установить pyenv на Debian:
	1. Установить зависимости:
		$ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
	2. Установить pyenv:
		$ curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
	3. Проверка установки:
		$ export PYENV_ROOT="$HOME/.pyenv"
		$ [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
		$ eval "$(pyenv init -)"
		- Затем перезагрузите оболочку
		- Команда ниже должна распечатать установленную версию:
		$ pyenv -v
	4. Установка версий Python. Запустите команду ниже, чтобы получить список доступных версий Python для установки:
		$ pyenv install --list
	5. Затем выберите версию по вашему выбору и установите ее, выполнив следующую команду:
		$ pyenv install 3.10.14
	6. Проверьте вашу установку:
		$ python3.10 --version
	7. Наконец, установите установленную версию как локальную по умолчанию (для этого терминального сеанса) или глобальную (вся система):
		$ pyenv local 3.10.14
	8. Перейдите в директорию с проектом
	9. Установите менеджер зависемостей poetry:
		$ pip install poetry
	10. Установка плагина "xcb" для Qt:
		$ sudo find /usr/lib | grep libxcb-util
		$ sudo ln -fs /usr/lib/x86_64-linux-gnu/libxcb-util.so.0.0.0 /usr/lib/x86_64-linux-gnu/libxcb-util.so.1.0.0
		$ sudo ln -fs /usr/lib/x86_64-linux-gnu/libxcb-util.so.0.0.0 /usr/lib/x86_64-linux-gnu/libxcb-util.so.1.0
		$ sudo ln -fs /usr/lib/x86_64-linux-gnu/libxcb-util.so.0.0.0 /usr/lib/x86_64-linux-gnu/libxcb-util.so.1
