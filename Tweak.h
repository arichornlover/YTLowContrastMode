#import <UIKit/UIKit.h>
#import "../YouTubeHeader/YTSettingsCell.h"
#import "../YouTubeHeader/YTSettingsSectionItem.h"
#import "../YouTubeHeader/YTSettingsSectionItemManager.h"
#import "../YouTubeHeader/YTSettingsViewController.h"
#import "../YouTubeHeader/YTPlayerViewController.h"

@interface YTColorPalette : NSObject // YTColorPalette is here to Support older YouTube Versions.
@property(readonly, nonatomic) long long pageStyle;
@end

@interface YTCommonColorPalette : NSObject // YTCommonColorPalette is here to Support modern YouTube Versions.
@property(readonly, nonatomic) long long pageStyle;
@end
