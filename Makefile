TARGET := iphone:clang:latest:12.1.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LowContrastMode

LowContrastMode_FILES = Tweak.xm
LowContrastMode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
