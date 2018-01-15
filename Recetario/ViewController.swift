//
//  ViewController.swift
//  Recetario
//
//  Created by Luis Conde on 13/01/18.
//  Copyright © 2018 Luis Conde. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var recipe = Recipe(name: "Arroz a la Mexicana",
                            image: #imageLiteral(resourceName: "arroz"),
                            time: 40,
                            ingredients:["Arroz", "Chicharos", "Aceite"] ,
                            steps: ["Paso 1", "Paso 2", "Paso 3"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Tacos Dorados",
                        image: #imageLiteral(resourceName: "tacos") ,
                        time: 60,
                        ingredients:["Tortilla", "Pollo", "Aceite"] ,
                        steps: ["Paso 1", "Paso 2", "Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Chiles en Nogada",
                        image: #imageLiteral(resourceName: "chiles"),
                        time: 120,
                        ingredients:["Chile Poblano", "Nogada"],
                        steps: ["Paso 1", "Paso 2", "Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 40,
                        ingredients:["Pan", "Carne", "Lechuga"] ,
                        steps: ["Paso 1", "Paso 2", "Paso 3"])
        recipes.append(recipe)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //Nos indica el número de secciones de la tabla
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "RecipeCell"
        let recipe = recipes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //compartir
        let shareAction = UITableViewRowAction(style: .normal, title: "Compartir") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de: \(self.recipes[indexPath.row].name!), en la app Recetario"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
            
        }
        
        //borrar
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        shareAction.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        return [shareAction, deleteAction]
        
    }
    
    
    
    //MARK: - UITableViewDelegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
        
    }
    
    
}

