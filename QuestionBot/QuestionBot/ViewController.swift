import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var questionField: UITextField!
    
    var questionAnswerer = MyQuestionAnswerer()

    override func viewDidLoad() {
        super.viewDidLoad()
        questionField.becomeFirstResponder()
    }

    func respondToQuestion(_ question: String) {
        let answer = questionAnswerer.responseTo(question: question)

        displayAnswerTextOnScreen(answer)
        questionField.placeholder = "Ask another question..."
        questionField.text = nil
        askButton.isEnabled = false
    }

    @IBAction func askButtonTapped(_ sender: AnyObject) {
        guard questionField.text != nil else {
            return
        }
        questionField.resignFirstResponder()
    }
    
    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }

}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //this will make the keyboard to slide down
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { //else in the guard statement means if textField.text contains nil, exit (return)
            return
        }
        
        respondToQuestion(text) //if textField.text contains a value, do this
    }
    
    @IBAction func editingChanged(_ textField: UITextField) {
        guard let text = textField.text else {
            askButton.isEnabled = false
            return
        }
        
        askButton.isEnabled = !text.isEmpty
    }
}
