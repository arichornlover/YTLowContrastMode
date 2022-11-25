#import <UIKit/UIKit.h>

%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.48 green: 0.54 blue: 0.59 alpha: 1.00]; // Dim+Dark Mode Only
}
+ (UIColor *)lightText {
         return [UIColor colorWithRed: 0.48 green: 0.54 blue: 0.59 alpha: 1.00]; // Dim+Dark Mode Only
}
+ (UIColor *)darkText {
         return [UIColor colorWithRed: 0.51 green: 0.52 blue: 0.54 alpha: 1.00]; // Light Mode Only
}
+ (UIColor *)placeholderText {
         return [UIColor colorWithRed: 0.48 green: 0.54 blue: 0.59 alpha: 1.00]; // Dim+Dark Mode Only
}
%end
