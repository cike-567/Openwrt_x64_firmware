#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

#  修改拉取的 smartdns 源代码版本。
sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=07c13827bb523519a638214ed7ad76180f71a40a/" feeds/packages/net/smartdns/Makefile

#  建立 2333 目录用于存放杂项。
mkdir 2333

#  将工作目录从 Openwrt 源代码目录切换到 2333 目录。
cd 2333

#  拉取 luci-app-smartdns 的源码。
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git

#  将工作目录从 2333 目录切换到 Openwrt 源代码目录。
cd ..

#  删除自带的 luci-app-smartdns 的源码
rm -rf feeds/luci/applications/luci-app-smartdns/*
