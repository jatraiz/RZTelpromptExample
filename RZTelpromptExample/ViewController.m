//
//  ViewController.m
//  RZTelpromptExample
//
//  Created by John Stricker on 3/20/14.

#import "ViewController.h"
#import  "RZTelprompt.h"

@interface ViewController ()

- (IBAction)callWithTelPushed:(id)sender;
- (IBAction)callWithTelpromptPushed:(id)sender;
- (IBAction)callWithRZTelpromptPushed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Just a check to make sure this app is run on a device that can call phone numbers
    if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:0"]]){
        UIAlertView *uav = [[UIAlertView alloc] initWithTitle:@"This demo won't work on this device" message:@"These examples won't work because you are either running this program on the simulator or on a device that can not make phone calls." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [uav show];
    }
}

- (IBAction)callWithTelPushed:(id)sender
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.phoneNumberTextField.text]];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)callWithTelpromptPushed:(id)sender
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",self.phoneNumberTextField.text]];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)callWithRZTelpromptPushed:(id)sender
{
    [RZTelprompt callWithString:self.phoneNumberTextField.text];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // If the keyboard is visible, hide it when it is not touched
    if(self.phoneNumberTextField.isFirstResponder){
        [self.phoneNumberTextField resignFirstResponder];
    }
}
@end
