//
//  SimpleSection.swift
//  CollectionView
//
//  Created by Елизавета Семенова on 22/10/2018.
//  Copyright © 2018 lisemyon. All rights reserved.
//

import UIKit

class SimpleSection: UICollectionViewCell {
	lazy var titleLabel: UILabel = {
		let view = UILabel(frame: .zero)
		view.numberOfLines = 0
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupView()
	}
	
	private func setupView() {
		backgroundColor = .red
		self.contentView.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(titleLabel)
		titleLabel.preferredMaxLayoutWidth = 100
		titleLabel.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0))
		contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0.0))
		contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0.0))
		contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0.0))
		contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
	}
	
//	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//		setNeedsLayout()
//		layoutIfNeeded()
//		
//		let size = self.contentView.systemLayoutSizeFitting(layoutAttributes.size)
//		
//		var frame = layoutAttributes.frame
//		frame.size.height = ceil(size.height)
//		frame.size.width = ceil(size.width)
//		layoutAttributes.frame = frame
//		
//		return layoutAttributes
//	}
}
