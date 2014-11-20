//
//  ViewController.m
//  GPAiOS
//
//  Created by Matthew Chupp on 11/18/14.
//  Copyright (c) 2014 MattChupp. All rights reserved.
//

#import "ViewController.h"
#import "gradeConverter.h"
#import "gpaClass.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define myAlertViewsTag 0

@interface ViewController ()

// outlets for buttons
@property (strong, nonatomic) IBOutlet UIButton *calcButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

// message label
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;


// course 1
@property (strong, nonatomic) IBOutlet UITextField *c1NameTF;
@property (strong, nonatomic) IBOutlet UITextField *c1GradeTF;
@property (strong, nonatomic) IBOutlet UITextField *c1HoursTF;

// course 2
@property (strong, nonatomic) IBOutlet UITextField *c2NameTF;
@property (strong, nonatomic) IBOutlet UITextField *c2GradeTF;
@property (strong, nonatomic) IBOutlet UITextField *c2HoursTF;

// course 3
@property (strong, nonatomic) IBOutlet UITextField *c3NameTF;
@property (strong, nonatomic) IBOutlet UITextField *c3GradeTF;
@property (strong, nonatomic) IBOutlet UITextField *c3HoursTF;

// course 4
@property (strong, nonatomic) IBOutlet UITextField *c4NameTF;
@property (strong, nonatomic) IBOutlet UITextField *c4GradeTF;
@property (strong, nonatomic) IBOutlet UITextField *c4HoursTF;

// course 5
@property (strong, nonatomic) IBOutlet UITextField *c5NameTF;
@property (strong, nonatomic) IBOutlet UITextField *c5GradeTF;
@property (strong, nonatomic) IBOutlet UITextField *c5HoursTF;

// course 5
@property (strong, nonatomic) IBOutlet UITextField *c6NameTF;
@property (strong, nonatomic) IBOutlet UITextField *c6GradeTF;
@property (strong, nonatomic) IBOutlet UITextField *c6HoursTF;

