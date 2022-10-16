// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dam_arenas/components/custom_text.dart';
// import 'package:flutter/material.dart';

// class AdminService extends StatelessWidget {
//   final String documentId;

//   AdminService(this.documentId);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('Arenas');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Arena'),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: users.doc(documentId).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Something went wrong");
//           }
//           if (snapshot.hasData && !snapshot.data.exists) {
//             return Text("Document does not exist");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data?.data() as Map<String, dynamic>;
//             return Column(
//               children: [
//                 SizedBox(height: 50,),
//                 CustomText(text: "Full Name: ${data['name']}",fontSize: 25,),
//                 SizedBox(height: 50,),
//                 CustomText(text: "price: ${data['price']}",),
//               ],
//             );
//           }
//           return Text("loading");
//         },
//       ),
//     );
//   }
// }
