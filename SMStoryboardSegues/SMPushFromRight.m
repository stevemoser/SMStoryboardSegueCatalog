//
//  SMPushFromRight.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 6/30/13.
//
//

#import "SMPushFromRight.h"

#import <QuartzCore/QuartzCore.h>

@interface SMPushFromRight () {
    BOOL unwinding;
}
@end

@implementation SMPushFromRight

- (void) setUnwinding:(BOOL)isUnwinding
{
    unwinding = isUnwinding;
}

- (id) initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    if (self = [super initWithIdentifier:identifier source:source destination:destination]){
        unwinding = NO;
    }
    
    return self;
}

- (void)perform
{
    UINavigationController *navigationController = [self.sourceViewController navigationController];
    
    if (unwinding){
        CATransition* transition = [CATransition animation];
        transition.duration = 0.35;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        
        [navigationController.view.layer
         addAnimation:transition forKey:kCATransition];
        
        [navigationController
         popViewControllerAnimated:NO];
    } else {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.35;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        
        [navigationController.view.layer
         addAnimation:transition forKey:kCATransition];
        
        [navigationController
         pushViewController:self.destinationViewController animated:NO];
    }
}
@end
