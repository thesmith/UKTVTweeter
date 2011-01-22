#import "Tweeter.h"
#import "Programme.h"
#import "AtlasScheduleDelegate.h"
#import "AtlasScheduleClient.h"
#import "Channel.h"
#import "JSON/JSON.h"
#import <QuartzCore/QuartzCore.h>

@implementation Tweeter
@synthesize textArea, channel, indicator;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	textArea.layer.cornerRadius = 8;
	textArea.clipsToBounds = YES;
	
	self.title = @"Tweet";
	[indicator startAnimating];
	
	scheduleClient = [[AtlasScheduleClient alloc] initWithChannel:channel andDelegate:self];
}

- (void)programmeCurrentlyOn:(Programme *)programme {
	bitlyClient = [[BitlyClient alloc] initWithProgramme:programme andDelegate:self];
}

- (void)programmeWithShortenedUrl:(Programme *)programme {
	[indicator removeFromSuperview];
	indicator = nil;
	textArea.text = [NSString stringWithFormat:@"I'm watching %@ on %@ - %@", programme.title, channel.title, programme.shortenedUrl];
}

- (void)scheduleRequestError:(NSString *)error {
	[indicator removeFromSuperview];
	indicator = nil;
	textArea.text = [NSString stringWithString:error];
}

- (void)bitlyRequestError:(NSString *)error {
	[indicator removeFromSuperview];
	indicator = nil;
	textArea.text = [NSString stringWithString:error];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.textArea = nil;
	self.channel = nil;
	self.indicator = nil;
}


- (void)dealloc {
	[channel release];
	[textArea release];
	[indicator release];
    [super dealloc];
}

@end
