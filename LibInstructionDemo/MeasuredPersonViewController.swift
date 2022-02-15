import Instructions
import UIKit

var measuredPersons = [MeasuredPerson]()

class MeasuredPersonViewController: ProfileViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btAddNew: UIButton!
    var addnewId : String?
    
    var windowLevel: UIWindow.Level?
    var presentationContext: Context = .independentWindow
    var useInvisibleOverlay: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MeasuredPersonTableViewCell", bundle: nil), forCellReuseIdentifier: "MeasuredPersonTableViewCell")
        self.coachMarksController.dataSource = self
        self.coachMarksController.delegate = self
        let skipView = CoachMarkSkipDefaultView()
//        skipView.frame = CGRect(x: 300, y: 300, width: 500, height: 100)
//        skipView.background.innerColor = .red
        
        skipView.setTitle("Skip", for: .normal)
//        var bt = UIButton()
        
        self.coachMarksController.skipView = skipView
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    @IBAction func clickAddNew(_ sender: UIButton) {
        performSegue(withIdentifier: "AddNew", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNew" {
            if let vc = segue.destination as? AddMeasuredPersonViewController {
                vc.addNewHandler = { [unowned self] newId in
//                    print(newId)
                    addnewId = newId
                }
            }
        }
    }
    enum Context {
        case independentWindow, controllerWindow, controller
    }
}

extension MeasuredPersonViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeasuredPersonTableViewCell", for: indexPath) as! MeasuredPersonTableViewCell
        let measuredPerson = measuredPersons[indexPath.row]
        cell.lbIdCode.text = measuredPerson.userId
        cell.lbName.text = measuredPerson.name
        
        if measuredPerson.userId == addnewId {
            cell.view.backgroundColor = .lightBlueColor2
        }else{
            cell.view.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measuredPersons.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let measuredPerson = measuredPersons[indexPath.row]
//        CoreDataManage.currentMP = measuredPerson
//        addnewId = ""
        performSegue(withIdentifier: "MeasuredPerson", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
}

extension MeasuredPersonViewController : CoachMarksControllerDataSource {
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 1
    }

    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {

        if measuredPersons.isEmpty {
            return coachMarksController.helper.makeCoachMark(for: self.btAddNew)
        }else {
            return coachMarksController.helper.makeCoachMark(for: self.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)))
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

        if measuredPersons.isEmpty {
            coachViews.bodyView.hintLabel.text = "Click This Add New"
            coachViews.bodyView.nextLabel.text = "OK"
        }else {
            coachViews.bodyView.hintLabel.text = "Click This one"
            coachViews.bodyView.nextLabel.text = "OK"
        }

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }

    // MARK: Protocol Conformance - CoachMarkControllerDelegate
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              willLoadCoachMarkAt index: Int) -> Bool {
        if index == 0 && presentationContext == .controller {
            return false
        }

        return true
    }
    func coachMarksController(_ coachMarksController: CoachMarksController, constraintsForSkipView skipView: UIView, inParent parentView: UIView) -> [NSLayoutConstraint]? {
        let cTop = NSLayoutConstraint(item: skipView, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 300)
        let cleading = NSLayoutConstraint(item: skipView, attribute: .leading, relatedBy: .equal, toItem: parentView, attribute: .leading, multiplier: 1, constant: 100)
        let cwidth = NSLayoutConstraint(item: skipView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
//        let c = NSLayoutConstraint()
//        c.constant = 300
        return [cTop , cleading ,cwidth]
    }
    
}

