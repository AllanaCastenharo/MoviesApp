import UIKit

class MovieViewCell: UICollectionViewCell {
    
    var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    var descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        description.numberOfLines = .zero
        description.textColor = .moviesColor(.gray4)
        description.textColor = .white
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Asset.like.image, for: .normal)
        return button
    }()
    
    var likedTapped: (() -> Void)?
    
    func setup(isFavoriteMovie: Bool,url: String, description: String, likedTapped: (() -> Void)? = nil) {
        self.likedTapped = likedTapped
        downloadImage(from: URL(string: "https://image.tmdb.org/t/p/w500" + url))
        descriptionLabel.text = description
        
        if isFavoriteMovie {
            likeButton.setImage(Asset.likeFill.image, for: .normal)
        } else {
            likeButton.setImage(Asset.like.image, for: .normal)
        }
        
        setupCell()
        setupView()

    }

    override func prepareForReuse() {
        imageMovie.image = nil
        descriptionLabel.text = nil
        likeButton.setImage(Asset.like.image, for: .normal)
    }
    
    func setupCell() {
        backgroundColor = .clear
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
        clipsToBounds = true
        layer.cornerRadius = 8
    }
    
    @objc func clickButton() {
        likeButton.setImage(Asset.likeFill.image, for: .normal)
        self.likedTapped?()
    }
    
    func deslike() {
        likeButton.setImage(Asset.like.image, for: .normal)
    }
}

extension MovieViewCell: ViewCode {
    
    func buildViewHierarchy() {
        addSubview(imageMovie)
        addSubview(descriptionLabel)
        addSubview(likeButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: .moviesSpacing(.base02)),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.moviesSpacing(.base02)),
            likeButton.heightAnchor.constraint(equalToConstant: .moviesSpacing(.base08)),
            likeButton.widthAnchor.constraint(equalToConstant: .moviesSpacing(.base08)),

            imageMovie.topAnchor.constraint(equalTo: topAnchor),
            imageMovie.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageMovie.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageMovie.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    func downloadImage(from url: URL?) {
        guard let url = url else {
            return
        }
        print("Download Started \(url)")
        let chache = ImageCache()
        chache.getImage(from: url) { image, error in
            if let image = image {
                DispatchQueue.main.async {
                    self.imageMovie.image = image
                }
            }
        }
    }
}
