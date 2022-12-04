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

%hook UIView // changes some of the texts around the YouTube App.
- (UIColor *)tintColor {
         return [UIColor.whiteColor];
}
%end

%hook UIInterface // this is only used if YouTube uses these methods in the future.
- (UIColor *)labelColor {
         return [UIColor.whiteColor];
}	 
- (UIColor *)secondaryLabelColor {
         return [UIColor.whiteColor];
}	 
- (UIColor *)tertiaryLabelColor {
         return [UIColor.whiteColor];
}	
- (UIColor *)quaternaryLabelColor {
         return [UIColor.whiteColor];
}	 
%end

%hook ELMView // Changes the Texts in the Sub Menu
- (void)didMoveToWindow {
    %orig;
    if (isDarkMode()) {
        self.subviews[0].tintColor = [UIColor.whiteColor];
    }
}
%end

%hook YTBackstageCreateRepostDetailView
- (void)setTintColor:(UIColor *)color {
    if (isDarkMode()) {
        return %orig([UIColor.whiteColor]);
    }
        return %orig;
}
%end

%hook MBProgressHUD // changes texts and buttons exclusively on the iSponsorBlock Tweak.
- (UIColor *)contentColor {
         return [UIColor.whiteColor];
}
%end
