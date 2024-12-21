#import <AudioToolbox/AudioServices.h>
#import <MediaRemote/MediaRemote.h>

@interface SBMediaController : NSObject
+ (id)sharedInstance;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (void)setNowPlayingInfo:(id)arg1;
- (BOOL)changeTrack:(int)arg1 eventSource:(long long)arg2;
- (BOOL)togglePlayPauseForEventSource:(long long)arg1;
@end

@protocol SBButtonEventsHandler <NSObject>
@required
-(BOOL)handleHomeButtonDoublePress;
-(BOOL)handleHomeButtonLongPress;
-(BOOL)handleHeadsetButtonPress:(BOOL)arg1;
-(BOOL)handleVolumeDownButtonPress;
-(BOOL)handleLockButtonPress;
-(BOOL)handleHomeButtonPress;
-(BOOL)handleVoiceCommandButtonPress;
-(BOOL)handleVolumeUpButtonPress;
@end

@interface SBVolumeControl : NSObject
-(void)increaseVolume;
-(void)decreaseVolume;
-(float)volumeStepDown;
-(float)volumeStepUp;
@end

@interface _UIKeyboardFeedbackGenerator : UIFeedbackGenerator
@property (nonatomic, retain) UIImpactFeedbackGenerator *gen;
@end