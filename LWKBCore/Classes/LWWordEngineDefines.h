//
//  LWWordEngineDefines.h

#ifndef LWWordEngineDefines____FILEEXTENSION___
#define LWWordEngineDefines____FILEEXTENSION___

// const、static、extern
// const用来修饰右边的基本变量或指针变量
// int  const  *p   //  *p只读 ;p变量
// int  * const  p  // *p变量 ; p只读
// const  int   * const p //p和*p都只读
// int  const  * const  p   //p和*p都只读

// static修饰后此全局变量只能本文件访问
// static修饰全局变量: 使全局变量的作用域仅限于当前文件内部，即当前文件内部才能访问该全局变量。
// static修饰函数时，被修饰的函数被称为静态函数，使得外部文件无法访问这个函数，仅本文件可以访问。

// extern 声明外部全局变量
// extern NSString * const Key_Handwritting_Language;
// extern NSString * const Key_TopSpeed_Input;

#import <UIKit/UIKit.h>
#import "LWInstanceFactory.h"

//#import "LWWordsService.h"
//#import "LWBihuaService.h"
//#import "LWEnlishService.h"
//#import "LWHandwrittingService.h"
//#import "LWMarsService.h"
//#import "LWPinYinService.h"
//#import "LWPyService.h"
//#import "LWSymbolService.h"
//#import "LWWubiService.h"

//#define API_Handwritting_URLString @"http://www.yibizi.com/html5/hd8.php?key=qq576844233"
//#define API_Handwritting_URLString @"http://www.yibizi.com/html5/hd8.php"  //易笔字请求的url string
#define API_Handwritting_URLString @"https://hanzi.unihan.com.cn/api/qpen/res"  //书同文在线手写url string
#define Key_Handwritting_Language @"Key_Handwritting_Language"
#define Key_TopSpeed_Input @"Key_TopSpeed_Input"

#define EmojiAndSymbolURLString @"http://oss.wodedata.com/db/mykeyboard_emoji_symbols2"
#define EmojiAndSymbolFileName @"emoji_symbols"
#define TranditionalAndMarURLString @"http://oss.wodedata.com/db/mykeyboard_traditional_mars"
#define TranditionalAndMarsFileName @"traditional_mars"
#define ZidianURLString @"http://oss.wodedata.com/db/mykeyboard_zidian"
#define ZidianFileName @"mykeyboard_zidian"

#define PyCoreBundleURLString @"http://oss.wodedata.com/db/mykeyboard_pycore_bundle_zip"
#define PyCoreBundleDirName @"pycore.bundle"

#define PinYinURLString @"http://oss.wodedata.com/db/mykeyboard_pinyin"
#define PinYinFileName @"mykeyboard_pinyin"
#define BiHuaURLString @"http://oss.wodedata.com/db/mykeyboard_bhwords"
#define BiHuaFileName @"mykeyboard_bhwords"
#define EnwordsURLString @"http://oss.wodedata.com/db/mykeyboard_enwords"
#define EnwordsFileName @"mykeyboard_enwords"
#define WBwordsURLString @"http://oss.wodedata.com/db/mykeyboard_wbwords"
#define WBwordsFileName @"mykeyboard_wbwords"

#define Key_isPureWubi @"Key_isPureWubi"  //纯五笔开关，默认不是纯五笔


#endif

