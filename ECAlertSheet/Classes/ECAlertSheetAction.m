//
//  ECAlertSheetAction.m
//  Pods
//
//  Created by 微知 on 2016/12/15.
//
//

#import "ECAlertSheetAction.h"

@interface ECAlertSheetAction ()

@property (nonatomic, strong) NSString *actionTitle;
@property (nonatomic, assign) ECAlertSheetActionStyle actionStyle;

@end

@implementation ECAlertSheetAction

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(ECAlertSheetActionStyle)style handler:(void (^ __nullable)(ECAlertSheetAction *action))handler
{
    ECAlertSheetAction *action = [ECAlertSheetAction new];
    action.actionTitle = title;
    action.actionStyle = style;
    action.action = handler;
    return action;
}

- (NSString *)title
{
    return self.actionTitle;
}

- (ECAlertSheetActionStyle)style
{
    return self.actionStyle;
}

@end
