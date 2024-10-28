import SwiftUI

struct ProfileView: View {
    
    @Environment(AppRouter.self) private var appRouter
    @State private var selectedTab: Tab = .profile
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
                    
                    NavigationLink(destination: LanguageView()) {
                        MainButton(buttonText: LocalizedStringKey("Language"), showIconImage: true)
                            .padding(19)
                            .padding(.bottom, 180)
                    }
                    
                    
                    VStack(alignment: .center, spacing: 28) {
                        NavigationLink(destination: TermsView()) {
                                        MainButton(buttonText: LocalizedStringKey("Terms & Conditions"), showIconImage: true)
                        }
                        MainButton(buttonText: LocalizedStringKey("Sign Out"), showIconImage: true, iconImageName: "iphone.and.arrow.forward.inward")
                    }
                    .padding(19)
                    .padding(.bottom, 24)
                    
//                    VStack {
//                        Spacer()
//                                            
//                        CustomTabBarView()
//                            .ignoresSafeArea(edges: .bottom)
//                    }
//                    .ignoresSafeArea()
                }
            }
            //.navigationBarTitle(Text(LocalizedStringKey("Profile")))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileView()
        .environment(AppRouter())
}
