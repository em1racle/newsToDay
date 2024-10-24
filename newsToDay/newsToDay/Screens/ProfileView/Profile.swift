import SwiftUI

struct ProfileView: View {
    
    @State private var profileImage: Image? = Image(systemName: "person.circle.fill")
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack {
                    Spacer().frame(height: 20)
                    
                    HStack(alignment: .center) {
                        profileImage?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                            .padding(.leading, 20)
                        
                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.blackPrimary)
                            Text(verbatim:"example@gmail.com")
                                .font(.system(size: 16))
                                .foregroundColor(.greyPrimary)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    MainButton(buttonText: "Language", showIconImage: true)
                        .padding(19)
                        .padding(.bottom, 180)
                    
                    
                    VStack(alignment: .center, spacing: 28) {
                        MainButton(buttonText: "Terms & Conditions", showIconImage: true)
                        MainButton(buttonText: "Sign Out", showIconImage: true, iconImageName: "iphone.and.arrow.forward.inward")
                    }
                    .padding(19)
                    .padding(.bottom, 124)
                }
            }
            .navigationBarTitle(Text("Profile"))
        }
    }
}

#Preview {
    ProfileView()
}
