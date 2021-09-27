#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-ARMv8.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.10.2/10.10.10.10/g' package/base-files/files/bin/config_generate

# Hostname
sed -i 's/OpenWrt/qnmlgb/g' package/base-files/files/bin/config_generate

# Timezone
#sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# cpufreq
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
sed -i 's/services/system/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# Change default theme
sed -i 's#luci-theme-bootstrap#luci-theme-opentomcat#g' feeds/luci/collections/luci/Makefile
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

#echo '    git clone jd_openwrt_script'
git clone https://github.com/ITdesk01/jd_openwrt_script.git package/jd_openwrt_script

# Add additional packages
git clone https://github.com/fw876/helloworld.git package/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config


#svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/openwrt-passwall
#svn co https://github.com/fw876/helloworld/trunk package/openwrt-ssrplus
