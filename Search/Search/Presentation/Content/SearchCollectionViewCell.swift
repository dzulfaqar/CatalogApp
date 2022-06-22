//
//  SearchCollectionViewCell.swift
//  Search
//
//  Created by Dzulfaqar on 19/06/22.
//

import UIKit
import Common

class SearchCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var parentView: UIView!
  @IBOutlet weak var backgroundCover: UIView!
  @IBOutlet weak var gameImageView: UIImageView!
  @IBOutlet weak var gameTitle: UILabel!
  @IBOutlet weak var gameRelease: UILabel!
  @IBOutlet weak var gameRating: UILabel!
  @IBOutlet weak var loadingView: UIActivityIndicatorView!

  var callback: ((Int) -> Void)?
  var data: GameModel?

  override func awakeFromNib() {
    super.awakeFromNib()

    contentView.layer.cornerRadius = 20
    contentView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
    gameImageView.layer.cornerRadius = 20

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(itemSelected(sender:)))
    parentView.addGestureRecognizer(tapGesture)
  }

  @objc func itemSelected(sender: UITapGestureRecognizer) {
    if let id = data?.id {
      callback?(id)
    }
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    gameImageView.image = nil
    gameTitle.text = ""
    gameRelease.text = ""
    gameRating.text = ""
    backgroundCover.backgroundColor = nil
  }

  func setup(with data: GameModel) {
    self.data = data

    gameImageView.load(url: data.image) { [weak self] in
      self?.showData(data)
    }
  }

  private func showData(_ data: GameModel) {
    gameTitle.text = data.name
    gameRelease.text = data.released?.releasedDate()
    gameRating.text = data.rating?.ratingFormatted()

    loadingView.stopAnimating()
    loadingView.alpha = 0

    backgroundCover.layer.cornerRadius = 20
    backgroundCover.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
  }
}