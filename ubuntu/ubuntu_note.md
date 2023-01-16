# 安裝
sudo dpkg -i 軟體套件名.deb

# 排程
```bash
crontab -l    列出該使用者擁有的 crontab 指令
crontab -e   編輯該使用者的 crontab 指令
crontab -r    將使用者的 crontab 全部清除！（ 小心使用 
crontab -u   改變排程的執行身分: crontab -u user filename
sudo /etc/init.d/cron restart 重啟排程
```
# 重啟網路
sudo service network-manager restart

# 刷新dns
sudo systemd-resolve --flush-caches

# 安裝網路工具
sudo apt-get install -y gnome-nettool

# 看溫度
sudo apt install lm-sensors

sudo sensors-detect

sensors

# 文字編輯工具
sudo gedit

sudo nano

# GDAL
```bash
=> linux install gdal
sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get update --fix-missing
sudo apt-get install binutils libproj-dev gdal-bin
```
# 變更最高權限
sudo chmod 777 -R <filename>


# uWSGI啟動
```bash
uwsgi --emperor uwsgi.ini
uwsgi --emperor /etc/uwsgi/vassals
```
# 看ip
ifconfig

# 參考
## ubuntu 指令參考
https://hackmd.io/@NCTU-auv/rkxC_VHj8
## ngnix 註記指令
https://www.cnblogs.com/54chensongxia/p/12938469.html
## re測試
https://coding.tools/tw/regex-tester
## 排程測試
https://crontab.guru/#*_*_*/5_*_*




