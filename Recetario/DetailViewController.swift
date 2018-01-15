//
//  DetailViewController.swift
//  Recetario
//
//  Created by Luis Conde on 13/01/18.
//  Copyright © 2018 Luis Conde. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var recipeImageView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    
    
    var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.recipeImageView.image = recipe.image
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell" , for: indexPath) as! RecipeDetailViewCell
        
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
            default:
                break
            }
            
        case 1:
            
            if indexPath.row==0 {
                cell.keyLabel.text = "Ingredientes:"
            }else{
                    cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row==0 {
                cell.keyLabel.text = "Pasos:"
            }else{
                    cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
        
    }
    
}


extension DetailViewController: UITableViewDelegate {

    
    
}
