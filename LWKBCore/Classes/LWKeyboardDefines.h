//
//  LWWordEngineDefines.h

#ifndef LWKeyboardDefines____FILEEXTENSION___
#define LWKeyboardDefines____FILEEXTENSION___

#import <UIKit/UIKit.h>

//键盘类型
typedef NS_OPTIONS(NSUInteger, KeyboardType) {
    //常规键盘
    Keyboard_PingYingFull = 1,              //拼音全键
    Keyboard_WuBiFull = 1 << 1,             //全键盘五笔
    Keyboard_ENFull = 1 << 2,               //英文全键
    Keyboard_NumNine = 1 << 3,           //数字九键
    Keyboard_PingYingNine = 1 << 4,     //拼音九键
    Keyboard_BiHuaNine = 1 << 5,        //笔画九键
    Keyboard_SymbolCollection = 1 << 6,   //符号方键
    Keyboard_SymbolFull = 1 << 7,        //符号全键
    Keyboard_HandWritting = 1 << 8,        //手写键盘

    //特定键盘
};

#define Key_Handwritting_Language @"Key_Handwritting_Language"

#define Key_TopSpeed_Input @"Key_TopSpeed_Input"


#endif

