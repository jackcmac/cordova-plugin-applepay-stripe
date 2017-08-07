#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

#import <PassKit/PassKit.h>

#import "ApplePayViewController.h"
#import "MyPluginLayer.h"
#import "MyPluginScrollView.h"

typedef void (^ARAuthorizationBlock)(PKPaymentAuthorizationStatus);

@interface CDVApplePay : CDVPlugin <PKPaymentAuthorizationViewControllerDelegate>
{
    PKMerchantCapability merchantCapabilities;
    NSArray<NSString *>* supportedPaymentNetworks;
}

@property (nonatomic, strong) ApplePayViewController* payCtrl;
@property (nonatomic, strong) ARAuthorizationBlock paymentAuthorizationBlock;
@property (nonatomic) MyPluginScrollView *pluginScrollView;
@property (nonatomic) MyPluginLayer *pluginLayer;

@property (nonatomic, strong) NSString* paymentCallbackId;

- (void)makePaymentRequest:(CDVInvokedUrlCommand*)command;
- (void)canMakePayments:(CDVInvokedUrlCommand*)command;
- (void)completeLastTransaction:(CDVInvokedUrlCommand*)command;
- (void)setDiv:(CDVInvokedUrlCommand *)command;


@end
