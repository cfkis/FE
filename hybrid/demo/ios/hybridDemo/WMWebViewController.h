//
//  WMWebViewController.h
//  hybridDemo
//
//  Created by lvao on 2020/4/19.
//  Copyright © 2020 chifuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>


@interface WMWebViewController : UIViewController<NSURLConnectionDataDelegate,WKNavigationDelegate>
@property(nonatomic,strong) WKWebView *webView;
@property(nonatomic, strong) NSString *url;


-(instancetype) initWithUrl:(NSString *) url;
@end

