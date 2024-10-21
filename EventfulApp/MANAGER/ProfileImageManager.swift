//
//  ProfileImageManager.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import SwiftUI
//import Kingfisher

struct ProfileImageManager: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImage {
//            KFImage(URL(string: imageUrl))
//                .resizable()
//                .scaledToFill()
//                .frame(width: size.dimension, height: size.dimension)
//                .clipShape(.circle)
        } else {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(.circle)
                .foregroundStyle(.ultraThickMaterial)
        }
    }
}
