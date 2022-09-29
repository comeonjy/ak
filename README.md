# AK
脚本集合

### 代码规范
* 函数名用蛇形，文件名用中横线，隐藏函数命名用下划线开头


### 安装使用

> 一键安装

```shell
curl -o ak-install.sh https://raw.githubusercontent.com/comeonjy/ak/main/install.sh && bash ak-install.sh && rm -f ak-install.sh
```

> 手动安装

```shell
tar -xvf ak.tar.gz /usr/local/
export AK_ROOT=/usr/local/ak
export PATH=$PATH:$AK_ROOT
```


> Debug

```shell
export AK_ROOT=$(PWD)
export PATH=$PATH:$AK_ROOT
```


### TODO
- [ ] 支持安装指定版本ak
- [ ] 支持卸载ak
- [ ] 支持多版本go共存安装
- [ ] 支持安装指定版本go