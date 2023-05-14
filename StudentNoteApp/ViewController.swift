import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noteTableView: UITableView!
    
    var noteList = [Notes]()
    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteDetail" {
            let indexPath = sender as! IndexPath
            let gidilecekVC = segue.destination as! noteDetailViewController
            gidilecekVC.note = noteList[indexPath.row]
        } else if segue.identifier == "toAddNote" {
            let addNoteVC = segue.destination as! addNoteViewController
            addNoteVC.delegate = self
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNoteDetail", sender: indexPath)
    }
}

extension ViewController: AddNoteDelegate {
        func didAddNoteWithClassName(_ className: String, note1: Int, note2: Int) {
            let noteString = "\(className) - \(note1) - \(note2)"
            dataArray.append(noteString)
            noteTableView.reloadData()
            print("Added Note: \(noteString)")
        }
    }
