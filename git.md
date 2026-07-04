Git 命令很多，但在团队协作开发中，**80% 的时间**你只会用到下面这 20 个核心命令。

我把它们分成了 5 类，方便你按场景记忆。建议先看最后的 **“每日开发实战流程”**，那会帮你把命令串起来。

---

### 1. 配置与初始化（一次性设置）

| 命令 | 作用 | 示例 |
| :--- | :--- | :--- |
| `git config` | 设置全局用户名/邮箱（提交代码时的身份） | `git config --global user.name "你的名字"` |
| `git init` | 在当前文件夹下初始化一个新的 Git 仓库（本地用） | `git init` |
| `git clone` | 将远程仓库（GitHub）的代码完整下载到本地 | `git clone git@github.com:用户名/仓库名.git` |

---

### 2. 本地日常修改（最常用，天天敲）

| 命令 | 作用 | 示例/说明 |
| :--- | :--- | :--- |
| `git status` | **查看当前状态**（哪些文件改了、哪些没提交）——**最常用命令** | `git status` |
| `git add` | 将修改的文件添加到“暂存区”（准备提交） | `git add .` （添加所有改动）<br>`git add 文件名` （添加指定文件） |
| `git commit` | 将暂存区的修改，生成一个**版本记录**（快照） | `git commit -m "feat: 添加登录功能"` |
| `git log` | 查看提交历史记录 | `git log --oneline` （简洁单行显示） |
| `git diff` | 查看当前文件与上次提交的**具体差异** | `git diff` （查看工作区改动） |

---

### 3. 分支管理（团队协作核心）

| 命令 | 作用 | 示例/说明 |
| :--- | :--- | :--- |
| `git branch` | 查看所有分支（带 `*` 的是当前所在分支） | `git branch` |
| `git branch 分支名` | 创建一个新分支 | `git branch feature-login` |
| `git checkout 分支名` | 切换到指定分支 | `git checkout feature-login` |
| `git checkout -b 分支名` | **创建并立即切换到新分支**（最常用） | `git checkout -b feature-login` |
| `git merge 分支名` | 将指定分支合并到**当前分支** | `git merge feature-login` （将功能合入主分支） |
| `git branch -d 分支名` | 删除本地分支（需已合并） | `git branch -d feature-login` |

---

### 4. 与远程仓库交互（GitHub 同步）

| 命令 | 作用 | 示例/说明 |
| :--- | :--- | :--- |
| `git remote -v` | 查看当前关联的远程仓库地址 | `git remote -v` |
| `git pull` | **从远程拉取最新代码** 并自动合并到当前分支（开工前必做） | `git pull origin main` |
| `git push` | 将本地提交**推送到远程仓库**（下班前必做） | `git push origin feature-login` |
| `git fetch` | 仅拉取远程最新信息，但不自动合并（比 pull 更安全） | `git fetch origin` |

---

### 5. 撤销与修正（救急命令）

| 命令 | 作用 | 示例/说明 |
| :--- | :--- | :--- |
| `git restore 文件` | **丢弃工作区的修改**，恢复到上次提交的状态（没 `add` 前用） | `git restore README.md` |
| `git restore --staged 文件` | 将文件**移出暂存区**（`add` 多了想撤销时用） | `git restore --staged 文件名` |
| `git commit --amend` | **修正上一次提交**（比如漏了文件，或写错注释） | `git commit --amend -m "新信息"` |

---

### 6. 🚀 每日开发实战流程（照着敲）

假设你要开始一个新功能（比如“用户注册”），团队基于 `main` 分支协作：

```bash
# 1. 上班第一件事：把主分支最新的代码拉下来
git checkout main          # 切到主分支
git pull origin main       # 拉取团队最新代码

# 2. 切出一个属于自己的功能分支
git checkout -b feature/register

# 3. 写代码... 写完后，查看修改了哪些文件
git status

# 4. 把修改加入暂存区并提交（可以多次提交）
git add .
git commit -m "feat: 完成注册界面UI"

# 5. 继续写代码... 再次提交
git add .
git commit -m "feat: 对接注册接口"

# 6. 下班前（或功能做完），把分支推送到 GitHub
git push origin feature/register

# 7. （后续）去 GitHub 网页创建 Pull Request，等审查通过合并后：
git checkout main          # 切回主分支
git pull origin main       # 拉取合并后的最新代码
git branch -d feature/register  # 删除本地旧分支
```

---

### 💡 新手避坑小贴士

- **`git add .` vs `git add -A`**：在当前目录下，两者效果基本一样，都是添加所有改动。但习惯用 `git add .` 就够了。
- **提交信息要规范**：团队里常用前缀，如 `feat:`（新功能）、`fix:`（修复bug）、`docs:`（文档）、`style:`（格式）。
- **遇到冲突别慌**：执行 `git pull` 或 `git merge` 时如果提示冲突，找到对应文件，手动删除 `<<<<<<<` 和 `>>>>>>>` 标记，保留你想要的内容，然后重新 `add` 和 `commit` 即可。

如果你想把某个命令的细节（比如合并冲突怎么处理）再问清楚，随时可以叫我。😊