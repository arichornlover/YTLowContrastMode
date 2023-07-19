#import "Tweak.h"

%hook YTSettingsViewController
- (void)setSectionItems:(NSMutableArray <YTSettingsSectionItem *> *)sectionItems forCategory:(NSInteger)category title:(NSString *)title titleDescription:(NSString *)titleDescription headerHidden:(BOOL)headerHidden {
    if (category == 1) {
        YTSettingsSectionItem *lowContrastMode = [[YTSettingsSectionItem alloc] initWithTitle:@"Low Contrast Mode"
                                                                             titleDescription:@"Enable to make the app easier on the eyes. App restart is required."];
        lowContrastMode.hasSwitch = YES;
        lowContrastMode.switchVisible = YES;
        lowContrastMode.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"low_contrast_mode"];
        lowContrastMode.switchBlock = ^BOOL (YTSettingsCell *cell, BOOL enabled) {
            [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:@"low_contrast_mode"];
            return YES;
        };
        [sectionItems addObject:lowContrastMode];
    }
    %orig(sectionItems, category, title, titleDescription, headerHidden);
}
%end

%group gLowContrastMode // Low Contrast Mode v1.3.1
%hook UIColor
+ (UIColor *)whiteColor { // Dark Theme Color
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
%end
%hook UILabel
+ (void)load {
    @autoreleasepool {
        [[UILabel appearance] setTextColor:[UIColor whiteColor]];
    }
}
%end
%hook YTCommonColorPalette
- (UIColor *)textPrimary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00]; // Light Theme
}
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00]; // Light Theme
}
%end
%hook YTCollectionView
 - (void)setTintColor:(UIColor *)color { 
     return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end
%hook LOTAnimationView
- (void) setTintColor:(UIColor *)tintColor {
    tintColor = [UIColor whiteColor];
    %orig(tintColor);
}
%end
%hook ASTextNode
- (NSAttributedString *)attributedString {
    NSAttributedString *originalAttributedString = %orig;
    NSMutableAttributedString *newAttributedString = [originalAttributedString mutableCopy];
    [newAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, newAttributedString.length)];
    return newAttributedString;
}
%end
%hook ASTextFieldNode
- (void)setTextColor:(UIColor *)textColor {
   %orig([UIColor whiteColor]);
}
%end
%hook ASTextView
- (void)setTextColor:(UIColor *)textColor {
   %orig([UIColor whiteColor]);
}
%end
%hook ASButtonNode
- (void)setTextColor:(UIColor *)textColor {
   %orig([UIColor whiteColor]);
}
%end
%hook UIButton 
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    %log;
    color = [UIColor whiteColor];
    %orig(color, state);
}
%end
%hook UIBarButtonItem
- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state {
    NSMutableDictionary *modifiedAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
    [modifiedAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    %orig(modifiedAttributes, state);
}
%end
%hook UILabel
- (void)setTextColor:(UIColor *)textColor {
    %log;
    textColor = [UIColor whiteColor];
    %orig(textColor);
}
%end
%hook UITextField
- (void)setTextColor:(UIColor *)textColor {
    %log;
    textColor = [UIColor whiteColor];
    %orig(textColor);
}
%end
%hook UITextView
- (void)setTextColor:(UIColor *)textColor {
    %log;
    textColor = [UIColor whiteColor];
    %orig(textColor);
}
%end
%hook UISearchBar
- (void)setTextColor:(UIColor *)textColor {
    textColor = [UIColor whiteColor];
    %orig(textColor);
}
%end
%hook UISegmentedControl
- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state {
    NSMutableDictionary *modifiedAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
    [modifiedAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    %orig(modifiedAttributes, state);
}
%end
%hook VideoTitleLabel
- (void)setTextColor:(UIColor *)textColor {
    textColor = [UIColor whiteColor];
    %orig(textColor);
}
%end
/*
%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    UILabel *label = [self findLabelInSubviews:self.subviews];
    if (label) {
        [self customizeLabel:label];
    }
}
- (UILabel *)findLabelInSubviews:(NSArray *)subviews {
    for (UIView *subview in subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            return (UILabel *)subview;
        }
        UILabel *label = [self findLabelInSubviews:subview.subviews];
        if (label) {
            return label;
        }
    }
    return nil;
}
- (void)customizeLabel:(UILabel *)label {
    label.textColor = [UIColor whiteColor];
}
%end
*/
%end

%ctor {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"low_contrast_mode"]) {
        %init(gLowContrastMode);
    }
}
