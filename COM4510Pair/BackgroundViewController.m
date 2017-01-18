//
//  BackgroundViewController.m
//  COM4510Pair
//
//  Created by aca13ytw on 18/11/2016.
//  Copyright © 2016 aca13ytw. All rights reserved.
//

#import "BackgroundViewController.h"
#import "AppDelegate.h"

@interface BackgroundViewController ()

@end

@implementation BackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // grab the original image
    UIImage *originalImage = [UIImage imageNamed:@"background image.png"];
    // scaling set to 2.0 makes the image 1/2 the size.
    UIImage *scaledImage = [UIImage imageWithCGImage:[originalImage CGImage]
                                                scale:(originalImage.scale * 2.0)
                                                orientation:(originalImage.imageOrientation)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage: scaledImage];
    
    
    //Add mute button
    self.muteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.muteButton addTarget:self action:@selector(muteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.muteButton setTitle:@"" forState:UIControlStateNormal];
    
    [self updateMuteButton];
    
    self.muteButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 75), 30, 45, 45);
    [[self view] addSubview:self.muteButton];
}

-(void)updateMuteButton {
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIImage* muteImage;
    
    if(appDelegate.playGameAudio) {
        muteImage = [UIImage imageNamed:@"button_mute.png"];
    } else {
        muteImage = [UIImage imageNamed:@"button_muted.png"];
    }
    
    [self.muteButton setBackgroundImage: muteImage forState:UIControlStateNormal];

}

-(void)muteButtonClicked:(UIButton*)sender {
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //Invert current value of if play audio
    appDelegate.playGameAudio = !appDelegate.playGameAudio;
    
    [self updateMuteButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
