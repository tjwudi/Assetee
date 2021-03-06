//
//  RentItems.h
//  Assetee
//
//  Created by Wu Di on 12/5/14.
//  Copyright (c) 2014 吴迪（子回）. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@class AVObject;

typedef NS_ENUM(NSInteger, ASAssetState) {
    ASAssetStateRented,
    ASAssetStateNotRented,
    ASAssetStateNotFound
};

@interface ASAssetManager : NSObject

+ (instancetype) sharedManager;
- (void) fetchRentItemsWithComplete:(void(^)(NSArray *items))complete;
- (void) createAssetWithName:(NSString*)name barCodeId:(NSString*)barCodeId snapshotImage:(UIImage*)snapshotImage complete:(void(^)(BOOL succeeded, NSError *error))complete;
- (void) getAssetWithBarCodeId:(NSString*)barCodeId complete:(void(^)(ASAssetState state, AVObject *asset))complete;
@end