// output GPA
@property (strong, nonatomic) IBOutlet UITextField *gpaOutputTF;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // background color
    self.view.backgroundColor = UIColorFromRGB(0xB2F0F1);
    
    // edit buttons
    _calcButton.backgroundColor = UIColorFromRGB(0x6eee68);
    [_calcButton setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    _calcButton.layer.cornerRadius = 6; // rounded
    _calcButton.layer.borderWidth = 1; // border
    _calcButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    _clearButton.backgroundColor = UIColorFromRGB(0xe74c46);
    [_clearButton setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    _clearButton.layer.cornerRadius = 6; // rounded corner
    _clearButton.layer.borderWidth = 1; // border
    _clearButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    // output text for GPA
    _gpaOutputTF.backgroundColor = UIColorFromRGB(0xB2F0F1);
    _gpaOutputTF.layer.cornerRadius = 6;
    _gpaOutputTF.layer.borderWidth = 1;
    _gpaOutputTF.layer.borderColor = [UIColor blackColor].CGColor;
    
    // font size for output Textfield
    _gpaOutputTF.font = [UIFont systemFontOfSize:60.0f];
    
    _gpaOutputTF.enabled = NO; // diable so there is no editing

    
    
    // align all text in textfields to be in the center
    
    [_c1NameTF setTextAlignment:NSTextAlignmentCenter];
    [_c2NameTF setTextAlignment:NSTextAlignmentCenter];
    [_c3NameTF setTextAlignment:NSTextAlignmentCenter];
    [_c4NameTF setTextAlignment:NSTextAlignmentCenter];
    [_c5NameTF setTextAlignment:NSTextAlignmentCenter];
    [_c6NameTF setTextAlignment:NSTextAlignmentCenter];
    
    [_c1GradeTF setTextAlignment:NSTextAlignmentCenter];
    [_c2GradeTF setTextAlignment:NSTextAlignmentCenter];
    [_c3GradeTF setTextAlignment:NSTextAlignmentCenter];
    [_c4GradeTF setTextAlignment:NSTextAlignmentCenter];
    [_c5GradeTF setTextAlignment:NSTextAlignmentCenter];
    [_c6GradeTF setTextAlignment:NSTextAlignmentCenter];
    
    [_c1HoursTF setTextAlignment:NSTextAlignmentCenter];
    [_c2HoursTF setTextAlignment:NSTextAlignmentCenter];
    [_c3HoursTF setTextAlignment:NSTextAlignmentCenter];
    [_c4HoursTF setTextAlignment:NSTextAlignmentCenter];
    [_c5HoursTF setTextAlignment:NSTextAlignmentCenter];
    [_c6HoursTF setTextAlignment:NSTextAlignmentCenter];
    
    [_gpaOutputTF setTextAlignment:NSTextAlignmentCenter];
    
    // default text for GPA
    _gpaOutputTF.text = @"0.00";
    
    // default for message label
    _messageLabel.text = @"";
    _messageLabel.font = [UIFont systemFontOfSize:30.0f];
    [_messageLabel setTextAlignment:NSTextAlignmentCenter];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// *************************
// Calculate button pressed
// *************************
- (IBAction)calculateButtonPressed:(id)sender {
    

    
    if (_c1HoursTF.text.length == 0 &&
        _c2HoursTF.text.length == 0 &&
        _c3HoursTF.text.length == 0 &&
        _c4HoursTF.text.length == 0 &&
        _c5HoursTF.text.length == 0 &&
        _c6HoursTF.text.length == 0 &&
        
        _c1GradeTF.text.length == 0 &&
        _c2GradeTF.text.length == 0 &&
        _c3GradeTF.text.length == 0 &&
        _c4GradeTF.text.length == 0 &&
        _c5GradeTF.text.length == 0 &&
        _c6GradeTF.text.length == 0 &&
        
        _c1NameTF.text.length == 0 &&
        _c2NameTF.text.length == 0 &&
        _c3NameTF.text.length == 0 &&
        _c4NameTF.text.length == 0 &&
        _c5NameTF.text.length == 0 &&
        _c6NameTF.text.length == 0
        
        ){
        
            _gpaOutputTF.text = @"0.00";

        }
   
    else{
    
        _calcButton.enabled = YES; // enable button
        
    // get grades from textfield and store to var
    NSString* c1GradeNSString = _c1GradeTF.text;
    NSString* c2GradeNSString = _c2GradeTF.text;
    NSString* c3GradeNSString = _c3GradeTF.text;
    NSString* c4GradeNSString = _c4GradeTF.text;
    NSString* c5GradeNSString = _c5GradeTF.text;
    NSString* c6GradeNSString = _c6GradeTF.text;
    
    
    // instance of gradeConverter to get grades from
    // letters to being on a 4.0 scale
    gradeConverter* gradePoints = [[gradeConverter alloc] init];
    
    
    // change grades from letter to 4.0 scale with gradeConverter class
    double c1gradePoints = [gradePoints gp: c1GradeNSString];
    double c2gradePoints = [gradePoints gp: c2GradeNSString];
    double c3gradePoints = [gradePoints gp: c3GradeNSString];
    double c4gradePoints = [gradePoints gp: c4GradeNSString];
    double c5gradePoints = [gradePoints gp: c5GradeNSString];
    double c6gradePoints = [gradePoints gp: c6GradeNSString];
    
    
    // get text fields for hours and parse to doubles
    double c1HoursDouble = _c1HoursTF.text.doubleValue;
    double c2HoursDouble = _c2HoursTF.text.doubleValue;
    double c3HoursDouble = _c3HoursTF.text.doubleValue;
    double c4HoursDouble = _c4HoursTF.text.doubleValue;
    double c5HoursDouble = _c5HoursTF.text.doubleValue;
    double c6HoursDouble = _c6HoursTF.text.doubleValue;
    
    
    // instance of gpaCalc
    // takes the credit hours and the gradePoints per course
    // and finds the number of gradepoints
    
    gpaCalc* gpaCalcPerClass = [[gpaCalc alloc] init];
    
    double c1GPA = [gpaCalcPerClass gpaByClass:c1gradePoints hours:c1HoursDouble];
    double c2GPA = [gpaCalcPerClass gpaByClass:c2gradePoints hours:c2HoursDouble];
    double c3GPA = [gpaCalcPerClass gpaByClass:c3gradePoints hours:c3HoursDouble];
    double c4GPA = [gpaCalcPerClass gpaByClass:c4gradePoints hours:c4HoursDouble];
    double c5GPA = [gpaCalcPerClass gpaByClass:c5gradePoints hours:c5HoursDouble];
    double c6GPA = [gpaCalcPerClass gpaByClass:c6gradePoints hours:c6HoursDouble];
    
    
    // get the gpa
    double totalGradePoints = c1GPA + c2GPA + c3GPA + c4GPA + c5GPA + c6GPA;
    double totalCreditHours = c1HoursDouble + c2HoursDouble + c3HoursDouble + c4HoursDouble + c5HoursDouble + c6HoursDouble;
    double totalGPA = totalGradePoints / totalCreditHours;
    
    NSString* totalGPANSString = [[NSString alloc] initWithFormat:@"%.2f", totalGPA];
    
    // change text color of output based on GPA
    // if > 3.00 (GOOD GPA) -> text color GREEN
    // if < 3.00 && > 2.00 (ALRIGHT) -> text color YELLOW
    // if < 2.00 (NEED WORK) -> text color RED
    // else -> set default text to black
    if (totalGPA >= 3.00) {
        _gpaOutputTF.textColor = UIColorFromRGB(0x27ce2a);
        _messageLabel.textColor = UIColorFromRGB(0x27ce2a);
        _messageLabel.text = @"Great Job!";
    }
    else if (totalGPA < 3.00 && totalGPA >= 2.00){
        _gpaOutputTF.textColor = UIColorFromRGB(0xd5c530);
        _messageLabel.textColor = UIColorFromRGB(0xd5c530);
        _messageLabel.text = @"Keep It Up!";
    }
    else if (totalGPA < 2.00){
        _gpaOutputTF.textColor = UIColorFromRGB(0xe74c46);
        _messageLabel.textColor = UIColorFromRGB(0xe74c46);
        _messageLabel.text = @"Slacker!";
    }
    else{
        _gpaOutputTF.textColor = UIColorFromRGB(0x00000);
    }

    _gpaOutputTF.text = totalGPANSString;
    
    }// end else
    
}
    



// *************************
// Clear button pressed
// *************************
- (IBAction)clearButtonPressed:(id)sender {
    
   
    _c1HoursTF.text = @"";
    _c2HoursTF.text = @"";
    _c3HoursTF.text = @"";
    _c4HoursTF.text = @"";
    _c5HoursTF.text = @"";
    _c6HoursTF.text = @"";
    
    _c1GradeTF.text = @"";
    _c2GradeTF.text = @"";
    _c3GradeTF.text = @"";
    _c4GradeTF.text = @"";
    _c5GradeTF.text = @"";
    _c6GradeTF.text = @"";
    
    _c1NameTF.text = @"";
    _c2NameTF.text = @"";
    _c3NameTF.text = @"";
    _c4NameTF.text = @"";
    _c5NameTF.text = @"";
    _c6NameTF.text = @"";

    _gpaOutputTF.text = @"0.00";
    
    _gpaOutputTF.textColor = UIColorFromRGB(0x00000);

    _messageLabel.text = @"";

    

}

@end



