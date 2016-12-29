//
//  joinViewController.h
//  chamber_of_commerce
//
//  Created by Ankur Kumawat on 30/04/16.
//  Copyright (c) 2016 Ankur Kumawat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DLRadioButton/DLRadioButton.h>

@interface joinViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,NSURLConnectionDataDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table_3;
@property (weak, nonatomic) IBOutlet UITableView *table_2;
- (IBAction)tx2:(id)sender;
- (IBAction)tx3:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *table3;
@property (weak, nonatomic) IBOutlet UIView *table2;
- (IBAction)tx_picker_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *tx_picker_outlet;
@property (weak, nonatomic) IBOutlet UITableView *table4;
@property (weak, nonatomic) IBOutlet UIButton *tx4;
- (IBAction)tx_4:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *pickerarray;
@property (nonatomic, strong) NSArray *anualarray;
@property (nonatomic, strong) NSArray *paymentarray;
@property (nonatomic, strong) NSArray *closelyarray;
@property (weak, nonatomic) IBOutlet UITextField *city;

@property (strong, nonatomic) IBOutlet UITextField *txpicker;
@property (strong, nonatomic) IBOutlet UITextField *txanualpicker;
@property (strong, nonatomic) IBOutlet UITextField *txpaymentpicker;
@property (strong, nonatomic) IBOutlet UITextField *txcloselypicker;

@property (strong, nonatomic) IBOutlet UIPickerView *anualpicker;
@property (strong, nonatomic) IBOutlet UIPickerView *paymentpicker;
@property (strong, nonatomic) IBOutlet UIPickerView *closelypicker;

@property (strong, nonatomic) IBOutlet UITextField *txcompany_name;
@property (strong, nonatomic) IBOutlet UITextField *txattn;
@property (strong, nonatomic) IBOutlet UITextField *txaddress;
@property (strong, nonatomic) IBOutlet UITextField *txcity;
@property (strong, nonatomic) IBOutlet UITextField *txstate;
@property (strong, nonatomic) IBOutlet UITextField *txzip;
@property (strong, nonatomic) IBOutlet UITextField *txbusiness_phone;
@property (strong, nonatomic) IBOutlet UITextField *txwebsite;
@property (strong, nonatomic) IBOutlet UITextField *txemail;
@property (strong, nonatomic) IBOutlet UITextField *txcontacts;

@property (strong, nonatomic) IBOutlet UITextField *tx_membe_name;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_address;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_city;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_state;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_zip;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_homephone;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_website;
@property (strong, nonatomic) IBOutlet UITextField *tx_member_email;

@property (strong, nonatomic) IBOutlet UITextField *tx_place_of_emp;
@property (strong, nonatomic) IBOutlet UITextField *tx_placeofemp_city;
@property (strong, nonatomic) IBOutlet UITextField *tx_placeofemp_state;
@property (strong, nonatomic) IBOutlet UITextField *tx_placeofemp_zip;

@property (strong, nonatomic) IBOutlet UITextField *tx_receive_info_email;
@property (strong, nonatomic) IBOutlet UITextField *tx_receive_info_fax;
@property (strong, nonatomic) IBOutlet UITextField *tx_receive_info_usemail;
@property (strong, nonatomic) IBOutlet UITextField *tx_receive_info_chech_enclosed;

@property (strong, nonatomic) IBOutlet UITextField *tx_describe_bsns;


@property (weak, nonatomic) IBOutlet UITextField *tx_describe_bsn;

- (IBAction)submit_btn:(id)sender;
@end
