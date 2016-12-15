//
//  ECAlertSheet.h
//  Pods
//
//  Created by 微知 on 2016/12/15.
//
//

#import <UIKit/UIKit.h>
#import "ECAlertSheetAction.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ECAlertSheetStyle) {
    ECAlertSheetStyleActionSheet = 0, // modal
    ECAlertSheetStyleAlert            // show in window center
};

@interface ECAlertSheet : UIView

/** 标题 */
@property (nullable, nonatomic, readonly) NSString *title;

/** 子标题 */
@property (nullable, nonatomic, readonly) NSString *message;

/** 展示方式 */
@property (nonatomic, assign, readonly) ECAlertSheetStyle preferredStyle;

/** 动作组 */
@property (nonatomic, readonly, strong) NSArray<ECAlertSheetAction *> *actions;

/**
 显示alertView
 
 @param title title
 @param message subTitle
 @param preferredStyle JQAlertViewStyle
 @param titles action title, is string
 @param destructiveTitle destructive action, such as delete
 @param cancelTitle cacel action
 @param handler 回调 index说明:视图显示后,从上往下的index依次为0,1,2,3...; 即:`otherTitles`数组的index, destructiveTitle, cancelTitle
 */
+ (void)showAlertViewWithTitle:(nullable NSString *)title
                       message:(nullable NSString *)message
                preferredStyle:(ECAlertSheetStyle)preferredStyle
                        titles:(nullable NSArray <NSString *>*)titles // index: [0 ... titles.count-1]
              destructiveTitle:(nullable NSString *)destructiveTitle // index == titles.count
                   cancelTitle:(nullable NSString *)cancelTitle // if destructiveTitle != nil or @"" index is `titles.count+1`, else index is `titles.count`
                       handler:(void (^ __nullable)(ECAlertSheet *alertView, NSInteger index))handler;
/** 从底部弹出 */
+ (void)showActionSheetWithTitle:(nullable NSString *)title
                         message:(nullable NSString *)message
                          titles:(nullable NSArray <NSString *>*)titles
                destructiveTitle:(nullable NSString *)destructiveTitle
                     cancelTitle:(nullable NSString *)cancelTitle
                         handler:(void (^ __nullable)(ECAlertSheet *alertView, NSInteger index))handler;

/**
 创建一个弹框
 
 @param title 标题
 @param message 子标题
 @param preferredStyle 样式
 @return 对象
 */
+ (instancetype)alertViewWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                    preferredStyle:(ECAlertSheetStyle)preferredStyle;

- (void)addActions:(NSArray <ECAlertSheetAction *>*)actions;

- (void)show;

NS_ASSUME_NONNULL_END

@end
