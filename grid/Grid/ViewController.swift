//
//  ViewController.swift
//  Grid
//  
//
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private let sectionInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    @IBOutlet weak var collectionView: UICollectionView!
    var data = DataModel(numItemsPerRow: 9, initialization: 0)
    var row: Int = 0, column : Int = 0
    private let itemsPerRow = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // how many items you want to show in its grid
    func collectionView(collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return itemsPerRow*itemsPerRow
    }
    

    
    // create data
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DataCell", forIndexPath: indexPath) as! SudokuCollectionViewCell
        
        var row, column : Int
        (row, column) = getlocation(indexPath)
        //reference array for the question to do secondary operations like color, question value, etc
        var refarray: [[[Int]]] =
            [
                [[0],[7],[6],[0],[1],[4],[9],[5],[8]],
                [[0],[5],[0],[9],[0],[0],[7],[1],[0]],
                [[9],[0],[0],[0],[7],[5],[0],[6],[4]],
                [[4],[6],[8],[1],[0],[7],[0],[0],[5]],
                [[0],[9],[0],[4],[3],[8],[0],[0],[0]],
                [[1],[0],[0],[5],[9],[0],[4],[8],[7]],
                [[3],[0],[5],[7],[8],[0],[0],[0],[6]],
                [[0],[4],[0],[0],[0],[3],[0],[7],[0]],
                [[7],[8],[9],[6],[4],[0],[5],[3],[0]]
        ]

        //to display empty cells instead of zeros in the grid
        if (String(refarray[row][column]) == String([0])) {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        else{
            cell.backgroundColor = UIColor.darkGrayColor()
        }
        cell.label.text = String(data.get_num(row, column: column))
        cell.layer.cornerRadius = 3
        
        //converting array values to string values
        if(cell.label.text == String([0]))
        {
            cell.label.textColor = UIColor.clearColor()
            //cell.backgroundColor = UIColor.redColor()
            //sleep(1)
            //cell.backgroundColor = UIColor.lightGrayColor()
            //cell.backgroudColor = bcolor.CGColor
        }
        else
        {
            cell.label.textColor = UIColor.whiteColor()
            //cell.backgroundColor = UIColor.redColor()
            
            if (cell.label.text == String([1])) {
                cell.label.text = String(1)}
            else if(cell.label.text == String([2])){
                cell.label.text = String(2)
            }
            else if(cell.label.text == String([3])){
                cell.label.text = String(3)
            }
            else if(cell.label.text == String([4])){
                cell.label.text = String(4)
              
            }
            else if(cell.label.text == String([5])){
                cell.label.text = String(5)
             
            }
            else if(cell.label.text == String([6])){
                cell.label.text = String(6)

            }
            else if(cell.label.text == String([7])){
                cell.label.text = String(7)
            }
            else if(cell.label.text == String([8])){
                cell.label.text = String(8)
                     }
            else if(cell.label.text == String([9])){
                cell.label.text = String(9)
                
               }
            
            
        }
        
            return cell
    }
    
    
    // specify cell size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let paddingSpace = Int(sectionInsets.left) * itemsPerRow * 2
        let availableWidth = view.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
        
    
    // selection behaviour
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // You can use indexPath to get "cell number x", or get the cell like:
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as! SudokuCollectionViewCell
        
        
        (row, column) = getlocation(indexPath)
        //data.set_num(row, column: column, value: 1) // update model
        
        
        collectionView.reloadData() // update view
    }
    
    func getlocation(indexPath: NSIndexPath) -> (row: Int, column: Int) {
        let row: Int = indexPath.row / itemsPerRow
        let column: Int = indexPath.row % itemsPerRow
        return (row, column)
    }
    //action for buttons
    @IBAction func but1(sender: AnyObject) {
        data.set_num(row, column: column, value: [1]) // update model
        collectionView.reloadData()
        
    }
    @IBAction func but2(sender: AnyObject) {
        data.set_num(row, column: column, value: [2]) // update model
        collectionView.reloadData()
    }
    
    @IBAction func but3(sender: AnyObject) {
        data.set_num(row, column: column, value: [3]) // update model
        collectionView.reloadData()
    }
    
    @IBAction func but4(sender: AnyObject) {
        data.set_num(row, column: column, value: [4]) // update model
        collectionView.reloadData()
    }
    @IBAction func but5(sender: AnyObject) {
        
        data.set_num(row, column: column, value: [5]) // update model
        collectionView.reloadData()
    }
    @IBAction func but6(sender: AnyObject) {
        data.set_num(row, column: column, value: [6]) // update model
        collectionView.reloadData()
    }
    @IBAction func but7(sender: AnyObject) {
        data.set_num(row, column: column, value: [7]) // update model
        collectionView.reloadData()
    }
    @IBAction func but8(sender: AnyObject) {
        data.set_num(row, column: column, value: [8]) // update model
        collectionView.reloadData()
    }
    @IBAction func but9(sender: AnyObject) {
        data.set_num(row, column: column, value: [9]) // update model
        collectionView.reloadData()
    }
    
    @IBAction func reload(sender: UIButton) {
        data.reset()
        collectionView.reloadData()
    }
    //validation functions
    @IBAction func sortRows(sender: AnyObject) {
        if(data.checkans()){
            let alert = UIAlertController(title: "Sudoku", message: "You won!!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
           
                   }
        else{
            let alert = UIAlertController(title: "Sudoku", message: "Sorry. Try again", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
         data.reset()
        collectionView.reloadData()
    }
    
}

