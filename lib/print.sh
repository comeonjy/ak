#!/bin/bash

# echo -e "\033[30m 黑色字 \033[0m"
# echo -e "\033[31m 红色字 \033[0m"
# echo -e "\033[32m 绿色字 \033[0m"
# echo -e "\033[33m 黄色字 \033[0m"
# echo -e "\033[34m 蓝色字 \033[0m"
# echo -e "\033[35m 紫色字 \033[0m"
# echo -e "\033[36m 天蓝字 \033[0m"
# echo -e "\033[37m 白色字 \033[0m"

# 黑色字

function pBlack() {
    echo -e "\033[30m$1\033[0m"
}

# 红色字
function pRed() {
    echo -e "\033[31m$1\033[0m"
}

# 绿色字
function pGreen() {
    echo -e "\033[32m$1\033[0m"
}

# 黄色字
function pYellow() {
    echo -e "\033[33m$1\033[0m"
}

# 蓝色字
function pBlue() {
    echo -e "\033[34m$1\033[0m"
}

# 紫色字
function pPurple() {
    echo -e "\033[35m$1\033[0m"
}

# 天蓝字
function pSkyBlue() {
    echo -e "\033[36m$1\033[0m"
}

# 白色字
function pWhite() {
    echo -e "\033[37m$1\033[0m"
}
