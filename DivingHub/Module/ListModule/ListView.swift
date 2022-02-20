//
//  ListView.swift
//  practiece
//
//  Created by Anupat Insuvanno on 13/2/2565 BE.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var presenter:ListPresenter
    
    
    var body: some View {
        VStack{
            Text("Hello, worlsd!")
                .padding()
            Text("Yes").bold()
            Image(systemName: "heart.fill").resizable().foregroundColor(.red)
                .aspectRatio(contentMode: .fit)
            Button(action:  {
                presenter.updateState()
            }) {
                HStack{
                    Image(systemName: "trash")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text(presenter.username)
                }
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(presenter:ListPresenter())
    }
}
