# <font color=#00ffff>環境設置</font>
## <font color=#808000>**sshkey**</font>
### <font color=#808080>**建立sshkey**</font>
$ ssh-keygen -t rsa
### <font color=#808080>**查看sshkey**</font>
$ cat ~/.ssh/id_rsa.pub
### <font color=#808080>**新增至git**</font>
>gitLab 首頁右上角 > setting > SSH Keys > 貼上金鑰

>github 首頁右上角 > settings > SSH and GPG keys > New SSH key > 貼上金鑰

## <font color=#808000>**clone & commit**</font>
### <font color=#808080>**克隆**</font>
$ git clone ssh連結
### <font color=#808080>**查看變更狀態**</font>
$ git status
### <font color=#808080>**新增檔案**</font>
$ git add 檔案
### <font color=#808080>**註解**</font>
$ git commit -m '簡短的說明'
### <font color=#808080>**推到分支/主線**</font>
$ git push

## <font color=#808000>**多人開發**</font>
### <font color=#808080>**查看主線分支狀態**</font>
$ git remote -v
### <font color=#808080>**新增主線連結**</font>
git remote add mainline 組織專案連結
### <font color=#808080>**拉取主線code**</font>
git pull mainline main






































