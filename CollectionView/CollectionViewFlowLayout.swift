//
//  CollectionViewFlowLayout.swift
//  CollectionView
//
//  Created by Елизавета Семенова on 22/10/2018.
//  Copyright © 2018 lisemyon. All rights reserved.
//

import UIKit

extension CollectionViewFlowLayout {
	struct Appearance {
		let rowSpacing: CGFloat = 10
	}
}

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
	let apperance = Appearance()
	
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		
		let attributes = super.layoutAttributesForElements(in: rect)
		
		var leftMargin = sectionInset.left
		var maxY: CGFloat = 0.0
		
		let horizontalSpacing: CGFloat = apperance.rowSpacing
		
		attributes?.forEach { layoutAttribute in
			if layoutAttribute.frame.origin.y >= maxY
				|| layoutAttribute.frame.origin.x == sectionInset.left {
				leftMargin = sectionInset.left
			}
			
			if layoutAttribute.frame.origin.x == sectionInset.left {
				leftMargin = sectionInset.left
			}
			else {
				layoutAttribute.frame.origin.x = leftMargin
			}
			
			leftMargin += layoutAttribute.frame.width + horizontalSpacing
			maxY = max(layoutAttribute.frame.maxY, maxY)
		}
		
		return attributes
	}
	
	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		let attributes = super.layoutAttributesForItem(at: indexPath)
		return attributes
	}
}
