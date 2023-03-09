//
//  TableModel.swift
//  FifaBattle
//
//  Created by Sharma McGavin on 06/03/2023.
//

//import Foundation
//import Firebase
//
//class TableModel: ObservableObject {
//
//    @Published var table = [ScoreRecord]()
//
//    func addData(playerGoals: Int, opponentGoals: Int) {
//        let db = Firestore.firestore()
//
//        //Add Documents to a collection
//        db.collection("tables").addDocument(data: ["playerGoals":playerGoals,  "opponentGoals":opponentGoals]) { error in
//
//            if error == nil {
//                //call get data to retrieve latest data
//                self.getData()
//            } else {
//                //Handle Error
//            }
//        }
//    }
//    func updateData(tableUpdate: Table) {
//        let db = Firestore.firestore()
//
//        db.collection("tables").document(tableUpdate.id).setData(["goals": ,"points": ], merge: true) { error in
//            if error == nil
//                //Get data
//            self.getData()
//        }
//    }
//
//    func getData() {
//        //Get reference to the database
//        let db = Firestore.firestore()
//
//        //Read documents in a collection
//        db.collection("tables").getDocuments { snapshot, error in
//
//            //checking for errors
//            if error == nil {
//                //No error
//
//                if let snapshot = snapshot {
//
//                    //Update the table on the main view
//                    DispatchQueue.main.async {
//                        //Get all documents and create a table
//                        self.table = snapshot.documents.map { d in
//                            //Create a ScoreRecord for each document returned
//                            ScoreRecord(id: d.documentID,
//                                        name: d["name"] as? String ?? "",
//                                        goals: d["goals"] as? Int ?? 0,
//                                        points: d["points"] as? Int ?? 0)
//                        }
//                    }
//
//                }
//            }
//            else {
//                //Handle Error
//            }
//        }
//    }
//}
