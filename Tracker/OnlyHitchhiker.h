//
//  OnlyHitchhiker.h
//  TrackerHitchhiker
//
//  Created by Albert Pascual on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import "TrackingManager.h"
#import "MapViewController.h"

@interface OnlyHitchhiker : UIViewController

@property (nonatomic, strong) TrackingManager *trackingManager; 
@property (nonatomic, strong) IBOutlet UITextField *whereText;

@end
