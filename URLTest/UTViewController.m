//
//  UTViewController.m
//  URLTest
//
//  Created by Lane A. Phillips on 12/6/13.
//  Copyright (c) 2013 Milk LLC. All rights reserved.
//

#import "UTViewController.h"

@interface UTViewController ()
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlText;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation UTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.urlText.text = @"http://user:password@host.com:80/path0/path1/file.ext?parm0=val0&parm1=val1#fragment";
    [self parseURL:self.urlText.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self parseURL:textField.text];
    return NO;
}

- (void)parseURL:(NSString*)surl
{
    NSURL* url = [NSURL URLWithString:surl];
    
    NSMutableString* s = [[NSMutableString alloc] init];
    
    [s appendFormat:@"absoluteString: %@\n", url.absoluteString];
    [s appendFormat:@"absoluteURL: %@\n", url.absoluteURL];
    [s appendFormat:@"baseURL: %@\n", url.baseURL];
    [s appendFormat:@"fileSystemRepresentation: %s\n", url.fileSystemRepresentation];
    [s appendFormat:@"fragment: %@\n", url.fragment];
    [s appendFormat:@"host: %@\n", url.host];
    [s appendFormat:@"lastPathComponent: %@\n", url.lastPathComponent];
    [s appendFormat:@"parameterString: %@\n", url.parameterString];
    [s appendFormat:@"password: %@\n", url.password];
    [s appendFormat:@"path: %@\n", url.path];
    [s appendFormat:@"pathComponents: %@\n", url.pathComponents];
    [s appendFormat:@"pathExtension: %@\n", url.pathExtension];
    [s appendFormat:@"port: %@\n", url.port];
    [s appendFormat:@"query: %@\n", url.query];
    [s appendFormat:@"relativePath: %@\n", url.relativePath];
    [s appendFormat:@"relativeString: %@\n", url.relativeString];
    [s appendFormat:@"resourceSpecifier: %@\n", url.resourceSpecifier];
    [s appendFormat:@"scheme: %@\n", url.scheme];
    [s appendFormat:@"standardizedURL: %@\n", url.standardizedURL];
    [s appendFormat:@"user: %@\n", url.user];
    
    self.urlLabel.text = s;
}

@end
