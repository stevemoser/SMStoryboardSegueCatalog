//
//  SMCubeFromRight.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 7/1/13.
//
//

#import "SMCubeFromRight.h"

#import <QuartzCore/QuartzCore.h>

@interface SMCubeFromRight () {
    BOOL unwinding;
}
@end

@implementation SMCubeFromRight

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
        transition.type = @"cube";
        transition.subtype = kCATransitionFromLeft;
        
        [navigationController.view.layer
         addAnimation:transition forKey:kCATransition];
        
        [navigationController
         popViewControllerAnimated:NO];
    } else {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.35;
        transition.type = @"cube";
        transition.subtype = kCATransitionFromRight;
        
        [navigationController.view.layer
         addAnimation:transition forKey:kCATransition];
        
        [navigationController
         pushViewController:self.destinationViewController animated:NO];
    }
}

@end
