#import <Cordova/CDV.h>
#import <CDVApplePay.h>
#import <UIKit/UIKit.h>
#import "PluginUtil.h"

@interface ApplePayViewController : UIViewController<ApplePayViewDelegate>

@property (nonatomic, strong) ApplePayView* payView;
@property (nonatomic, strong) UIView* webView;
@property (nonatomic, strong) NSMutableDictionary* overlayManager;
@property (nonatomic, readwrite, strong) NSMutableDictionary* plugins;
@property (nonatomic) BOOL isFullScreen;
@property (nonatomic) NSDictionary *embedRect;
@property (nonatomic) CGRect screenSize;
@property (nonatomic) BOOL debuggable;

- (id)initWithOptions:(NSDictionary *) options;
- (void)updatePayViewLayout;
@end
