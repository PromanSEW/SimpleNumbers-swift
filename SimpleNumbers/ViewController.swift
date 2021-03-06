import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var numberTextField: UITextField!
	@IBOutlet weak var calcButton: UIButton!
	@IBOutlet weak var result: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		numberTextField.delegate = self
		result.text = ""
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		calcButton.isEnabled = !numberTextField.text!.isEmpty
	}

	@IBAction func calculate(_ sender: UIButton) {
		let n = UInt(numberTextField.text!)!
		var divs = 0
		result.text = ""
		result.text?.append(String(format: NSLocalizedString("dividers", comment: "Делители числа n"), n))
		for i in 1...n {
			if n % i == 0 {
				result.text?.append("\(i)\n")
				divs += 1
			}
		}
		if divs == 2 {
			result.text?.append(String(format: NSLocalizedString("simple", comment: "Число n является простым"), n))
		}
	}
}
