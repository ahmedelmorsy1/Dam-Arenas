import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_arenas/Screens/home_page.dart';
import 'package:dam_arenas/model/user_model.dart';
import 'package:dam_arenas/services/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/firestore_user.dart';

class Auth extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? email, password, name;

  //TODO: 1 //to save the sign in
  Rxn<User> _user = Rxn<User>();
  get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  void signInWithEmail() async {
    try {
      await auth.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
      getData();
      Get.offAll(()=> ControlView(),arguments: getData());
      //Get.offAll(()=> ControlView());
      //Errors
      //print(UserModel(userId: user.user.uid));
      //print(user.user.uid);
      //print(user.uid);

    } catch (e) {
      print(e);
      Get.snackbar("error login Email", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmail() async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email.toString(),password: password.toString())
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(HomePage());
    } catch (e) {
      print(e);
      Get.snackbar("error login Email", 'e.message',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user?.uid,
      email: user.user?.email,
      name: name,
    ));
  }
  String getData(){
    final User? user =auth.currentUser;
    final uid = user!.uid;
    return uid;
  }
}
