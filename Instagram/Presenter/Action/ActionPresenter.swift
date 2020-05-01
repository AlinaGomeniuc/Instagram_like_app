//
//  ActionPresenter.swift
//  Instagram
//
//  Created by Alina Gomeniuc on 4/30/20.
//  Copyright © 2020 Alina Gomeniuc. All rights reserved.
//
import RxSwift

class ActionPresenter {
    private let actionService : ActionService
    weak private var actionViewDelegate : ActionViewDelegate?
    
    var actionData : Array<ActionModel> = Array()
    var nrOfActions: Int {
        return actionData.count
    }
    
    init(actionService : ActionService){
        self.actionService = actionService
    }
    
    func setViewDelegate(actionViewDelegate : ActionViewDelegate?){
        self.actionViewDelegate = actionViewDelegate
    }
    
    func fetchActionData(){
        self.actionViewDelegate?.showLoadingHUD()
        let _ = actionService.fetchActionList()
                .subscribe {event in
                    var action : [ActionModel]
                    switch event {
                        case .next(let value):
                        action = value
                        for element in action {
                            let cell = ActionModel(id: element.id,
                                                   username: element.username,
                                                   action: element.action)
                
                            self.actionData.append(cell)
                        }
                        case .error(let error):
                            print(error)
                
                        case .completed:
                            self.actionViewDelegate?.hideLoadingHUD()
                            self.actionViewDelegate?.refrashActionView()
                        }
                }
    }
    
    func configureCell(cell: ActionCell, forRow row: Int){
        let action = actionData[row]
        cell.displayUsername(usernameText: action.username)
        cell.displayAction(actionText: action.action)
    }
    
}
