// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference _bookmark =
    FirebaseFirestore.instance.collection("bookmark");
final CollectionReference _users =
    FirebaseFirestore.instance.collection('users');

class FirecloudStoreController {
  static Stream<QuerySnapshot> getData() {
    return _bookmark.snapshots();
  }

  Future<void> createbookmark(String imgUrl, String title, String author,
      String publisher, String date, String desc, BuildContext context) async {
    try {
      await _bookmark.add({
        'imgUrl': imgUrl,
        'title': title,
        'author': author,
        'publisher': publisher,
        'date': date,
        'desc': desc,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Bookmarked!"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something Error! ${e}"),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> deletebookmark(
      DocumentSnapshot? snapshot, BuildContext context) async {
    try {
      await _bookmark.doc(snapshot?.id).delete();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Success Delete!"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed!"),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> updatebookmark(
    DocumentSnapshot? snapshot,
    String imgUrl,
    String title,
    String author,
    String publisher,
    String date,
    String desc,
    BuildContext context,
  ) async {
    try {
      await _bookmark.doc(snapshot?.id).update({
        'imgUrl': imgUrl,
        'title': title,
        'author': author,
        'publisher': publisher,
        'date': date,
        'desc': desc,
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Updated!"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed To Update!"),
        backgroundColor: Colors.red,
      ));
    }
  }
}
