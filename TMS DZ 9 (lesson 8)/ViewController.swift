/* to google
 location in view
 intersects metod  для радиуса
 */
import UIKit

class ViewController: UIViewController {
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    let side: CGFloat = 100
    var arrayView: [UIView] = []
    var newArray: [UIView] = []
    
    private var myView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let oneView = UIView(frame: CGRect(x: 0, y: 0, width: self.side, height: self.side))
        oneView.layer.cornerRadius = self.side / 2
        oneView.backgroundColor = .random
        self.view.addSubview(oneView)
        
    }
    
    
    
    @IBAction func createCircle(){
        let circleView = UIView(frame: CGRect(x: self.x, y: self.y, width: self.side, height: self.side))
        circleView.layer.cornerRadius = self.side / 2
        circleView.backgroundColor = .random
        self.view.addSubview(circleView)
        
    }
    
    @IBAction override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        let circleView = UIView(frame: CGRect(x: location.x - side / 2, y: location.y - side / 2, width: self.side, height: self.side))
        circleView.layer.cornerRadius = self.side / 2
        circleView.backgroundColor = .random
        self.view.addSubview(circleView)
        for i in arrayView{
            if circleView.bounds.intersects(i.bounds){
                i.removeFromSuperview()
            }

        }
        print(arrayView)
        self.arrayView.append(circleView)

    }
    
}


extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

