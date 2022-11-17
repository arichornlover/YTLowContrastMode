#import "Tweak.h"

%hook YTCommonColorPalette
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

%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)lightText {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)darkText {
         return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00];
}
+ (UIColor *)placeholderText {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
%end

%hook YTColdConfig
+ (UIColor *)modernizeElementsTextColor {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)uiSystemsClientGlobalConfigEnableModernButtonsForNative {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)uiSystemsClientGlobalConfigEnableModernButtonsForNativeLongTail {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)uiSystemsClientGlobalConfigIosEnableModernTabsForNative {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)uiSystemsClientGlobalConfigModernizeNativeTextColor {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
%end
%end
