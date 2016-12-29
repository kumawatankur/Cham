//
//  creditcard_ViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 03/05/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
#import "PayPalConfiguration.h"
#import "PayPalPaymentViewController.h"

@interface creditcard_ViewController : UIViewController <PayPalPaymentDelegate, PayPalFuturePaymentDelegate, PayPalProfileSharingDelegate, UIPopoverControllerDelegate>

@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, assign, readwrite) BOOL acceptCreditCards;
@property(nonatomic, strong, readwrite) NSString *resultText;
@property (weak, nonatomic) IBOutlet UITextField *tx_payment;
@property (weak, nonatomic) IBOutlet UITextField *txemail;
@property (weak, nonatomic) IBOutlet UITextField *txdes;

- (IBAction)payment:(id)sender;

@end
