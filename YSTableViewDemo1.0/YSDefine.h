//
//  YSDefine.h
//  YSTableViewDemo1.0
//
//  Created by YS on 15/12/14.
//  Copyright © 2015年 YS. All rights reserved.
//

#ifndef YSDefine_h
#define YSDefine_h


#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#endif /* YSDefine_h */
