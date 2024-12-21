#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "testtweak.h"


%hook SpringBoard
-(_Bool)_handlePhysicalButtonEvent:(UIPressesEvent *)event {
	UIPress *volUp = nil;
	UIPress *volDown = nil;
	UIPress *shutdown = nil;

	for (UIPress *press in [[event allPresses] allObjects]) {
		NSLog(@"[PR] Type: %ld Force: %f", press.type, press.force);

		if (press.type == 102 && press.force == 1) { // volume up
			volUp = press;
		} else if (press.type == 103 && press.force == 1) { // volume down
			volDown = press;
		} else if (press.type == 104 && press.force == 1) {
			shutdown = press;
		}
	}

	if (volUp && volDown) {
		[[%c(SBMediaController) sharedInstance] togglePlayPauseForEventSource:0];
	} else if (shutdown && volDown) {
		[[%c(SBMediaController) sharedInstance] changeTrack:-1 eventSource:0];
		[[%c(SBVolumeControl) sharedInstance] volumeStepUp]; // so vol wont change

	} else if (shutdown && volUp) {
		[[%c(SBMediaController) sharedInstance] changeTrack:1 eventSource:0];
		[[%c(SBVolumeControl) sharedInstance] volumeStepDown]; // so vol wont change
	}

	return %orig;
}
%end

// %hook UIPress
// -(BOOL)isLongClick {
// 	AudioServicesPlaySystemSound(1521);
// 	return %orig;
// }
// %end

%hook _UIKeyboardFeedbackGenerator
%property (nonatomic, retain) UIImpactFeedbackGenerator *vibrate;

/*
+(BOOL)areKeyHapticsEnabled {
	NSLog(@"[PR] areKeyhapticsEnabled");
	return true;
}

-(BOOL)usesKeyHaptics {
	NSLog(@"[PR] UsesKeyHaptics");
	return true;
}
*/



-(void)_playFeedbackForActionType:(long long)arg1 withCustomization:(id)arg2 {
	%orig;
	if (!self.vibrate) {
			self.vibrate = [[UIImpactFeedbackGenerator alloc] init]; // prevent vibrate to be allocated every time you press a button
	}
	[self.vibrate prepare];
	self.vibrate = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
	[self.vibrate impactOccurred];

}

%end
