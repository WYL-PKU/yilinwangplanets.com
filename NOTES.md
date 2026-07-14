# yilinwangplanets.com 本地预览与部署速查

仓库位置：

```bash
cd ~/other/yilinwangplanets.com
```

---

## 1. 每次开始修改前：同步远程仓库

```bash
cd ~/other/yilinwangplanets.com
git pull --rebase origin master
```

然后用 VS Code 打开：

```bash
code .
```

---

## 2. 本地实时预览网站

### 日常启动

```bash
cd ~/other/yilinwangplanets.com
docker compose up
```

浏览器打开：

```text
http://localhost:4000
```

修改 Markdown、HTML、CSS 等文件后，Jekyll 通常会自动重新编译。刷新浏览器即可查看效果。

停止服务器：

```text
Ctrl+C
```

清理已经停止的容器：

```bash
docker compose down
```

### 首次运行或依赖发生变化

以下文件发生变化时，需要重新构建镜像：

```text
Dockerfile
Gemfile
Gemfile.lock
```

执行：

```bash
cd ~/other/yilinwangplanets.com
docker compose up --build
```

普通内容更新不需要加 `--build`。

---

## 3. 只生成静态网页文件

生成完整静态网站到 `_site/`：

```bash
cd ~/other/yilinwangplanets.com

docker compose run --rm jekyll-site \
  bundle exec jekyll build \
  --config _config.yml,_config_docker.yml
```

检查生成结果：

```bash
ls _site
```

使用 Python 临时查看 `_site/`：

```bash
python3 -m http.server 4000 --directory _site
```

浏览器打开：

```text
http://localhost:4000
```

停止：

```text
Ctrl+C
```

注意：

* `_site/` 是本地生成结果。
* 不需要提交 `_site/`。
* 不要直接双击 `_site/index.html`，部分绝对路径资源可能无法正常加载。

日常修改网站时，直接使用 `docker compose up` 即可，不必专门运行静态构建命令。

---

## 4. 修改完成后检查内容

```bash
cd ~/other/yilinwangplanets.com
git status
git diff
```

查看某个文件已经暂存或提交前的具体变化：

```bash
git diff -- 文件路径
```

例如：

```bash
git diff -- _pages/about.md
```

---

## 5. 部署到 GitHub 并更新正式网站

执行：

```bash
cd ~/other/yilinwangplanets.com
sh deploy.sh "本次修改说明"
```

例如：

```bash
sh deploy.sh "Update biography and publications"
```

或者：

```bash
sh deploy.sh "Add new talk"
```

`deploy.sh` 会自动执行：

```text
git add
→ git commit
→ git pull --rebase
→ git push origin master
```

推送到 `master` 后，GitHub Actions 会自动：

```text
运行 talkmap.ipynb
→ 构建 Jekyll 网站
→ 部署到 GitHub Pages
```

不需要手动上传 `_site/`。

---

## 6. 查看部署是否成功

进入 GitHub 仓库：

```text
https://github.com/yilinwang-atmos/yilinwangplanets.com
```

打开：

```text
Actions
```

等待最新 workflow 变成绿色。

如果 `deploy.sh` 输出：

```text
No local changes to commit.
Everything up-to-date.
```

说明没有产生新的 commit，因此通常不会触发新的部署。

---

## 7. 最常用的完整流程

```bash
cd ~/other/yilinwangplanets.com

git pull --rebase origin master

code .

docker compose up
```

浏览器检查：

```text
http://localhost:4000
```

检查完成后按：

```text
Ctrl+C
```

然后：

```bash
git status
git diff

sh deploy.sh "描述本次修改"
```

---

## 8. 常见问题

### Docker daemon 没有运行

错误：

```text
Cannot connect to the Docker daemon
```

解决：

```bash
sudo systemctl start docker
```

检查状态：

```bash
systemctl status docker --no-pager
```

Docker 已设置为开机启动，通常不需要手动执行。

### 查看运行中的容器

```bash
docker compose ps
```

### 查看网站容器日志

```bash
docker compose logs -f
```

### 强制重新构建镜像

```bash
docker compose down
docker compose build --no-cache
docker compose up
```

### GitHub 登录状态

```bash
gh auth status
```

重新登录：

```bash
gh auth login
gh auth setup-git
```

### 测试 Git push

```bash
git push origin master
```

没有新 commit 时，正常输出是：

```text
Everything up-to-date
```

---

## 核心记忆版

本地预览：

```bash
cd ~/other/yilinwangplanets.com
docker compose up
```

正式部署：

```bash
cd ~/other/yilinwangplanets.com
sh deploy.sh "修改说明"
```
