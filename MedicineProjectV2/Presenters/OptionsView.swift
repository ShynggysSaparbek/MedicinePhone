//
//  OptionsView.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/28/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
protocol BrowsableOptionView{
    func changeOptionView(with option: [String:Double])
    func removeOptionButtons()
    func getOptionButtons()->[UIButton]
}
class OptionsView: UIStackView, BrowsableOptionView{
    weak var delegate: QuestionnaireViewController!
    private var optionButtons: [UIButton] = []
    
    func changeOptionView(with options: [String : Double]){
        removeOptionButtons() // removing old buttons
        createOptionButtons(with: options)
        insertOptionButtons()
    }
    func getOptionButtons()->[UIButton]{
        return optionButtons
    }
    // MARK: Helpers
    //removes all buttons from view
    func removeOptionButtons(){
        for column in self.arrangedSubviews{
            self.removeArrangedSubview(column)
            column.isHidden = true
        }
        optionButtons = []
    }
    //adds buttons to view
    private func insertOptionButtons(){
        let columns: [UIStackView] = getColumns(elementNumber: optionButtons.count)
        fillColumns(columns: columns)
        insertColumns(columns: columns)
    }
    
    //claclulates required number of columns
    private func getColumnNumber(elementNumber: Int)->Int{
        var columnDouble: Double = Double(elementNumber) / 3
        columnDouble.round(.up)
        return Int(columnDouble)
    }
    
    //create required number of columns
    private func getColumns(elementNumber: Int)->[UIStackView] {
        let columnNumber = getColumnNumber(elementNumber: elementNumber)
        
        var columns: [UIStackView] = []
        
        for _ in 0..<columnNumber{
            let column = UIStackView()
            configureColumn(column: column)
            columns.append(column)
        }
        return columns
    }
    
    //configures properties of created columns
    private func configureColumn(column: UIStackView){
        column.axis = .vertical
        column.spacing = 16
    }
    
    //creates option buttons
    private func createOptionButtons(with options: [String:Double]){
        for option in options {
            let button = UIButton()
            configureOptionButton(button: button, with: option.key)
            optionButtons.append(button)
        }
    }
    
    //configures created option buttons
    private func configureOptionButton(button: UIButton, with title: String){
        button.backgroundColor = .gray
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 8
        button.isHidden = false
        button.isEnabled = true
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.tintColor = .white
    }
    
    //configures action of created option button
    /*
    private func configureAction(of button: UIButton, action: Selector){
        button.addTarget(delegate, action: action, for: .allTouchEvents)
    }
     */
    
    //inserts created buttons in created columns
    private func fillColumns(columns: [UIStackView]){
        let columnNumber = columns.count
        for (index, button) in optionButtons.enumerated(){
            let column = columns[index % columnNumber]
            column.addArrangedSubview(button)
        }
        
    }
    
    //inserts created columns with buttons in view
    private func insertColumns(columns: [UIStackView]){
        axis = .horizontal
        for column in columns {
            addArrangedSubview(column)
        }
    }
}
