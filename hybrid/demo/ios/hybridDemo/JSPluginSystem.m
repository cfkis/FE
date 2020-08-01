//
//  JSPluginSystem.m
//  hybridDemo
//
//  Created by lvao on 2020/4/19.
//  Copyright © 2020 chifuk. All rights reserved.
//

#import "JSPluginSystem.h"
#import "Util.h"
#import "WMWebViewController.h"

@implementation JSPluginSystem

-(void) dealWithJSAPI:(NSURL *)url webview:(WKWebView *)webview{
    NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
    NSArray *urlComponents = [[url query] componentsSeparatedByString:@"&"];
    
    // 把url里面的cmd取出
    NSString *cmd = [NSString stringWithFormat:@"%@:",url.host];
    
    NSLog(@"cmd:%@", cmd);
    
    for (NSString *keyValuePair in urlComponents)
    {
        NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
        NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];
        
        [queryStringDictionary setObject:value forKey:key];
    }
    // {c:xxx}
    NSString *encodeStr = [queryStringDictionary objectForKey:@"c"];
    
    if (encodeStr) {
        NSLog(@"c:%@",[encodeStr stringByRemovingPercentEncoding]);
        NSDictionary *dic = [Util dictionaryWithJsonString:[encodeStr stringByRemovingPercentEncoding]];
        NSLog(@"c1:%@",dic);
        // 外面传的webview进行赋值
        self.webView = webview;
        
        // 找到cmd所要执行的方法并且调用它
        SEL sel = NSSelectorFromString(cmd);
        if([self respondsToSelector:sel]) {

            [self performSelector:sel withObject:dic];
        }
        
        
    }
}


-(void) showToast:(NSDictionary*) dic {
    NSString *title = [dic objectForKey:@"title"];
    NSString *msg = [dic objectForKey:@"msg"];
    NSLog(@"showToast:%@", msg);
    
    NSString *callback = dic[@"callbackFuncname"];
    NSLog(@"callback js: %@", [NSString stringWithFormat:@"window.%@(111)", callback] );
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"window.%@(111)", callback] completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"value: %@ error: %@", response, error);
    }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];
    UIViewController *topRootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [topRootViewController presentViewController:alert animated:true completion:nil];
}

-(void) openUrl:(NSDictionary*) dic {
    
    // 那到要打开的url
    NSString *url = [dic objectForKey:@"url"];
    
    // 创建一个webview并且打开它
    WMWebViewController *vc = [[WMWebViewController alloc] initWithUrl:url];
    
    // 得到js需要callback的方法名
    NSString *callback = dic[@"callbackFuncName"];
    
    // 执行callback
    // window.CALLBACK0(110);
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"window.%@(110);",callback] completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        NSLog(@"value: %@ error: %@", response, error);
    }];
    
    [[Util getCurrentVC].navigationController pushViewController:vc animated:true];
    

    
}
-(void) goBack:(NSDictionary*) dic {
//    NSString *url = [dic objectForKey:@"url"];
    
    [[Util getCurrentVC].navigationController popViewControllerAnimated:YES];

    
}
@end
