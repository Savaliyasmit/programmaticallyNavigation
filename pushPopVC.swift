//
//  pushPopVC.swift
//  iosLearn
//
//  Created by smit on 25/12/24.
//

import Foundation


guard let EditVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodoEditVC") as? TodoEditVC else {
    return
    
}

EditVc.recivedIndex =  originalIndex
EditVc.recivedTask = selectedTitle
EditVc.comp = { [weak self] index, details  in
    guard let self = self else {return}
    
    self.tasksList[index].details = details
    
    if let filterIndex = self.filterArray?.firstIndex(where: { $0.titlename == self.tasksList[index].titlename }) {
                self.filterArray?[filterIndex].details = details
        self.tblView.reloadRows(at: [IndexPath(row: filterIndex, section: 0)], with: .none)
            }
    
    self.tblView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
}
self.navigationController?.pushViewController(EditVc, animated: true)
}


2nd VC popView Controller:-

//pass back to data previous controller using compliatior aslo called handler
var comp:((_ recivedIndex: Int,_ details: String)->())?

@IBAction func backToHomeBtn(_ sender: Any) {
//        delagate?.updatedTask(index: recivedIndex, details: txtViewTask.text)
    
    
    
    comp?(recivedIndex, txtViewTask.text)
    if !txtViewTask.text.isEmpty{
        save()
    }
    self.view.endEditing(true)
    self.navigationController?.popViewController(animated: true)
    
}

