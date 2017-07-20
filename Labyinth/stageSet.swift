//
//  stageSet.swift
//  Labyinth
//
//  Created by 陳信毅 on 2017/7/21.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
import UIKit

private let app = UIApplication.shared.delegate as! AppDelegate


func switchStage(view:UIView) {
    // 清除元素陣列
    let refreshSecond = 0.1
    clearStageElement()
    
    // 建構關卡元素陣列
    switch app.stageName{
    case "stage1_1": stage1_1(view: view)
    case "stage1_2": stage1_2(view: view)
    default:
        chapter1(view: view)
    }
    
    // 記錄app.ball的起始點
    app.ball.start = app.ball.frame.origin
    
    
    // 畫面元素
    showStageElement(view: view)
    
    // 開始循環偵測
    app.refreshTimer = Timer.scheduledTimer(withTimeInterval: refreshSecond, repeats: true, block: {
        (timer) in
        //加上引力
        app.gravity!.gravityDirection = CGVector(dx: 2 * app.accelerometerX, dy: 2 * app.accelerometerY)

    })
    // 加入球
    app.gravity!.addItem(app.ball)
    app.collision!.addItem(app.ball)
}
// 切換關卡
func clearStageElement() {
//    app.ball = nil
    app.walls  = []
    app.holes  = []
    app.goals  = []
    app.stages = []
}

func showStageElement(view:UIView) {
    // 畫球
    view.addSubview(app.ball)
    // 畫牆
    for i in 0..<app.walls.count {
        let wall = UIView(frame: app.walls[i])
        wall.backgroundColor = UIColor.blue
        view.addSubview(wall)
        app.collision!.addBoundary(withIdentifier: "wall\(i)" as NSCopying,
                                   for: UIBezierPath(rect: wall.frame))
    }
    // 畫洞
    for i in 0..<app.holes.count {
        let hole = HoleView(frame: app.holes[i])
        print("W:\(hole.frame.width) H:\(hole.frame.height)")
        view.addSubview(hole)
    }
    // 畫目標
    for i in 0..<app.goals.count {
        let goal = GoalView(frame: app.goals[i])
        view.addSubview(goal)
    }
    // 畫關卡
    for i in 0..<app.stages.count {
        let stage = UIImageView(frame: app.stages[i].frame)
        stage.image = app.stages[i].image
        view.addSubview(stage)
    }
    
}



