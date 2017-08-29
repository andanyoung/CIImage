//
//  String.swift
//  healthy
//
//  Created by 安丹阳 on 2017/6/12.
//  Copyright © 2017年 massagechair. All rights reserved.
//

import Foundation

extension String {
    
    ///根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1)->String {
        var len = length
        if len == -1 {
            len = characters.count - start
        }
        let st = characters.index(startIndex, offsetBy:start)
        let en = characters.index(st, offsetBy:len)
        let range = st ..< en
        return substring(with:range)
    }
    
    //返回第一次出现的指定子字符串在此字符串中的索引
    func positionOf(sub:String)->Int {
        var pos = -1
        if let range = range(of:sub) {
            if !range.isEmpty {
                pos = characters.distance(from:startIndex, to:range.lowerBound)
            }
        }
        return pos
    }
    
    
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    ///替换
    func replacing(start:Int, length:Int = -1, string: String)-> String{
        
        var len = length
        if len == -1 {
            len = characters.count - start
        }
        let st = characters.index(startIndex, offsetBy:start)
        let en = characters.index(st, offsetBy:len)
        return replacingCharacters(in: st ..< en, with: string)
    }
    
    ///本地化
    var localized: String! {
        let localizedString = NSLocalizedString(self, comment: "")
        return localizedString
    }
}
