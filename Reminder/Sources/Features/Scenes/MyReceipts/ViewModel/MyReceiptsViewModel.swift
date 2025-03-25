//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Thiago Firsen on 19/03/25.
//

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        DBHelper.shared.fetchReceipts()
    }
}
