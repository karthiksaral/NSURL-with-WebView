//
//  ViewController.m
//  NSURL
//
//  Created by Admin on 7/18/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)butClr:(id)sender {
//    _txtView.text=@"";
    self.txtView.text=@"";
    
}
- (IBAction)butFet:(id)sender {
    [self.butfetch setEnabled:NO];
    [self.actView startAnimating];
    reqst=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"]];
    con=[NSURLConnection connectionWithRequest:reqst delegate:self];
    if(con)
    {
        buff=[NSMutableData data];
    }
    else
    {
        _txtView.text=@"The connection failed";
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
        NSString *jsonString = [[NSJSONSerialization JSONObjectWithData:buff options:0 error:nil] description];
    _txtView.text=jsonString;
    [_actView stopAnimating];
     [self.butfetch setEnabled:YES];
    con=nil;
    buff=nil;
    
   
    
     }

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    con=nil;
    buff=nil;
    _txtView.text = [error localizedDescription];
    NSLog(@"Connection failed! Error - %@ %@",    
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [buff setLength:0];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [buff appendData:data];
}
@end
