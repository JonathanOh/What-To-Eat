//
//  FoodChoiceVC
//  What To Eat
//
//  Created by Jonathan Oh on 9/6/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

class FoodChoiceVC: UIViewController {

    private var cuisines: [Cuisine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cuisines.append(Cuisine(cuisineType: .korean, topFiveFoods: ["bibimbap", "bulgogi", "soondoobu"]))
        cuisines.append(Cuisine(cuisineType: .american, topFiveFoods: ["burgers", "steak", "hot dogs"]))
        cuisines.append(Cuisine(cuisineType: .chinese, topFiveFoods: ["orange chicken", "chow fun", "broccoli beef"]))
        
        view.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

