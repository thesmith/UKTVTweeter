#import "ChannelChooser.h"
#import "Tweeter.h"
#import "Channel.h"
#import <QuartzCore/QuartzCore.h>

@implementation ChannelChooser

- (IBAction) channelButtonPressed:(id)sender {
	NSString *channel = [sender titleForState:UIControlStateNormal];
	NSString *channelTitle = [[NSString alloc] initWithFormat:@"%@", channel];
	
	Tweeter *tweeter = [[Tweeter alloc] initWithNibName:@"Tweeter" bundle:nil];
	tweeter.channel = [[Channel alloc] initFromKey:channelTitle];
	[self.navigationController pushViewController:tweeter animated:YES];
	
	[tweeter release];
	[channelTitle release];
}

- (void)viewDidLoad {
[super viewDidLoad];
	float x = 8.0;
	float y = 8.0;
	
	for (Channel *channel in [Channel channels]) {
		UIButton *button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
		button.frame = CGRectMake(x, y, 88.0, 65.0);
		button.backgroundColor = [UIColor clearColor];
		
		[button setTitle:channel.key forState:UIControlStateNormal];
		[button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal ];
		[button setTitleColor:[UIColor clearColor] forState:UIControlStateHighlighted ];
		button.layer.cornerRadius = 8.0;
		button.layer.masksToBounds = YES;
		button.layer.borderWidth = 1.0;
		
		CAGradientLayer *gradient = [CAGradientLayer layer];
		gradient.frame = button.bounds;
		gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor clearColor] CGColor], (id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
		[button.layer insertSublayer:gradient atIndex:1];
		
		UIImage *buttonImageNormal = [UIImage imageNamed:channel.logo];
		UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
		
		[button setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
		[button addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:button];
		
		x+= 108.0;
		if (x > 324.0) {
			x = 8.0;
			y+= 86.0;
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
