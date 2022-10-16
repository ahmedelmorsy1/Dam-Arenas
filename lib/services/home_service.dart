import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _arenaCollectionRef = 
  FirebaseFirestore.instance.collection('Arenas');

  Future<List<QueryDocumentSnapshot>> getBestArenas ()async{
    var value = await _arenaCollectionRef.get();
    return value.docs;
  }
}