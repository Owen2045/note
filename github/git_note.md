# <font color=#00ffff>環境設置</font>
## sshkey
```bash
# 建立sshkey
$ ssh-keygen -t rsa
# 查看sshkey
$ cat ~/.ssh/id_rsa.pub
# 新增至git
-> gitLab 首頁右上角 > setting > SSH Keys > 貼上金鑰
-> github 首頁右上角 > settings > SSH and GPG keys > New SSH key > 貼上金鑰
```
## clone & commit
```bash
# clone
$ git clone ssh連結
# 查看變更狀態
$ git status
# 新增檔案
$ git add 檔案
# 註解
$ git commit -m '簡短的說明'
# 推到分支/主線
$ git push

# 多人開發
# 查看主線分支設定
$ git remote -v
# 新增主線連結
$ git remote add mainline 組織專案連結
# 拉取主線code
$ git pull mainline main
```
## 一台電腦設定多使用者
```bash
# 到ssh目錄
$ cd ~/.ssh
# 建立sshkey
$ ssh-keygen -t rsa -C "<你的 email>"
# 存放路徑設定
/home/owen/.ssh/id_你的名稱 (ex: id_owen ，不要取id_rsa 會附蓋掉預設)
# 查看sshkey
$ cat ~/.ssh/id_你取的名稱.pub (ex:id_owen.pub)
-> 複製起來貼到git sshkey設定
-> 測試host
$ ssh -p 2222 -T 你的Host (ex:ssh -p 2222 -T owen)
-> 成功訊息: Welcome to GitLab, @sam24654113!
# clone指令
$ git clone ssh://<你的host>:<你的port(預設22)>/<你的git_username>/<專案名稱>
ex: git clone ssh://git@gitlab.wsos.com.tw:2222/sam24654113/vvip.git
```


































