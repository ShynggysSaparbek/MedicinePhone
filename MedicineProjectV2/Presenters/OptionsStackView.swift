//
//  OptionsStackView.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/26/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit

class OptionsStackView: UIStackView {
    func configureOptionButtons(with options: [String:Double]){
        var optionButtons: [UIButton] = []
        for option in options {
            let button = UIButton()
            configureOptionButton(button: button, with: option.key)
            optionButtons.append(button)
        }
        addOptionButtons(buttons: optionButtons)
    }
    
    private func configureOptionButton(button: UIButton, with title: String){
        button.backgroundColor = .blue
        button.isHidden = false
        button.isEnabled = true
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.tintColor = .white
        
        
        //button.addTarget(<#T##target: Any?##Any?#>, action: , for: .allTouchEvents)
    }
    private func configureButtonConstraints(button: UIButton){
        let heightConstraint = NSLayoutConstraint(item: button,
                                                  attribute: .height,
                                                  relatedBy: .greaterThanOrEqual,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 30)
        self.addConstraint(heightConstraint)
    }
    
    
    private func addOptionButtons(buttons: [UIButton]){
        let columnNumber: Int = buttons.count / 2 
        let columns = createColumns(number: columnNumber)
        switch columnNumber {
        case 1:
            for button in buttons{
                self.addArrangedSubview(button)
            }
        case 2:
            for button in buttons{
                chosen
            }
        }
        /*case 2...3:
            self.axis = .horizontal
            for button in buttons{
                self.addArrangedSubview(button)
                configureButtonConstraints(button: button)
            }
        case 4...6:
            //creating left and right subviews
            let leftStackview = UIStackView()
            leftStackview.axis = .horizontal
            
            let rightStackview = UIStackView()
            rightStackview.axis = .horizontal
            
            
            // adding buttons to both subviews
            for (index, button) in buttons.enumerated(){
                if index % 2 == 0{
                    leftStackview.addArrangedSubview(button)
                }else{
                    rightStackview.addArrangedSubview(button)
                }
            }
            // adding lefy and right stackviews to original subviews
            self.axis = .vertical
            self.addArrangedSubview(leftStackview)
            self.addArrangedSubview(rightStackview)
        default:
            let errorLabel = UILabel()
            errorLabel.text = "Error total number of options is out of expected range"
            self.addArrangedSubview(errorLabel)
            print("Error total number of options is out of expected range")
        }*/
    }
    
    private func createColumns(number: Int)->[UIStackView]{
        var columns: [UIStackView] = []
        for _ in 1...number{
            //creating columns
            let column = UIStackView()
            column.axis = .horizontal
            columns.append(column)
        }
        return columns
    }
}
