
import Instructions
import UIKit

class AddMeasuredPersonViewController: ProfileViewController {

    var userId : String?
    
    @IBOutlet weak var lbUserID: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    
    @IBOutlet weak var tfUserID: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var scGender: UISegmentedControl!
    
    @IBOutlet weak var btSave: UIButton!
    
    var addNewHandler:((String) -> Void)?
    
    var windowLevel: UIWindow.Level?
//    var presentationContext: Context = .independentWindow
    var useInvisibleOverlay: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUserID.delegate = self
        tfName.delegate = self
        self.coachMarksController.dataSource = self
        self.coachMarksController.delegate = self
        let skipView = CoachMarkSkipDefaultView()
        skipView.setTitle("Skip", for: .normal)
        self.coachMarksController.skipView = skipView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    @IBAction func clickGender(_ sender: UISegmentedControl) {
        
    }
    @IBAction func clickBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func clickSave(_ sender: UIButton) {
        let userID = tfUserID.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let name = tfName.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        addNewHandler?(userID)
        let mp = MeasuredPerson()
        mp.name = name
        mp.userId = userID
        measuredPersons.append(mp)
        
        dismiss(animated: true)
    }

}


extension AddMeasuredPersonViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfUserID {
               if let text = textField.text, let range = Range(range, in: text) {
                   let newText = text.replacingCharacters(in: range, with: string)
                   if string == "" {
                       return true
                   }
//                   guard match(string,regularEnum : .id) else {return false}
//                   if newText.count > 16 {
//
//                       return false
//                   }
               }
        }
        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField
        {
        case tfUserID:
            tfName.becomeFirstResponder()
            break
        case tfName:
            textField.resignFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }
        
        
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if tfUserID.text != "" && tfUserID.text != "" {
            btSave.isEnabled = true
        }else {
            btSave.isEnabled = false
        }
        
        return true
    }
}

extension AddMeasuredPersonViewController : CoachMarksControllerDataSource {
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 1
    }

    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
        switch index {
        case 0:
            return coachMarksController.helper.makeCoachMark(for: self.tfUserID)
  
        default:
            return coachMarksController.helper.makeCoachMark()
        }
    }

    func coachMarksController(
        _ coachMarksController: CoachMarksController,
        coachMarkViewsAt index: Int,
        madeFrom coachMark: CoachMark
    ) -> (bodyView: (UIView & CoachMarkBodyView), arrowView: (UIView & CoachMarkArrowView)?) {

        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
            withArrow: true,
            arrowOrientation: coachMark.arrowOrientation
        )

        switch index {
        case 0:
            coachViews.bodyView.hintLabel.text = "Click This Add New"
            coachViews.bodyView.nextLabel.text = "OK"
//        case 1:
//            coachViews.bodyView.hintLabel.text = self.handleText
//            coachViews.bodyView.nextLabel.text = self.nextButtonText
        
        default: break
        }

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }

    // MARK: Protocol Conformance - CoachMarkControllerDelegate
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              willLoadCoachMarkAt index: Int) -> Bool {
//        if index == 0 && presentationContext == .controller {
//            return false
//        }

        return true
    }
    
    
}

