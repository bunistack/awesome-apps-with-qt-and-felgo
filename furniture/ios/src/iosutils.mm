#include "iosutils.h"

#import <UIKit/UIKit.h>

IOSUtils::IOSUtils(QObject *parent) : QObject(parent)
{

}

int IOSUtils::statusBarHeight()
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}
