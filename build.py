#! /usr/bin/env python
# -*- coding: utf-8 -*- 
#
# build.py
#
# Created by ruibin.chow on 2018/07/11.
# Copyright (c) 2018年 ruibin.chow All rights reserved.
# 

"""
根据.podspec构建
依赖pod package进行构建，若未安装package，请使用sudo gem install cocoapods-packager安装package
"""
import os

specslist = (
				"https://github.com/CocoaPods/Specs.git",
			)
usingSpec = True

# debug模式
debug = False

# 每次编译是否清除缓存
forceClean = True

# 生成.a静态，否则生成为framework
generateStaticLibrary = True

# 生成动态框架
generateDynamic = False

# 排除依赖
excludeDeps = True

# 生成嵌入式框架
embedded = False

# 不要破坏dependant pods的符号。
noMangle = False

# 仅包含给定的subspec
# subSpecs = "IM,Company"

# 包含Bundle标识
includeBundleIdentifier = False


def searchPodspecInCurrentDirectory():
    podfileName = None
    fileList = os.listdir("./")
    for file in fileList:
        if os.path.isfile(file) and os.path.splitext(file)[1] == ".podspec":
            podfileName = file
    return podfileName


def main():
    print u"\u001b[32m依赖pod package进行构建，若未安装package，请使用sudo gem install cocoapods-packager安装package"
    podfileName = searchPodspecInCurrentDirectory()
    if podfileName == None:
        print u"\u001b[31m未找到.podspec文件"
        return

    command = "pod package " + podfileName
    if debug:
        command = command + " --configuration=Debug"
    if forceClean:
        command = command + " --force"
    if generateStaticLibrary:
        command = command + " --library"
    if generateDynamic:
        command = command + " --dynamic"
    if usingSpec	:
        specs = ",".join(specslist)
        command = command + " --spec-sources=" + specs
    if excludeDeps:
        command = command + " --exclude-deps"
    if embedded:
        command = command + " --embedded"
    if noMangle:
        command = command + " --no-mangle"
    if "subSpecs" in globals().keys() and len(subSpecs) > 0:
        command = command + " --subspecs=" + subSpecs
    if includeBundleIdentifier:
        command = command + " --bundle-identifier"

    print u"\u001b[33m" + command
    os.system(command)
    pass



if __name__ == '__main__':
	main()
	pass





