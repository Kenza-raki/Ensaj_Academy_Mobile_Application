import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Reservation {
  String id;
  String name;
  String email;
  String phoneNumber;

  DateTime date;
  Timestamp updatedAt;

  Reservation(
      {required this.date,
      required this.email,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.updatedAt});

  Map<String, dynamic> toJson() => {
        'updatedAt': updatedAt,
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'date': date,
      };
}