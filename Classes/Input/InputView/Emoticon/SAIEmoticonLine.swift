//
//  SAIEmoticonLine.swift
//  SAC
//
//  Created by SAGESSE on 9/15/16.
//  Copyright © 2016-2017 SAGESSE. All rights reserved.
//

import UIKit

internal class SAIEmoticonLine {
    
    func draw(in ctx: CGContext) {
        _ = emoticons.reduce(CGRect(origin: vaildRect.origin, size: itemSize)) { 
            $1.draw(in: $0, in: ctx)
            return $0.offsetBy(dx: $0.width + minimumInteritemSpacing, dy: 0)
        }
    }
    func rect(at index: Int) -> CGRect? {
        guard index < emoticons.count else {
            return nil
        }
        let isp = minimumInteritemSpacing
        let nwidth = (itemSize.width + isp) * CGFloat(index)
        return CGRect(origin: CGPoint(x: vaildRect.minX + nwidth, y: vaildRect.minY), size: itemSize)
    }
    
    func addEmoticon(_ emoticon: SAIEmoticon) -> Bool {
        let isp = minimumInteritemSpacing
        let nwidth = visableSize.width + isp + itemSize.width
        let nwidthWithDelete = visableSize.width + (isp + itemSize.width) * 2
        let nheight = max(visableSize.height, itemSize.height)
        
        if floor(vaildRect.minX + nwidth) > floor(vaildRect.maxX) {
            return false
        }
        if itemType.isSmall && isLastLine && floor(vaildRect.minX + nwidthWithDelete) > floor(vaildRect.maxX) {
            return false
        }
        if floor(vaildRect.minY + nheight) > floor(vaildRect.maxY) {
            return false
        }
        if visableSize.height != nheight {
            _isLastLine = nil
        }
        
        visableSize.width = nwidth
        visableSize.height = nheight
        
        emoticons.append(emoticon)
        return true
    }
    
    var itemSize: CGSize
    
    var vaildRect: CGRect
    var visableSize: CGSize
    
    var itemType: SAIEmoticonType
    var isLastLine: Bool {
        if let isLastLine = _isLastLine {
            return isLastLine
        }
        let isLastLine = floor(vaildRect.minY + visableSize.height + minimumLineSpacing + itemSize.height) > floor(vaildRect.maxY)
        _isLastLine = isLastLine
        return isLastLine
    }
    
    var minimumLineSpacing: CGFloat
    var minimumInteritemSpacing: CGFloat
    
    var emoticons: [SAIEmoticon] 
    
    var _isLastLine: Bool?
    
    init(_ first: SAIEmoticon, 
         _ itemSize: CGSize,
         _ rect: CGRect, 
         _ lineSpacing: CGFloat,
         _ interitemSpacing: CGFloat,
         _ itemType: SAIEmoticonType) {
        
        self.itemSize = itemSize
        self.itemType = itemType
        
        self.vaildRect = rect
        self.visableSize = itemSize
        
        minimumLineSpacing = lineSpacing
        minimumInteritemSpacing = interitemSpacing
        
        emoticons = [first]
    }
}
