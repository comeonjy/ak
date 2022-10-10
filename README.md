```

       __________/\\\\\\\\\_______________________/\\\________/\\\______        
        ________/\\\\\\\\\\\\\____________________\/\\\_____/\\\//_______       
         _______/\\\/////////\\\___________________\/\\\__/\\\//__________      
          ______\/\\\_______\/\\\___________________\/\\\\\\//\\\__________     
           ______\/\\\\\\\\\\\\\\\___________________\/\\\//_\//\\\_________    
            ______\/\\\/////////\\\___________________\/\\\____\//\\\________   
             ______\/\\\_______\/\\\___________________\/\\\_____\//\\\_______  
              ______\/\\\_______\/\\\___________________\/\\\______\//\\\______ 
               ______\///________\///____________________\///________\///_______
                                                      
```


Linux下脚本管理工具

[![Website](https://img.shields.io/website?url=https%3A%2F%2Fwww.jiangyang.me)](https://blog.jiangyang.me)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/comeonjy/ak)
![GitHub](https://img.shields.io/github/license/comeonjy/ak)
![GitHub issues](https://img.shields.io/github/issues/comeonjy/ak)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/comeonjy/ak)
![GitHub pull requests](https://img.shields.io/github/issues-pr/comeonjy/ak)
![GitHub commit activity](https://img.shields.io/github/commit-activity/w/comeonjy/ak)
![GitHub last commit](https://img.shields.io/github/last-commit/comeonjy/ak)
![GitHub repo size](https://img.shields.io/github/repo-size/comeonjy/ak)
![GitHub language count](https://img.shields.io/github/languages/count/comeonjy/ak)
![Lines of code](https://img.shields.io/tokei/lines/github/comeonjy/ak)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/comeonjy/ak)
![GitHub contributors](https://img.shields.io/github/contributors-anon/comeonjy/ak)
![Sourcegraph for Repo Reference Count](https://img.shields.io/sourcegraph/rrc/github.com/comeonjy/ak)
![GitHub top language](https://img.shields.io/github/languages/top/comeonjy/ak)



### 安装使用

> 手动安装

```shell
curl -o ak-main.tar.gz https://codeload.github.com/comeonjy/ak/tar.gz/refs/heads/main
tar -xvf ak-main.tar.gz -C /usr/local/
cp /usr/local/ak-main/ak /usr/bin/
export AK_ROOT=/usr/local/ak-main
```

> Debug

```shell
export AK_ROOT=$(PWD)
export PATH=$PATH:$AK_ROOT
```

### Example

```shell
# 查看当前版本
ak version

# 更新到最新版本
source ak update main

# 进入指定容器
source ak docker goto <container_name>

```

### 代码规范
* 函数名用蛇形，文件名用中横线，隐藏函数命名用下划线开头
* Commit提交

| Commit      | 描述      |
|-------------|---------|
| :bug:       | 修复BUG   |
| :memo:      | 添加或更新文档 |
| :sparkles:  | 引入新功能   |
| :test_tube: | 测试      |

* 目录结构
```
.
├── CHANGELOG.md
├── LICENSE
├── README.md
├── VERSION
├── ak
├── ak.help
├── base # 脚本目录
└── lib  # 工具库
```

### TODO
- [ ] 支持安装指定版本ak
- [ ] 支持卸载ak
- [ ] 支持一键安装
- [ ] 支持选项参数
- [ ] 兼容各操作系统发行版
- [ ] 解决脚本内不能修改父shell环境变量问题
- [ ] 解决插件安装问题
- [ ] 拆分bash-completion