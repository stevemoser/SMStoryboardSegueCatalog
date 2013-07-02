//
//  SMFlipFromRight.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 7/1/13.
//
//

#import "SMFlipFromRight.h"

#import <QuartzCore/QuartzCore.h>

@interface SMFlipFromRight () {
    BOOL unwinding;
}
@end

@implementation SMFlipFromRight

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

- (void)perform {
    UINavigationController *navigationController = [self.sourceViewController navigationController];
    
    if (unwinding){
        
        [UIView
         transitionWithView:navigationController.view
         duration:.35
         options:UIViewAnimationOptionTransitionFlipFromLeft
         animations:^{
             [navigationController
              popViewControllerAnimated:NO];
         }
         completion:nil];
        
    } else {
        
        [UIView
         transitionWithView:navigationController.view
         duration:.35
         options:UIViewAnimationOptionTransitionFlipFromRight
         animations:^{
             [navigationController
              pushViewController:self.destinationViewController
              animated:NO];
         }
         completion:nil];
        
    }
    
}
@end
