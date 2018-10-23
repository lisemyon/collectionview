//
//  ViewController.swift
//  CollectionView
//
//  Created by Елизавета Семенова on 22/10/2018.
//  Copyright © 2018 lisemyon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!

	struct Item {
		let title: String
		let cells: [String]
	}
	
	var items: [Item] = [
		Item(title: "askonne2m[wwf ksc aks aks kas kas ka kjasbfvk dka kjds kd ka", cells: [
			"sfn03rnvr   psd csd coa coa",
			"asf0riv poe f vos dod ascasfv f",
			"Sfmwevn30invondvlsdl v vadv kdjsv lsdva",
			]
		),
		Item(title: "v fj s dvl alsv kd", cells: [
			"adv kjdsdl vksd lasd",
			]
		),
		Item(title: "lakdv fk lsd ksladmalsf", cells: [
			"als v02c 02nc- 2e0 n1w e0wqcm sd- ceowncla scd",
			"ld diopsdncodanscpan vdosapcnv w0-qc ods w",
			"as isodamcs ovdasmcsa vodapsfvjdofnvasfjvo",
			"amsnv woe voe asnvodasfkqpnfpnvp2 3",
			"aslkn0v3jfn0v3-vm 03n -2m 02-=cm 3",
			]
		)
	]
	
	private var contraint: NSLayoutConstraint!
	private var headeTemplate = SimpleSection()
	
	private lazy var flowLayout: CollectionViewFlowLayout = {
		let layout = CollectionViewFlowLayout()
		layout.estimatedItemSize = CGSize(width: 50.0, height: 50.0)
		layout.itemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = UICollectionView.ScrollDirection.vertical
		return layout
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		view.addSubview(collectionView)
		
		headeTemplate.translatesAutoresizingMaskIntoConstraints = false
		
		collectionView.addObserver(self, forKeyPath: #keyPath(UICollectionView.contentSize), options: [NSKeyValueObservingOptions.new], context: nil)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
		collectionView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 0).isActive = true
		contraint = collectionView.heightAnchor.constraint(equalToConstant: 10)
		contraint.isActive = true
		
		collectionView.register(SimpleCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.register(SimpleSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
		collectionView.backgroundColor = .orange
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		if let contentSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
			if contentSize.height == collectionView.frame.height {
				return
			}
			contraint.constant = contentSize.height
		}
	}
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		headeTemplate.titleLabel.text = items[section].title
		let size = headeTemplate.titleLabel.sizeThatFits(CGSize(width: collectionView.frame.width, height: .greatestFiniteMagnitude))
//		headeTemplate.setNeedsLayout()
//		headeTemplate.layoutIfNeeded()
//		let height = headeTemplate.sizeThatFits(CGSize(width: collectionView.frame.width, height: .greatestFiniteMagnitude))
//		print(height)
		return size
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items[section].cells.count
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! SimpleSection
		view.titleLabel.text = items[indexPath.section].title
		return view
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SimpleCell
		cell.titleLabel.text = items[indexPath.section].cells[indexPath.row]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 50
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 20
	}
}

