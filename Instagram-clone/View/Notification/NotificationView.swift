//
//  NotificationView.swift
//  Instagram-clone
//
//  Created by Kunatip Satsomnuk on 7/11/2564 BE.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationsCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}
