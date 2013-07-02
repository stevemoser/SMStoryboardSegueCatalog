//
//  SMFadeSegue.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 6/30/13.
//
//

#import "SMFadeSegue.h"

#import <QuartzCore/QuartzCore.h>

@interface SMFadeSegue () {
    BOOL unwinding;
}
@end

@implementation SMFadeSegue

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
    
            
    CATransition* transition = [CATransition animation];
    transition.duration = 0.7;
    transition.type = kCATransitionFade;
    
    [navigationController.view.layer
     addAnimation:transition forKey:kCATransition];
    
    if (unwinding){
        [navigationController
         popViewControllerAnimated:NO];
    } else {
        [navigationController
         pushViewController:self.destinationViewController animated:NO];
    }

}

@end
