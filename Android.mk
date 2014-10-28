LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
COFFEE_PATH := $(LOCAL_PATH)

.phony: coffee-script
coffee-script:
	cd $(COFFEE_PATH); npm install --production; cd $(ANDROID_BUILD_TOP)
	mkdir -p $(TARGET_OUT)/usr/lib/node_modules/coffee-script
	rm -rf $(TARGET_OUT)/usr/lib/node_modules/coffee-script/*
	cp -rf $(COFFEE_PATH)/bin $(TARGET_OUT)/usr/lib/node_modules/coffee-script/
	cp -rf $(COFFEE_PATH)/lib $(TARGET_OUT)/usr/lib/node_modules/coffee-script/
	cp -rf $(COFFEE_PATH)/node_modules $(TARGET_OUT)/usr/lib/node_modules/coffee-script/
	mkdir -p $(TARGET_OUT)/bin
	rm -rf $(TARGET_OUT)/bin/coffee
	ln -sf ../usr/lib/node_modules/coffee-script/bin/coffee $(TARGET_OUT)/bin/coffee
	chmod a+x $(TARGET_OUT)/bin/coffee

ALL_MODULES += coffee-script
ALL_MODULES.coffee-script.INSTALLED := coffee-script
