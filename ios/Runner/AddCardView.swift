//
//  AddCardView.swift
//  Runner
//
//  Created by Hamza Vedat Cengiz on 19.10.2023.
//

import SwiftUI
import Masterpass

struct AddCardView : View {
    @State private var username: String = ""
    var cardNumber = MPText();
    var cvc = MPText();
    var cardHolder = UITextField();
    var cardOwnerName = UITextField();
    var dateOfMonth = UITextField();
    var dateOfYear = UITextField();
    
    var body: some View {
        VStack(alignment: .leading, spacing:15){
            
            TextField(child:AnyView( EditTextView(editText: cardHolder)), title: "Kart Adı")
            TextField(child:AnyView( EditTextView(editText: cardOwnerName)), title: "Kart Üzerindeki İsim")
            TextField(child:AnyView( MPTextView(mpText:  cardNumber,mpTextType:MPTextType.cardNo)), title: "Kart Numarası")
            HStack(spacing: 15) {
                TextField(child:AnyView(EditTextView(editText: dateOfMonth)), title: "Ay").frame(width: 55)
                TextField(child:AnyView( EditTextView(editText: dateOfYear)), title: "Yıl").frame(width: 55)
                TextField(child:AnyView( MPTextView(mpText:  cvc,mpTextType: MPTextType.cvv)), title: "CVC/CVV").frame(width: 75)
                
            }
            HStack{
                Button(action: {
                    MasterPass.addCard("", accountKey: "", accountKeyType: AccountKeyType.id, rrn: "", userId: "", card: MPCard(cardNumber, cardHolder.text ?? "", cvc, (dateOfMonth.text ?? "")+(dateOfYear.text ?? "") ), cardAlias: "", isMsisdnValidatedByMerchant: nil, authenticationMethod: AuthType.none) { error, response in
                        
                    }
                }){
                    Text("Kaydet")
                        .frame(maxWidth: .infinity)
                    
                }.buttonStyle(CustomButtonStyle())
            }
            
            
            
        }.fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
        
    }
}

#Preview {
    AddCardView()
}



struct MPTextView: UIViewRepresentable {
    let mpText: MPText;
    var mpTextType: MPTextType?;
    func makeUIView(context: Context) -> MPText {
        mpText.type = mpTextType;
        mpText.font = UIFont.systemFont(ofSize: 14)
        return mpText
    }
    
    func updateUIView(_ mpTextView: MPText, context: Context) {
    }
}

struct EditTextView: UIViewRepresentable {
    let editText: UITextField;
    func makeUIView(context: Context) -> UITextField {
        editText.font = UIFont.systemFont(ofSize: 14)
        return editText
    }
    
    func updateUIView(_ mpTextView: UITextField, context: Context) {
    }
}

struct TextField : View {
    let child: AnyView
    let title: String
    
    var body: some View{
        VStack(alignment: .leading,spacing: 3){
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(Color.red)
            child
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.red)
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
