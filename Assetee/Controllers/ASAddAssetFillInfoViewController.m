//
//  ASAddAssetFillInfoViewController.m
//  Assetee
//
//  Created by Wu Di on 12/5/14.
//  Copyright (c) 2014 吴迪（子回）. All rights reserved.
//

#import "ASAddAssetFillInfoViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
#import "ASAssetManager.h"
#import <UIKit/UIKit.h>

@interface ASAddAssetFillInfoViewController ()
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *nameInput;
@property (nonatomic) UIView *overlayView;
@property (nonatomic) UIActivityIndicatorView *activityIndicator;

@end

@implementation ASAddAssetFillInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNameInput];
}

- (void)setupNameInput {
    self.nameInput.floatingLabelTextColor = [UIColor blackColor];
    self.nameInput.floatingLabelYPadding = -2.0;
    [self.nameInput setPlaceholder:@"资产名称"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Views
- (void)addOverlayView {
    self.overlayView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.overlayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.center = self.overlayView.center;
    [self.overlayView addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    [self.navigationController.view addSubview:self.overlayView];
}

- (void)removeOverlayView {
    [self.overlayView removeFromSuperview];
}

- (void)showAlertWithMessage:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Assetee" message:message delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil];
    [alert show];
}

#pragma mark - View events

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    ASAssetManager *assetManager = [ASAssetManager sharedManager];
    [self addOverlayView];
    [self.view endEditing:YES];
    [assetManager createAssetWithName:self.nameInput.text barCodeId:self.barCodeId snapshotImage:self.snapshotImage complete:^(BOOL succeeded, NSError *error) {
        NSLog(@"OK");
        if (error) {
            [self showAlertWithMessage:@"由于未知原因，资产入库失败，请重试或者联系管理员"];
        }
        else {
            [self showAlertWithMessage:@"资产入库成功"];
        }
        [self removeOverlayView];
        [self cancel:self];
    }];
}


@end
