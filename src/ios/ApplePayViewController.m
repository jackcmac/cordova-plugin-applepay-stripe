
#import "ApplePayViewController.h"
#if CORDOVA_VERSION_MIN_REQUIRED < __CORDOVA_4_0_0
#import <Cordova/CDVJSON.h>
#endif


@implementation ApplePayViewController
NSDictionary *initOptions;

- (id)initWithOptions:(NSDictionary *) options {
    self = [super init];
    initOptions = [[NSDictionary alloc] initWithDictionary:options];
    self.plugins = [NSMutableDictionary dictionary];
    self.isFullScreen = NO;
    self.embedRect = nil;
    self.screenSize = [[UIScreen mainScreen] bounds];

    return self;
}

- (void)loadView {
  [super loadView];
  [self updatePayViewLayout];
}
- (void)updatePayViewLayout {
  
  if (self.isFullScreen == NO) {
    [self.view setFrameWithDictionary:self.embedRect];
  }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[NSArray arrayWithObjects:[NSNumber numberWithInt:128],
                                                            [NSNumber numberWithInt:128],
                                                            [NSNumber numberWithInt:128],
                                                            [NSNumber numberWithInt:128], nil] parsePluginColor];
  
    //------------
    // Initialize
    //------------
    self.overlayManager = [NSMutableDictionary dictionary];
  
    CGRect pluginRect = self.view.frame;
    int marginBottom = 0;
    CGRect payRect = CGRectMake(0, 0, pluginRect.size.width, pluginRect.size.height  - marginBottom);
    //NSLog(@"mapRect=%f,%f - %f,%f", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height);
    //NSLog(@"mapRect=%@", camera);
    self.payView = [ApplePayView mapWithFrame:payRect camera:camera];
    self.payView.delegate = self;
    //self.map.autoresizingMask = UIViewAutoresizingNone;
    self.payView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
    //indoor display
    self.payView.indoorDisplay.delegate = self;
  
  
    
    [self.view addSubview: self.pay];
}
