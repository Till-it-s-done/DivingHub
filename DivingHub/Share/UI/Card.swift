//
//  Section.swift
//  practiece
//
//  Created by Anupat Insuvanno on 19/2/2565 BE.
//

import Foundation
import SwiftUI

enum Card{
    enum Diggy{
        struct UI:View{
            var props:Model
            var body: some View{
                VStack{
                    Text(props.tag ?? "").padding()
                }
            }
        }
        struct Model{
            var tag:String?
            var title:String?
            var image:String?
            var backgroundHexColor:String?
            var rating:Int?
            var attributes:[String]?
        }
    }
    enum CompactPriceDolly{
        struct UI:View{
            var props:Model
            var body: some View{
                VStack{
                    Text(props.title ?? "").padding()
                    Text(String(props.price ?? 0)).padding()
                }
            }
        }
        struct Model{
            var title:String?
            var attributes:[String]?
            var price:Float?;
            var image:String?
            var backgroundHexColor:String?
            
        }
    }
    enum ProfileRatingDeelo{
        struct UI:View{
            var props:Model
            var body: some View{
                VStack{
                    Text(props.title ?? "").padding()
                }
            }
        }
        struct Model{
            var title:String?
            var rating:Int?
            var attributes:[String]?
            var subAttributes:[String]?
            var avatar:String?
            var backgroundHexColorForAvatar:String?
            var image:String?
            var backgroundHexColor:String?
            
        }
    }
    enum BasicTagglo{
        struct UI:View{
            var props:Model
            var body: some View{
                VStack{
                    Text(props.title ?? "").padding()
                }
            }
        }
        struct Model{
            var title:String?
            var rating:Int?
            var people:Int?
            var tagIcon:Icon?
            var tags:[String]?            
            
            
            var subAttributes:[String]?
            
            var avatar:String?
            var backgroundHexColorForAvatar:String?
            
            var image:String?
            var backgroundHexColor:String?
            
        }
    }
}
