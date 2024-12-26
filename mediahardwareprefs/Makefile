TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = mediahardwareprefs

mediahardwareprefs_FILES = MHCRootListController.m
mediahardwareprefs_FRAMEWORKS = UIKit
mediahardwareprefs_PRIVATE_FRAMEWORKS = Preferences
mediahardwareprefs_INSTALL_PATH = /Library/PreferenceBundles
mediahardwareprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
