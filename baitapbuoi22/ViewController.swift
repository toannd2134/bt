//
//  ViewController.swift
//  baitapbuoi22
//
//  Created by Toan on 5/7/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var image = [customView]()
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    var coter = 0
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()
//
        scroll.delegate = self
        
        
        
        data()
        pagecontrol.currentPage = 0
        pagecontrol.numberOfPages = image.count
        pagecontrol.pageIndicatorTintColor = .gray
        pagecontrol.currentPageIndicatorTintColor = .purple
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = true
        scroll.bounces = false
        setupScrollView(imageView: image)
    }
    @IBAction func action(_ sender: Any) {
        if coter  <= image.count{
            let index = IndexPath.init(item: coter, section: 0)
           
        }
    }
    func setupScrollView(imageView : [customView]){
        scroll.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 100)
        scroll.contentSize = CGSize(width: screenWidth * CGFloat( image.count), height: screenHeight - 100 )
        for i in 0 ..< imageView.count {
            imageView[i].frame = CGRect(x: screenWidth * CGFloat(i), y: 0, width: screenWidth , height: screenHeight)
            scroll.contentSize.width = view.frame.width * CGFloat(i+1)
            scroll.addSubview(imageView[i])
        }
    }
    
    func data(){
        let image1 =  Bundle.main.loadNibNamed("customView", owner: self, options: nil)?.first as! customView
        image1.imageView.image = UIImage(named: "b1")
        image1.label.text =  "làm ướt hai bàn tay bằng nước sạch thoa xà phòng vào lòng bàn tay .Chà hai bàn tay vào với nhau"
        let image2 =  Bundle.main.loadNibNamed("customView", owner: self, options: nil)?.first as! customView
        image2.imageView.image = UIImage(named: "b2")
        image2.label.text = "dun ngón tay và lòng bàn tay này cuốn và xoay lần lượt từng ngón và bàn tay kia và ngược lại "
        let image3 =  Bundle.main.loadNibNamed("customView", owner: self, options: nil)?.first as! customView
        image3.imageView.image = UIImage(named: "b3")
        image3.label.text = "dùng lòng bàn tay này chà sát chéo lên bàn tay bên kia và ngược lại"
        let image4 =  Bundle.main.loadNibNamed("customView", owner: self, options: nil)?.first as! customView
        image4.imageView.image = UIImage(named: "b4")
        image4.label.text = "dùng đầu ngón tay của bàn tay này miết vào kẽ giữa của bàn tay kia và ngược lại"
        let image5 =  Bundle.main.loadNibNamed("customView", owner: self, options: nil)?.first as! customView
        image5.imageView.image = UIImage(named: "b7")
        image5.label.text = "chụm 5 đầu ngón tay  của tay này cọ vào lòng bàn tay kia bằng cách xoay đi xoay lại "
       let image6 =  Bundle.main.loadNibNamed("customView", owner: self, options: nil)?.first as! customView
       image6.imageView.image = UIImage(named: "b5")
       image6.label.text = "xảcho tay sạch hết xà phòng dưới nguồn nước sạch ,lau khô tay bằng khăn hoặc giấy sachk "
        self.image.append(contentsOf: [image1,image2,image3,image4,image5,image6])
    }

}

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageindex  = round(scrollView.contentOffset.x/screenWidth)
               pagecontrol.currentPage = Int(pageindex)
    }
}
