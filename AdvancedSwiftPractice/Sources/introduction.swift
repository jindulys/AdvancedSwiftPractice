//
//  introduction.swift
//  AdvancedSwiftPractice
//
//  Created by yansong li on 2016-01-12.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
 *  Here I will list the questions I have.
 *  
 *  (1) what is selectors and runtime features of Objective-C
 *      After reading this http://blog.ibireme.com/2013/11/26/objective-c-messaging/, I knew
 *      about objective c class model, isa pointer, meta class, super class.
 *      objc 消息机制是运行时决定的。 [receiver message], 最终转化为 objc_msgSend(receiver, @selector(message)), 这个objc_msgSend 实现用了cache 方法查找，superclass 追溯。所谓的动态就是如果找一圈下来都没找到的话就会 forward 到其它机制，给你动态custom的切入口，最后都没有的话就crash。
 *  (2) The goal of swift is to write code that is readable at a glance.
 *
 */