//
//  ViewController.swift
//  TestCornerTableView
//
//  Created by Bryan Lin on 3/4/16.
//  Copyright © 2016 ayo1103. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var myTableView: UITableView!

  var datas = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    myTableView.contentInset = UIEdgeInsets(top: 180, left: 0, bottom: 10, right: 0)

    (1...10).forEach {
      datas.append(String($0))
    }
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    myTableView.makeContentRounded(radius: 5)
  }

}

extension UITableView {

  func makeContentRounded(radius radius: CGFloat) {
    let contentBounds = CGRect(origin: CGPoint.zero, size: self.contentSize)
    let rectShape = CAShapeLayer()
    rectShape.bounds = contentBounds
    rectShape.position = CGPoint(x: CGRectGetMidX(contentBounds), y: CGRectGetMidY(contentBounds))
    rectShape.path = UIBezierPath(
      roundedRect: contentBounds,
      byRoundingCorners: UIRectCorner.AllCorners,
      cornerRadii: CGSize(width: radius, height: radius)
      ).CGPath

    self.layer.mask = rectShape
  }

}

extension ViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datas.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyCell
    cell.data = datas[indexPath.row]
    return cell
  }

}

class MyCell: UITableViewCell {

  @IBOutlet weak var myLabel: UILabel!

  var data: String! {
    didSet {
      myLabel.text = data
    }
  }
  
}