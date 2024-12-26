TARGET := iphone:clang:15.2:15.2


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = testtweak

$(TWEAK_NAME)_FRAMEWORKS = AudioToolbox

testtweak_FILES = Tweak.x
testtweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += mediahardwareprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
