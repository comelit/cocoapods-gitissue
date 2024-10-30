//
//  CMGScanner.mm
//  GitPods
//
//  Created by Andrea Busi on 30/11/2024.
//

#import "CMGScanner.h"

#import <scan/cppscanner.h>


@interface CMGScanner () {
    ComelitCppScanner *scanner;
}
@end

@implementation CMGScanner

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        scanner = new ComelitCppScanner();
    }
    
    return self;
}

- (void)dealloc
{
    delete scanner;
    scanner = nullptr;
}

- (void)startScan
{
    // nope here
}

@end