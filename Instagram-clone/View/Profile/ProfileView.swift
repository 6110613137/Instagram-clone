//
//  ProfileView.swift
//  Instagram-clone
//
//  Created by Kunatip Satsomnuk on 7/11/2564 BE.
//

import SwiftUI

struct ProfileView: View {
    @State var user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeader(viewModel: ProfileViewModel(user: user))
                    .padding()
                
                if let currentProfileID = user.id {
                    PostGridView(config: .profile(currentProfileID))
                }
            }
        }
    }
}
