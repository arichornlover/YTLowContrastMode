#import "Tweak.h"

%hook YTColorPalette
- (UIColor *)textPrimary { 
    return [UIColor colorWithWhite:0.565 alpha:1];
}
- (UIColor *)textSecondary { 
    return [UIColor colorWithWhite:0.565 alpha:1]; 
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary { 
    return [UIColor colorWithWhite:0.565 alpha:1];
}
- (UIColor *)textSecondary { 
    return [UIColor colorWithWhite:0.565 alpha:1]; 
}
%end

%hook UIColor
+ (UIColor *)whiteColor {
    return [UIColor colorWithWhite:0.565 alpha:1];
}
+ (UIColor *)lightText {
    return [UIColor colorWithWhite:0.565 alpha:1];
}
%end
%end
