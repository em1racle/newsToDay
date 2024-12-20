//
//  TermsView.swift
//  newsToDay
//
//  Created by Emir Byashimov on 24.10.2024.
//

import SwiftUI

struct TermsView: View {

    @Environment(AppRouter.self) private var appRouter
    @Environment(\.presentationMode) var presentationMode
    var languageManager = LanguageManager()
    let termsEn: String = """
Welcome to NewsToDay. 

    These Terms & Conditions (“Terms”) govern your use of our news application (“App”) and the services provided therein. By downloading, accessing, or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the App.
    
    1. Acceptance of Terms
    By accessing or using NewsToDay, you agree to these Terms, which form a legally binding agreement between you and NewsToDay (“we”, “us”, “our”). These Terms apply to all users of the App.

    2. Modifications to Terms
    We reserve the right to modify or update these Terms at any time. Changes will take effect upon posting within the App. It is your responsibility to check these Terms periodically for updates. Your continued use of the App after any changes indicates your acceptance of the new Terms.

    3. Use of the App
        • You must be at least 13 years old to use the App. By using the App, you confirm that you are either at least 13 years of age or have obtained permission from a parent or legal guardian.
        • You agree to use the App in compliance with applicable laws and not for any unlawful or prohibited activities.
        • We reserve the right to suspend or terminate your access to the App at any time for any reason, including violations of these Terms.

    4. User Accounts
        • You may need to create an account to access certain features of the App. You are responsible for maintaining the confidentiality of your account and password and for restricting access to your device.
        • You agree to provide accurate, current, and complete information when creating your account and to update it as necessary.

    5. Content and Intellectual Property
        • All content, including text, images, videos, news articles, logos, and trademarks provided in the App (collectively, “Content”), is the property of NewsToDay or its licensors and is protected by copyright, trademark, and other intellectual property laws.
        • You may not use, copy, modify, or distribute the Content without prior written consent from NewsToDay.

    6. User-Generated Content
        • If you submit or upload any content to the App (e.g., comments, feedback), you grant us a worldwide, non-exclusive, royalty-free, perpetual, and irrevocable license to use, modify, reproduce, and distribute such content in connection with the App.
        • You are solely responsible for the content you upload and must ensure it does not infringe the rights of others or violate any laws.

    7. Third-Party Links
    The App may contain links to third-party websites or services. We do not control and are not responsible for the content, policies, or practices of these third-party websites. Your use of third-party websites is at your own risk, and you should review their respective terms and privacy policies.

    8. Disclaimer of Warranties
        • The App and all Content are provided “as is” and “as available” without any warranties of any kind, either express or implied.
        • We do not warrant that the App will be uninterrupted, secure, or free of errors, viruses, or other harmful components.

    9. Limitation of Liability
    To the fullest extent permitted by law, NewsToDay shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of your use of the App or any Content, even if we have been advised of the possibility of such damages.

    10. Indemnification
    You agree to indemnify, defend, and hold harmless NewsToDay and its affiliates from any claims, damages, losses, liabilities, and expenses (including legal fees) arising out of your use of the App, violation of these Terms, or infringement of any third-party rights.

    11. Termination
    We reserve the right to terminate or suspend your access to the App without notice or liability for any reason, including if you breach these Terms.
"""
    
