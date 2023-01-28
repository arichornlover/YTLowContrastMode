TARGET := iphone:clang:16.2:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LowContrastMode

LowContrastMode_FILES = Tweak.xm
LowContrastMode_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
