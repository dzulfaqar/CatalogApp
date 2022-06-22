//
//  GenreCollectionViewCell.swift
//  Catalog
//
//  Created by Dzulfaqar on 04/06/22.
//

import UIKit
import Common

class GenreCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var parentView: UIView!
  @IBOutlet weak var backgroundCover: UIView!
  @IBOutlet weak var genreImage: UIImageView!
  @IBOutlet weak var genreTitle: UILabel!
  @IBOutlet weak var loadingView: UIActivityIndicatorView!

  var callback: ((GenreModel?) -> Void)?
  var data: GenreModel?

  override func awakeFromNib() {
    super.awakeFromNib()
    genreImage.layer.cornerRadius = 20

    parentView.layer.cornerRadius = 20
    parentView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(itemSelected(sender:)))
    parentView.addGestureRecognizer(tapGesture)
  }

  @objc func itemSelected(sender: UITapGestureRecognizer) {
    if genreTitle.text == "All Games" {
      callback?(nil)
    } else {
      callback?(data)
    }
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    genreImage.image = nil
    genreTitle.text = ""
  }

  func allGames(url: String?) {
    genreImage.load(url: url) { [weak self] in
      self?.showData(name: "All Games")
    }
  }

  func setup(with data: GenreModel) {
    self.data = data

    genreImage.load(url: data.image) { [weak self] in
      self?.showData(name: data.name)
    }
  }

  private func showData(name: String?) {
    backgroundCover.layer.cornerRadius = 20
    backgroundCover.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)

    genreTitle.text = name

    loadingView.stopAnimating()
    loadingView.alpha = 0
  }
}
