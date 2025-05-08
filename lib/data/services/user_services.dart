import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');

  Future<void> createUser(UserModel user) async {
    await usersCollection.doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String id) async {
    DocumentSnapshot doc = await usersCollection.doc(id).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> updateUser(UserModel user) async {
    await usersCollection.doc(user.id).update(user.toMap());
  }

  Future<void> deleteUser(String id) async {
    await usersCollection.doc(id).delete();
  }
}
