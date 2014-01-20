//
//  TempViewController.m
//  TempConverter
//
//  Created by Michael Ellison on 1/19/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@property (strong, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (strong, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (strong, nonatomic) IBOutlet UILabel *fahrenheitLabel;
@property (strong, nonatomic) IBOutlet UILabel *celsiusLabel;

- (void)convertFahrenheitToCelsius;
- (void)convertCelsiusToFahrenheit;

@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fahrenheitTextField.delegate = self;
    [self.fahrenheitTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.celsiusTextField.delegate = self;
    [self.celsiusTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    textField.layer.masksToBounds = NO;
    textField.layer.borderColor = [[UIColor blueColor]CGColor];
    textField.layer.borderWidth = 1.0f;
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

    textField.layer.masksToBounds = NO;
    textField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    textField.layer.borderWidth = 1.0f;
    
    return YES;
}

#pragma mark - Private methods

- (void)convertFahrenheitToCelsius {
    float fahrenheitAmount = [self.fahrenheitTextField.text floatValue];
    float celsiusAmount = (fahrenheitAmount - 32.0) * (0.555);
    
    self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", celsiusAmount];
}

- (void)convertCelsiusToFahrenheit {
    float celsiusAmount = [self.celsiusTextField.text floatValue];
    float fahrenheitAmount = celsiusAmount * (1.8) + 32.0;

    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheitAmount];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField.tag == 0)
    {
        [self convertFahrenheitToCelsius];
    }
    else if (textField.tag == 1)
    {
        [self convertCelsiusToFahrenheit];
    }

}

@end
