//
//  SMUnwindSegueNavigationController.m
//  SMStoryboardSegueCatalog
//
//  Created by Steve Moser on 6/30/13.
//
//

#import "SMUnwindSegueNavigationController.h"

#import "SMUnwindSegueProtocol.h"

@interface SMUnwindSegueNavigationController ()

@end

@implementation SMUnwindSegueNavigationController

- (UIStoryboardSegue *) segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
    if ([identifier isEqualToString:@""]) {
        return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
    }
    UIStoryboardSegue <SMUnwindSegue> *Unwindsegue = [[NSClassFromString(identifier) alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    Unwindsegue.unwinding = YES;
    return Unwindsegue;
}

@end
