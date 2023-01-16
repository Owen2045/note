# 移除指令
```bash
sudo apt-get remove "mariadb-*"
sudo apt remove galera-4
sudo apt remove galera-3
apt list --installed | grep -i -E "mariadb|galera"
```
# 重啟
sudo service mysql restart

# 安裝
sudo apt install mariadb-server libmysqlclient-dev mysql-common -y 

# 設定root  
sudo mysql_secure_installation

# 嘗試登入 並創建資料庫
mysql -u root -p -h 127.0.0.1 -P 3306
```bash
sudo mysql -u root
-> use mysql;
-> set password for 'root'@'localhost' = password('YOUR_ROOT_PASSWORD_HERE');
-> flush privileges;
-> quit
```


# docker 完整備份(邏輯)
```bash
# 進入 mariadb的container
docker exec -ti lbor_mariadb /bin/bash

# 1. 建立備份目標位置
mkdir data/backup

# 2. 輸入使用者帳號密碼 進行備份
# --target-dir 目標路徑
mariabackup --backup --target-dir data/backup --user root --password aaaaa

# 3. 使備份準備運行server的狀態
mariabackup --prepare --target-dir data/backup

# 4. 變更權限 (讓你可以直接複製)
chmod 777 data/backup -R

# 5. 複製備份資料 ~/data/backup/
```


## 增量備份(邏輯)

基於完整備份，新增增量備份

```bash
# 1. 建立增量備份位置
mkdir data/backup
# 增量備份路徑: --target-dir 
# 完整備份路徑: --incremental-basedir

mariabackup --backup --target-dir data/backup --incremental-basedir data/lbor103 --user root --password aaaa

# 2. 合併
# 增量備份路徑: --target-dir 
# 完整備份路徑: --incremental-dir
mariabackup --prepare --target-dir data/lbor103 --incremental-dir data/backup

# 3. 變更權限 (讓你可以直接複製)
chmod 777 data/lbor103 -R

# 4. 複製備份資料 ~/data/lbor103
```

## docker 完整還原(邏輯)

```bash
# 非官方正常流程
# 先把docker的容器關閉
docker-compose up
docker-compose down

# 進入 路徑 ~/marindb/lbor_v3/
# 查看lbor_v3 原先權限 擁有者名稱後面的數字

# 將備份檔 移過來(~/marindb/lbor_v3/)
# 並變更檔名 lbor_v3
# 變更權限 999 改成 擁有者名稱後面的數字
sudo chown 999:docker lbor_v3 -R
```

docker exec -ti lbor_django /bin/bash
docker exec -ti lbor_mariadb /bin/bash