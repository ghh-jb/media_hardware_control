#import <Foundation/Foundation.h>
#import "MHCRootListController.h"

@implementation MHCRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
