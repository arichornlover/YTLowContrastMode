#import <UIKit/UIKit.h>
#import <rootless.h>

@interface YTSettingsCell : YTCollectionViewCell
@end

@interface YTSettingsSectionItem : NSObject
@property BOOL hasSwitch;
@property BOOL switchVisible;
@property BOOL on;
@property BOOL (^switchBlock)(YTSettingsCell *, BOOL);
@property int settingItemId;
- (instancetype)initWithTitle:(NSString *)title titleDescription:(NSString *)titleDescription;
@end

@interface _ASCollectionViewCell : UICollectionViewCell
- (id)node;
@end

@interface _ASDisplayView : UIView
- (UILabel *)findLabelInSubviews:(NSArray *)subviews;
- (void)customizeLabel:(UILabel *)label;
@end

@interface YTColorPalette : NSObject // YTColorPalette [YouTube v16.05.7-v16.46.5]
@property(readonly, nonatomic) long long pageStyle;
@end

@interface YTCommonColorPalette : NSObject // YTCommonColorPalette [17.01.4-latest]
@property(readonly, nonatomic) long long pageStyle;
@end
