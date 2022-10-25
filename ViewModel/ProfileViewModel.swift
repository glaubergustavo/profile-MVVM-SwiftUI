//
//  ProfileViewModel.swift
//  Profile
//
//  Created by Glauber Gustavo on 18/10/22.
//

import Foundation

final class ProfileViewModel: BaseRequest, ObservableObject {
    
    var isFollowing = false
    
    var user = User(name: "Glauber Gustavo",
                    avatarURL: "profile_test",
                    role: "iOS Developer")
    
    func followToogle() {
        self.isFollowing.toggle()
    }
    
    func loadProfile(_ completion: @escaping (_ result: User?) -> Void) {
        
        super.request(method: .get,
                      endpoint: "",
                      responseType: User.self) { response, code in
            
            if let object = response, code == 200 {
                completion(object)
            }else{
                completion(nil)
            }
        }
    }
}
