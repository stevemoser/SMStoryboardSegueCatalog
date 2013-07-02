//
//  SMCurlDownSegue.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 6/30/13.
//
//

#import "SMCurlDownSegue.h"

#import <QuartzCore/QuartzCore.h>

@interface SMCurlDownSegue () {
    BOOL unwinding;
}

@end

@implementation SMCurlDownSegue

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
         duration:.70
         options:UIViewAnimationOptionTransitionCurlUp
         animations:^{
             [navigationController
              popViewControllerAnimated:NO];
         }
         completion:nil];

    } else {
        
        [UIView
         transitionWithView:navigationController.view
         duration:.70
         options:UIViewAnimationOptionTransitionCurlDown
         animations:^{
             [navigationController
              pushViewController:self.destinationViewController
              animated:NO];
         }
         completion:nil];

    }
    
}

@end
