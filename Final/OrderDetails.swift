import Foundation
import SwiftUI

struct OrderDetails: View {
    //@ObservedObject var order = Order()
    //command+control+space to add emoji when adding buttons for mood
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack{
                        //Order Details
                        //Order description
                        //EDIT BUTTON
                        //Price
                        //EDIT PRICE
                        //TOGGLES FOR:
                        //Completed
                        //Invoice Sent
                        //Paid
                        //Order Status
                        //Select One:
                        //Quoted
                        //Active
                        //Invoiced
                        //Paid
                    }
                }
/*
                Section {
                    NavigationLink(destination: Orders) {
                        Text("Back to All Orders")
                    }
                }

                Section {
                    NavigationLink(destination: ContentView) {
                        Text("Home")
                    }
                }
 */
 }
            .navigationBarTitle("Order Number 0")
        }
    }
}

 
 struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails()
    }
 }

