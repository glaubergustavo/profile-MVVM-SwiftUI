//
//  ProfileView.swift
//  Profile
//
//  Created by Glauber Gustavo on 13/10/22.
//

import SwiftUI

//MARK: - View
struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack{
            
            //Perfil
            Image(viewModel.user.avatarURL)
                .resizable()
                .frame(width: 250, height: 250)
//                .padding(.bottom, 10)
                .cornerRadius(125)
            
            Text(viewModel.user.name)
                .font(.system(size: 40, weight: .bold))
            
            Text(viewModel.user.role)
                .font(.system(size: 23, weight: .regular))
                .foregroundColor(.gray)
            
            Text("22.643K")
                .font(.system(size: 80, weight: .light))
                .padding(40)
            
            VStack{
                
                //Seguir
                Button{ viewModel.followToogle() } label: {
                    Label(!viewModel.isFollowing ? "follow" : "unfollow", systemImage: "")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(!viewModel.isFollowing ? .blue : .black)
                
                //Enviar Mensagem
                Button{} label: {
                    Label("send message", systemImage: "")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(!viewModel.isFollowing)
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
