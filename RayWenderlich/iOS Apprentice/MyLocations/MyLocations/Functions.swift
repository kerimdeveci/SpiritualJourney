//
//  Functions.swift
//  MyLocations
//
//  Created by Enrica on 2018/9/5.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation


/// 全局常量，用于寻找CoreData数据存放的目录
let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}()

/// GCD定时函数。并且，它是一个自由函数，不是任何实例方法，这意味着可以在代码的任何地方调用它
///
/// - Parameters:
///   - seconds: 延迟执行的时间
///   - run: 一个闭包函数，其参数类型为: () -> Void，即参数列表和返回值都是空的
func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}

/// CoreData保存失败的错误名称
let CoreDataSaveFailedNotification = Notification.Name("CoreDataSaveFailedNotification")

/// 用于处理CoreData崩溃错误
func fatalCoreDataError(_ error: Error) {
    
    // 打印错误消息
    print("*** FatalError: \(error)")
    
    // 利用通知中心发布一条名叫CoreDataSaveFailedNotification的错误通知
    NotificationCenter.default.post(name: CoreDataSaveFailedNotification, object: nil)
}
