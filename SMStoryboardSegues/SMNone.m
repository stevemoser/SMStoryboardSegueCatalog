//
//  SMNone.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 7/1/13.
//
//

#import "SMNone.h"

#import <QuartzCore/QuartzCore.h>

@interface SMNone () {
    BOOL unwinding;
}
@end

@implementation SMNone

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
         options:UIViewAnimationOptionTransitionNone
         animations:^{
             [navigationController
              popViewControllerAnimated:NO];
         }
         completion:nil];
        
    } else {
        
        [UIView
         transitionWithView:navigationController.view
         duration:.35
         options:UIViewAnimationOptionTransitionNone
         animations:^{
             [navigationController
              pushViewController:self.destinationViewController
              animated:NO];
         }
         completion:nil];
        
    }
    
}
@end