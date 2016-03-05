# DemoRoundedContentView
把 UITableView 的內容 ( View ) 做出圓角卡片的感覺

![Alt Text](https://github.com/ayo1103/DemoRoundedContentView/raw/master/demo_rounded_content.gif)


# 快速 Copy Paste
原理就是給 UITableView 一個 layer mask
重點在於圓角卡片的 Bounds 要用 contentSize 去計算

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

然後在適當的地方 call 這個 func 即可

```swift
override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    myTableView.makeContentRounded(radius: 5)
}
```
