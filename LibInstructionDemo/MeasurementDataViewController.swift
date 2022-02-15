
import Instructions
import UIKit

class MeasurementDataViewController: ProfileViewController {

    var windowLevel: UIWindow.Level?
//    var presentationContext: Context = .independentWindow
    var useInvisibleOverlay: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coachMarksController.dataSource = self
        self.coachMarksController.delegate = self
        let skipView = CoachMarkSkipDefaultView()
        
        skipView.setTitle("Skip", for: .normal)
        self.coachMarksController.skipView = skipView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MeasurementDataViewController : CoachMarksControllerDataSource {
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 1
    }

    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {

        return coachMarksController.helper.makeCoachMark(for: self.tabBarController!.tabBar,cutoutPathMaker: { (frame: CGRect) -> UIBezierPath in
            
            let f = CGRect(origin: CGPoint(x: frame.origin.x + frame.size.width / 2 , y: frame.origin.y), size: CGSize(width: frame.size.width / 2, height: frame.size.height))
            return UIBezierPath(rect: f)
        })
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
        coachViews.bodyView.hintLabel.text = "Click This Measured"
        coachViews.bodyView.nextLabel.text = "OK"
        

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }

    // MARK: Protocol Conformance - CoachMarkControllerDelegate
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              willLoadCoachMarkAt index: Int) -> Bool {

        return true
    }
    
}

