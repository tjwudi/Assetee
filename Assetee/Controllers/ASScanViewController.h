//
//  ASScanViewController.h
//  Assetee
//
//  Created by Wu Di on 12/5/14.
//  Copyright (c) 2014 吴迪（子回）. All rights reserved.
//

#import "ASBaseViewController.h"

@interface ASScanViewController : ASBaseViewController {
    UIImage *_snapshot;
}

-(void) setupScanner;
- (void) didDetectedBarCodeWithId:(NSString*)barCodeId;

@end
