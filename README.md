## VoiceOverBug

**Issue**: TableView UI in a weird state when VoiceOver is enabled.

**Description**: When a table view has a very long cell (greater than device height), VoiceOver scrolls result in a state where the cell is not visible at all.

**Steps to reproduce**

The following steps were performed on a iPhone X, iOS 13.2

1. Run the application and observe that there is one cell with a red background color in a table view which has a green background color
![Screenshot before bug is observed](https://github.com/advantej/VoiceOverBug/blob/master/VoiceOverBug/Bug%20Screenshots/Screen%20Shot%202020-04-20%20at%2012.00.40%20PM.png)

2. Turn on voice over

3. With the accessibility focus on the cell, swipe left. The cell disappears from the view hierarchy. (Red view is gone.) Confirm this in the view hierarchy debugger.
![Screenshot when the bug is observed](https://github.com/advantej/VoiceOverBug/blob/master/VoiceOverBug/Bug%20Screenshots/Screen%20Shot%202020-04-20%20at%2012.01.16%20PM.png)

4. Sometimes a combination of left/right swipes are needed to reproduce the issue.

When the issue is observed, the following assertion is seen in the debugger:

```
2020-04-20 12:00:48.490943-0700 VoiceOverBug[1959:1403324] [AXCommon] *** Assertion failure in -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:], NSObjectAccessibility.m:8722: We should always have been able to find the index of the child[<UITableView: 0x103858600; frame = (0 44; 375 734); clipsToBounds = YES; autoresize = RM+BM; gestureRecognizers = <NSArray: 0x283ae1620>; layer = <CALayer: 0x28349dae0>; contentOffset: {0, -993}; contentSize: {375, 1350}; adjustedContentInset: {0, 0, 0, 0}; dataSource: <VoiceOverBug.ViewController: 0x102c0b990>>] element if we had one to begin with <VoiceOverBug.MyTableViewCell: 0x102b112c0; baseClass = UITableViewCell; frame = (0 0; 375 1350); clipsToBounds = YES; hidden = YES; autoresize = W; layer = <CALayer: 0x2834b2b80>>
```
