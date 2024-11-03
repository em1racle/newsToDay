import SwiftUI

struct ProfileView: View {
    
    var langText: LocalizedStringKey = "Language"
    var termsText: LocalizedStringKey = "Terms & Conditions"
    
    @State private var selectedTab: Tab = .profile
    @State private var profileImage: Image? = Image(systemName: "person.circle.fill")
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    
                    Text("Profile")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.top, 20)
                            .padding(.leading, 20)
                    
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
                        ZStack{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.greyLighter)
                                .frame(height: 64)
                                .padding(19)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Text(langText)
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.greyDark)
                                    .lineLimit(1)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 32)
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.greyDark)
                                    .frame(width: 24)
                                    .imageScale(.large)
                                    .padding(.trailing, 35)
                            }
                        }
                        .padding(.bottom, 60)
                    }
                    
                    
                    VStack(alignment: .center, spacing: 28) {
                        NavigationLink(destination: TermsView()) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(.greyLighter)
                                    .frame(height: 64)
                                
                                HStack(alignment: .center, spacing: 10) {
                                    Text(termsText)
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .foregroundColor(.greyDark)
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 13)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.greyDark)
                                        .frame(width: 24)
                                        .imageScale(.large)
                                        .padding(.trailing, 16)
                                }
                            }
                        }
                        MainButton(buttonText: LocalizedStringKey("Sign Out"), showIconImage: true, iconImageName: "iphone.and.arrow.forward.inward")
                    }
                    .padding(19)
                    .padding(.bottom, 24)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileView()
}
