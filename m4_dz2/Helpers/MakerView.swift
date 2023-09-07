import UIKit

class MakerView {
    
    static let shared = MakerView()
    
    func makeLabel (text: String = "",
                    textColor: UIColor = .black,
                    font: UIFont = .systemFont(ofSize: 15, weight: .regular),
                    numberOfLines: Int = 0,
                    lineBreakMode: NSLineBreakMode = .byCharWrapping,
                    shadowColor: UIColor = .clear,
                    shadowOffset: CGSize = CGSize(width: 0, height: 0),
                    opacity: Float = 1.0,
                    borderwidth: CGFloat = 0,
                    bordercolor: UIColor = .clear ) -> UILabel
    {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.shadowColor = shadowColor
        label.shadowOffset = shadowOffset
        label.layer.opacity = opacity
        label.layer.borderWidth = borderwidth
        label.layer.borderColor = bordercolor.cgColor
        return label
    }
    
    func makeButton(title: String = "",
                        titleColor: UIColor = .white,
                        backgroundColor: UIColor = .clear,
                        cornerRadius: CGFloat = 12.0,
                        borderWidth: CGFloat = 0,
                        borderColor: UIColor = .clear,
                        isEnabled: Bool = true,
                        font: UIFont = UIFont.systemFont(ofSize: 17),
                        shadowColor: UIColor? = nil,
                        image: UIImage = UIImage()) -> UIButton
        {
            let btn = UIButton()
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(titleColor, for: .normal)
            btn.backgroundColor = backgroundColor
            btn.layer.cornerRadius = cornerRadius
            btn.layer.borderWidth = borderWidth
            btn.layer.borderColor = borderColor.cgColor
            btn.titleLabel?.font = font
            btn.isEnabled = isEnabled
            btn.setBackgroundImage(image, for: .normal)
            return btn
        }
    
    func makeView (backgroundColor: UIColor = .white,
                   cornerRadius: CGFloat = 0) -> UIView
    {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
   
}
