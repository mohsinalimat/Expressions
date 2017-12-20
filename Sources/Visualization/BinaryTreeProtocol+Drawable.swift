//
//  BinaryTreeProtocol+Drawable.swift
//  Expression
//
//  Created by Michael Pangburn on 12/16/17.
//  Copyright © 2017 Michael Pangburn. All rights reserved.
//

import Foundation


extension PositionedBinaryTree: Drawable {
    func draw(into renderer: Renderer) {
        guard let attributes = visualAttributes else { return }
        let color = attributes.color
        let text = attributes.text
        let textAttributes = attributes.textAttributes

        // consider the node is centered at the origin, so..
        let actualCenter = CGPoint(x: NodeVisualAttributes.Default.size.width / 2, y: NodeVisualAttributes.Default.size.height / 2)
        renderer.circle(at: actualCenter, radius: NodeVisualAttributes.Default.size.width / 2)
        color.setStroke()
        color.setFill()
        renderer.fill()
        renderer.text(text, atCenter: actualCenter, attributes: textAttributes)
    }
}

public class BinaryTreeView: UIView {
    public func shrinkSubviews() {
        for view in subviews {
            UIView.animate(withDuration: 3) {
                view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }
        }
    }
}

public class DrawableView: UIView {

    var draw: (UIBezierPath) -> Void = { _ in }

    override public func draw(_ bounds: CGRect) {
        let path = UIBezierPath()
        draw(path)
    }
}

public func binaryTreeView(of tree: ArithmeticExpression<Int>) -> BinaryTreeView {
    let positionedTree = tree.positioned()
    let bounds = positionedTree.bounds()
    var nodeViews: [DrawableView] = []
    let lines: [LineView] = lineViews(of: positionedTree)

    let allNodes = [positionedTree] + recursiveChildren(of: positionedTree)
    for node in allNodes {
        let nodeView = binaryNodeView(of: node)
        nodeView.backgroundColor = .clear

        let cgPtPosition = node.cgPointPosition
        let actualX = cgPtPosition.x + NodeVisualAttributes.Default.size.width / 2 * NodeVisualAttributes.spacingScaleFactor.horizontal
        let actualY = cgPtPosition.y + NodeVisualAttributes.Default.size.height / 2 * NodeVisualAttributes.spacingScaleFactor.vertical
        let actualPos = CGPoint(x: actualX, y: actualY)

        nodeView.frame = CGRect(center: actualPos, size: nodeView.frame.size)
        nodeViews.append(nodeView)
    }

    let treeView = BinaryTreeView(frame: bounds)

    for lineView in lines {
        treeView.addSubview(lineView)
    }

    for nodeView in nodeViews {
        treeView.addSubview(nodeView)
    }

    return treeView
}

func binaryNodeView<T>(of positionedTree: PositionedBinaryTree<T>) -> DrawableView {
    let treeNodeView = DrawableView(frame: CGRect(origin: .zero, size: NodeVisualAttributes.Default.size))
    treeNodeView.draw = { positionedTree.draw(into: $0) }
    return treeNodeView
}

func recursiveChildren<T>(of positionedTree: PositionedBinaryTree<T>) -> [PositionedBinaryTree<T>] {
    var allChildren = positionedTree.children
    for child in positionedTree.children {
        allChildren += recursiveChildren(of: child)
    }
    return allChildren
}

//struct Line: Drawable {
//    let start: CGPoint
//    let end: CGPoint
//    let color: UIColor
//
//    func draw(into renderer: Renderer) {
//        renderer.move(to: start)
//        renderer.line(to: end)
//        renderer.setStroke(color: color)
//        renderer.stroke()
//    }
//}


public func lineViewsE(of expression: ArithmeticExpression<Int>) -> [LineView] {
    return lineViews(of: expression.positioned())
}

func lineViews<T>(of positionedTree: PositionedBinaryTree<T>, connectingTo parentPosition: CGPoint? = nil) -> [LineView] {
    var views: [LineView] = []
    let cgPtPosition = positionedTree.cgPointPosition
    let actualX = cgPtPosition.x + NodeVisualAttributes.Default.size.width / 2 * NodeVisualAttributes.spacingScaleFactor.horizontal
    let actualY = cgPtPosition.y + NodeVisualAttributes.Default.size.height / 2 * NodeVisualAttributes.spacingScaleFactor.vertical
    let actualPos = CGPoint(x: actualX, y: actualY)
    if let parent = parentPosition {
        let lview = lineView(from: actualPos, to: parent, withColor: positionedTree.visualAttributes!.connectingLineColor)
        lview.backgroundColor = .clear
        views.append(lview)
    }

    for child in positionedTree.children {
        views += lineViews(of: child, connectingTo: actualPos)
    }

    return views
}

public func lineView(from start: CGPoint, to end: CGPoint, withColor color: UIColor) -> LineView {

    let direction: LineView.SlantDirection
    if start.x < end.x {
        direction = .right
    } else {
        direction = .left
    }

    let frame = CGRect(containing: start, end)
    let view = LineView(frame: frame)
    view.color = color
    view.slantDirection = direction

    return view


//    let line = Line(start: start, end: end, color: color)
//    let frame = CGRect(containing: start, end)
//    let view = LineView(frame: frame)
//    view.draw = { line.draw(into: $0) }
//    return view
}
