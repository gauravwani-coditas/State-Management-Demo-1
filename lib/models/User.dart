

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();



class User{

  User(this.userName,this.userEmail,this.userPhoneNo,this.userAddress):id=uuid.v4();
  
  String id;
  String userName;
  String userEmail;
  String userPhoneNo;
  String userAddress;

}