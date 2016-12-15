//
//  ECAlertSheetAction.h
//  Pods
//
//  Created by 微知 on 2016/12/15.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ECAlertSheetActionStyle) {
    ECAlertSheetActionStyleDefault = 0,  // 默认
    ECAlertSheetActionStyleCancel,       // 取消
    ECAlertSheetActionStyleDestructive   // 毁灭性
};

@interface ECAlertSheetAction : NSObject

/** 标题 */
@property (nullable, nonatomic, readonly) NSString *title;

/** 样式 */
@property (nonatomic, assign, readonly) ECAlertSheetActionStyle style;

/** 动作 */
@property (nonatomic, strong) void (^action)(ECAlertSheetAction *action);

/**
 快速创建一个动作
 
 @param title 标题
 @param style 样式
 @param handler 回调
 @return 对象
 */
+ (instancetype)actionWithTitle:(nullable NSString *)title style:(ECAlertSheetActionStyle)style handler:(void (^ __nullable)(ECAlertSheetAction *action))handler;

NS_ASSUME_NONNULL_END

@end
