#!/bin/bash

# 每個專案須一致的安裝模板
# ~~~~~~~~~~~~~~開始~~~~~~~~~~~~~~
# PROJECT 專案名稱 
PROJECT=note
# PY_VERSION python版本 
PY_VERSION=3.10

cd ..
VENV_DIR=venv_$PROJECT
VERSION=$(python$PY_VERSION -V 2>&1)

echo $VERSION

# 檢測安裝python
case $VERSION in (*"Python $PY_VERSION"*)
        echo 已安裝python $PY_VERSION
    ;;
(*)
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python$PY_VERSION -y
;;esac

# 看需求開啟或關閉註解
sudo apt install python$PY_VERSION-venv -y
sudo apt install libpython$PY_VERSION-dev -y
# sudo apt install python$PY_VERSION-tk -y

if [ ! -d "$VENV_DIR" ]; then
    python$PY_VERSION -m venv $VENV_DIR
fi

cd $PROJECT

# 進入虛擬環境
. ../$VENV_DIR/bin/activate
# 安裝套件
python -m pip install --upgrade pip
pip install -r requirements.txt
# ~~~~~~~~~~~~~~結束~~~~~~~~~~~~~~

# 使用django
# 安裝程式
# sudo apt install memcached -y
# sudo apt install rabbitmq-server -y
# sudo apt install redis -y

# 資料表更新
# python manage.py makemigrations
# python manage.py migrate

# # 第一次 makemigrations 的動作 ！！
# python manage.py makemigrations user
# python manage.py migrate

# python manage.py collectstatic --noinput

# 排程更新
# python manage.py crontab remove
# python manage.py crontab add

# 啟動程式
# python manage.py runserver 8000
