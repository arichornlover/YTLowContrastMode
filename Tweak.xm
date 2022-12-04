#import "Tweak.h"

// Low Contrast Mode v1.1.0
%hook UIColor // Changes the whiteColor Method to be YouTube's old ui and also effects Icons & Text under Videos, Comment Section & Shorts caused by whiteColor (Deprecated by YouTube as of v17.40.5-Newer)
+ (UIColor *)whiteColor { // Deprecated by YouTube
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
%end

%hook YTColorPalette // Changes Texts & Icons in YouTube Bottom Bar + Text Icons under Video Player
- (UIColor *)textPrimary {
    if (self.pageStyle == 1) {
        return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00]; // Dark Mode
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00]; // Light Mode
}
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00];
}
%end

%hook YTCommonColorPalette // Changes Texts & Icons in YouTube Bottom Bar (Doesn't change Texts & Icons under the video player)
- (UIColor *)textPrimary {
    if (self.pageStyle == 1) {
        return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00];
}
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00];
}
%end

// Additional LowContrastMode Code
%hook UIView // changes some of the texts around the YouTube App.
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
%end

%hook UIInterface // this is only used if YouTube uses these methods in the future.
- (UIColor *)labelColor {
         return [UIColor whiteColor];
}	 
- (UIColor *)secondaryLabelColor {
         return [UIColor whiteColor];
}	 
- (UIColor *)tertiaryLabelColor {
         return [UIColor whiteColor];
}	
- (UIColor *)quaternaryLabelColor {
         return [UIColor whiteColor];
}	 
%end

%hook ELMView // Changes the Texts in the Sub Menu
- (void)didMoveToWindow {
    %orig;
    if (isDarkMode()) {
        self.subviews[0].tintColor = [UIColor whiteColor];
    }
}
%end

%hook ASWAppSwitchingSheetFooterView
- (void)setBackgroundColor:(UIColor *)color {
    if (isDarkMode()) {
        return %orig(raisedColor);
    }
        return %orig;
}
%end

%hook ASWAppSwitcherCollectionViewCell
- (void)didMoveToWindow {
    %orig;
    if (isDarkMode()) { 
        self.tintColor = whiteColor;
        self.subviews[1].tintColor = whiteColor;
        self.superview.tintColor = whiteColor;
    }
}
%end

%hook YTBackstageCreateRepostDetailView
- (void)setTintColor:(UIColor *)color {
    if (isDarkMode()) {
        return %orig([UIColor whiteColor]);
    }
        return %orig;
}
%end

%hook YTFormattedStringLabel
- (void)setTintColor:(UIColor *)color {
    if (isDarkMode()) {
        return %orig([UIColor whiteColor]);
    }
        return %orig;
}
%end

%hook SponsorBlockViewController
- (void)viewDidLoad {
    if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        %orig;
        self.view.tintColor = [UIColor whiteColor];
    } else { return %orig; }
}
%end

%hook MBProgressHUD // changes texts and buttons exclusively on the iSponsorBlock Tweak.
- (UIColor *)contentColor {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if (isDarkMode()) {
        if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.comment.guidelines_text"]) { self.superview.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.comment.channel_guidelines_bottom_sheet_container"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.comment.channel_guidelines_entry_banner_container"]) { self.tintColor = [UIColor whiteColor]; }
    }
}
%end