    var termsRu = """
    Добро пожаловать на NewsToDay.

    Настоящие Правила и условия (“Условия”) регулируют использование вами нашего новостного приложения (“Приложение”) и предоставляемых в нем услуг. Загружая Приложение, получая доступ к нему или используя его, вы соглашаетесь соблюдать настоящие Условия. Если вы не согласны с этими Условиями, пожалуйста, не используйте приложение.
                
    1. Принятие Условий
                Получая доступ к NewsToDay или используя его, вы соглашаетесь с настоящими Условиями, которые образуют юридически обязательное соглашение между вами и NewsToDay (“мы”, “нас”, “наш”). Эти Условия распространяются на всех пользователей приложения.

    2. Изменения Условий
                Мы оставляем за собой право изменять или обновлять настоящие Условия в любое время. Изменения вступят в силу после публикации в Приложении. Вы несете ответственность за периодическую проверку этих Условий на наличие обновлений. Ваше дальнейшее использование Приложения после любых изменений означает ваше согласие с новыми условиями.

    3. Использование приложения
                    • Для использования приложения вам должно быть не менее 13 лет. Используя приложение, вы подтверждаете, что вам исполнилось не менее 13 лет или что вы получили разрешение от родителей или законного опекуна.
                    • Вы соглашаетесь использовать Приложение в соответствии с действующим законодательством, а не для каких-либо незаконных или запрещенных действий.
                    • Мы оставляем за собой право приостановить или прекратить ваш доступ к Приложению в любое время по любой причине, включая нарушение настоящих Условий.

    4. Учетные записи пользователей
                    • Возможно, вам потребуется создать учетную запись для доступа к определенным функциям приложения. Вы несете ответственность за сохранение конфиденциальности вашей учетной записи и пароля, а также за ограничение доступа к вашему устройству.
                    • Вы соглашаетесь предоставлять точную, актуальную и полную информацию при создании своей учетной записи и обновлять ее по мере необходимости.

    5. Контент и интеллектуальная собственность
                    • Весь контент, включая текст, изображения, видео, новостные статьи, логотипы и товарные знаки, представленные в Приложении (совместно именуемые “Контент”), является собственностью NewsToDay или ее лицензиаров и защищен законами об авторском праве, товарных знаках и других законах об интеллектуальной собственности.
                    • Вы не имеете права использовать, копировать, изменять или распространять Контент без предварительного письменного согласия NewsToDay.

    6. Пользовательский контент
                    • Если вы отправляете или загружаете какой-либо контент в Приложение (например, комментарии, отзывы), вы предоставляете нам всемирную, неисключительную, безвозмездную, бессрочную и безотзывную лицензию на использование, изменение, воспроизведение и распространение такого контента в связи с Приложением.
                    • Вы несете единоличную ответственность за загружаемый вами контент и должны убедиться, что он не ущемляет права других лиц и не нарушает какие-либо законы.

    7. Ссылки на сторонние сайты
                Приложение может содержать ссылки на сторонние веб-сайты или сервисы. Мы не контролируем и не несем ответственности за содержание, политику или действия этих сторонних веб-сайтов. Вы используете сторонние веб-сайты на свой страх и риск, и вам следует ознакомиться с их соответствующими условиями и политиками конфиденциальности.

    8. Отказ от гарантий
                    • Приложение и весь Контент предоставляются “как есть” и “как доступно” без каких-либо гарантий любого рода, явных или подразумеваемых.
                    • Мы не гарантируем, что приложение будет работать бесперебойно, безопасно или не будет содержать ошибок, вирусов или других вредоносных компонентов.

    9. Ограничение ответственности
                В максимально возможной степени, разрешенной законом, NewsToDay не несет ответственности за какие-либо косвенные, случайные, специальные, логически вытекающие убытки или штрафные санкции, возникающие в результате использования вами Приложения или любого Контента, даже если мы были предупреждены о возможности такого ущерба.

    10. Компенсация
                Вы соглашаетесь возместить ущерб, защитить и обезопасить NewsToDay и ее аффилированных лиц от любых претензий, ущерба, убытков, ответственности и расходов (включая судебные издержки), возникающих в результате использования вами Приложения, нарушения настоящих Условий или ущемления любых прав третьих лиц.

    11. Прекращение действия
                Мы оставляем за собой право прекратить или приостановить ваш доступ к Приложению без предварительного уведомления или какой-либо ответственности по любой причине, в том числе в случае нарушения вами настоящих Условий.
"""
    
    var body: some View {
            NavigationView {
                ScrollView {
                    Text(languageManager.currentLanguage == "en" ? termsEn : termsRu)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.greyDark)
                        .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.gray)
                                .font(.title3.weight(.medium))
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Terms & Conditions")
                            .font(.headline)
                            .frame(height: 24)
                    }
                }
                .padding(20)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    #Preview {
        TermsView()
            .environment(AppRouter())
    }
