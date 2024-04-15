import 'package:uuid/uuid.dart';

const uuid = Uuid();

class User {
  User(
      {required this.userName,
      required this.userEmail,
      required this.userPhoneNo,
      required this.userAddress})
      : id = uuid.v4();

  String id;
  String userName;
  String userEmail;
  String userPhoneNo;
  String userAddress;
}
