import UIKit

class ViewController: UIViewController {
	var operator:Character? = nil
	var leftOprand:Float? = nil
	var rightOprand:Float? = nil
	var memory:Float? = nil
	var resetTextLabelOnNextAppending : Bool = false

	@IBOutlet var textLabel : UILabel
	@IBOutlet var operatorLabel : UILabel

	override func viewDidLoad() {
		super.viewDidLoad()
		self.clear(nil)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func clear(sender:AnyObject?) {
		self.leftOprand = nil
		self.rightOprand = nil
		self.textLabel.text = ""
		self.operatorLabel.text = ""
	}

	@IBAction func appendText(sender:AnyObject) {
		var button : UIButton = sender as UIButton
		var s:String = button.titleLabel.text

		if resetTextLabelOnNextAppending == true {
			self.textLabel.text = ""
			resetTextLabelOnNextAppending = false
		}
		if s === "." {
			if !contains(self.textLabel.text as String, ".") {
				self.textLabel.text = self.textLabel.text + "."
			}
			return
		}
		if self.textLabel.text == "0" {
			if s == "." {
				return
			}
			self.textLabel.text = s
		} else {
			self.textLabel.text = self.textLabel.text + s
		}
	}

	func _doCalculation() {
		if !self.operator || !self.rightOprand {
			return
		}
		if self.operator == "/" && (self.rightOprand == 0.0 || self.rightOprand == nil) {
			var alert : UIAlertView! = UIAlertView(title:"Unable to devide 0!", message:"", delegate:nil, cancelButtonTitle:"OK")
			alert.show()
			return
		}
		var result : Float = 0
		switch self.operator! {
		case "+":
			result = self.leftOprand! + self.rightOprand!
		case "-":
			result = self.leftOprand! - self.rightOprand!
		case "*":
			result = self.leftOprand! * self.rightOprand!
		case "/":
			result = self.leftOprand! / self.rightOprand!
		default:
			result = 0
		}
		self.leftOprand = result
		self.textLabel.text = "\(result)"
		self.rightOprand = nil
		self.resetTextLabelOnNextAppending = false
	}

	@IBAction func setOperator(sender:AnyObject) {
		if self.leftOprand == nil {
			var text:NSString = self.textLabel.text
			self.leftOprand = Float(text.doubleValue)
			self.rightOprand = nil
		} else if !resetTextLabelOnNextAppending {
			var text:NSString = self.textLabel.text
			self.rightOprand = Float(text.doubleValue)
			self._doCalculation()
		}
		var button = sender as UIButton
		var s : NSString = button.titleLabel.text
		s = s.substringWithRange(NSMakeRange(0, 1))
		var c : Character = Character(s)
		self.operator = c
		self.operatorLabel.text = s
		self.resetTextLabelOnNextAppending = true
	}

	@IBAction func doCalculation(sender:AnyObject) {
		if self.operator == nil || self.leftOprand == nil {
			return
		}
		var text:NSString = self.textLabel.text
		self.rightOprand = Float(text.doubleValue)
		self._doCalculation()
		self.operatorLabel.text = ""
		self.operator = nil
	}

	@IBAction func togglePositiveNagative(sender:AnyObject) {
		if resetTextLabelOnNextAppending {
			self.leftOprand = nil
			self.resetTextLabelOnNextAppending = false
		}
		self.operator = nil
		self.operatorLabel.text = ""
		var s : String = self.textLabel.text
		if s.hasPrefix("-") {
			self.textLabel.text = s.substringFromIndex(1)
		} else {
			self.textLabel.text = "-" + s
		}
	}

	@IBAction func memoryClear(sender:AnyObject) {
		self.memory = 0
	}

	@IBAction func memoryPlus(sender:AnyObject) {
		if !self.memory {
			self.memory = 0
		}
		var text:NSString = self.textLabel.text
		var num:Float = Float(text.doubleValue)
		self.memory = self.memory! + num
		self.resetTextLabelOnNextAppending = true
	}

	@IBAction func memoryMinus(sender:AnyObject) {
		if !self.memory {
			self.memory = 0
		}
		var text:NSString = self.textLabel.text
		var num:Float = Float(text.doubleValue)
		self.memory = self.memory! - num
		self.resetTextLabelOnNextAppending = true
	}

	@IBAction func memoryRecall(sender:AnyObject) {
		if !self.memory {
			self.memory = 0
		}
		self.textLabel.text = "\(self.memory)"
		if !self.operator {
			self.leftOprand = self.memory
		}
		self.resetTextLabelOnNextAppending = true
	}
}
