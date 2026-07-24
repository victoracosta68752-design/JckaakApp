ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
THEOS_DEVICE_IP =
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = JckaakApp
JckaakApp_FILES = tweak.mm
JckaakApp_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk
