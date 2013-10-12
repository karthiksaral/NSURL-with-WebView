//
//  ViewController.h
//  NSURL
//
//  Created by Admin on 7/18/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
NSURL *url;
NSURLRequest *reqst;
NSMutableData *buff;
NSURLConnection *con;
}
@property (weak, nonatomic) IBOutlet UIButton *butfetch;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actView;
@property (weak, nonatomic) IBOutlet UITextView *txtView;
- (IBAction)butFet:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *butclear;
- (IBAction)butClr:(id)sender;

@end
