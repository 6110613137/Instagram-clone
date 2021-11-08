//
//  ProfileHeader.swift
//  Instagram-clone
//
//  Created by Kunatip Satsomnuk on 7/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct ProfileHeader: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        if let imageURL = viewModel.user.profileImageURL {
                            KFImage(URL(string: imageURL))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizeTo(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        }
                    }
                    .sheet(isPresented: $imagePickerPresented) {
                        loadImage()
                    } content: {
                        ImagePicker(image: $selectedImage)
                    }
                }
                
                HStack(spacing: 16) {
                    UserStat(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStat(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStat(value: viewModel.user.stats?.following ?? 0, title: "Followering")
                }
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            HStack {
                Spacer()
                ProfileButtonView(viewModel: viewModel)
                Spacer()
            }
            .padding(.top)
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        viewModel.changeProfileImage(image: selectedImage)
    }
}
