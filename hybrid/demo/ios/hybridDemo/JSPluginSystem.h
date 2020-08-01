//
//  JSPluginSystem.h
//  hybridDemo
//
//  Created by lvao on 2020/4/19.
//  Copyright © 2020 chifuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JSPluginSystem : UIViewController
-(void) dealWithJSAPI:(NSURL *)url webview:(WKWebView *)webview;
@property(nonatomic,strong) WKWebView *webView;
@end

NS_ASSUME_NONNULL_END
