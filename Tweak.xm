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

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)sponsorBlockButton {
         return [UIColor whiteColor];
}
%end

%hook UIView // Changes some of the texts around the YouTube App.
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
%end

%hook UIInterface // Chanbes some of the texts that uses UIInterface in the YouTube App.
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

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if (isDarkMode()) {
        if ([self.nextResponder isKindOfClass:%c(ASScrollView)]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"eml.cvr"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"rich_header"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.ui.comment_cell"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.ui.cancel.button"]) { self.superview.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.comment.guidelines_text"]) { self.superview.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.comment.channel_guidelines_bottom_sheet_container"]) { self.tintColor = [UIColor whiteColor]; }
        if ([self.accessibilityIdentifier isEqualToString:@"id.comment.channel_guidelines_entry_banner_container"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
