//
//  SHKFBStreamDialog.m
//  RIL
//
//  Created by Nathan Weiner on 7/26/10.
//  Copyright 2010 Idea Shower, LLC. All rights reserved.
//
//
//
//
//  Edited and Converted to ARC by Yasin Yalcinkaya Appril 1, 2013
//
#import "SHKFBStreamDialog.h"
#import "SHK.h"

@implementation SHKFBStreamDialog

@synthesize defaultStatus;

- (void)webViewDidFinishLoad:(UIWebView *)webView 
{
	[super webViewDidFinishLoad:webView];
	
	if (defaultStatus)
	{
		// Set the pre-filled status message
		[_webView stringByEvaluatingJavaScriptFromString:
		 [NSString stringWithFormat:@"document.getElementsByName('feedform_user_message')[0].value = decodeURIComponent('%@')",
		  [SHKEncode(defaultStatus) stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"]
		 ]
		];
		
		// Make the text field bigger
		[_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('feedform_user_message')[0].style.height='100px'"];
	}
}

@end
