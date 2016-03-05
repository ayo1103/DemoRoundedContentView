# DemoRoundedContentView
把 UITableView 的內容 ( View ) 做出圓角卡片的感覺

![Alt Text](https://github.com/ayo1103/DemoRoundedContentView/raw/master/demo_rounded_content.gif)


```swift
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
```
