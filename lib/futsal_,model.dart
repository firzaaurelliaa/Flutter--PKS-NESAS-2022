import 'package:cloud_firestore/cloud_firestore.dart';

class FutsalModel {
  DocumentReference docRef;
  String id;
  String logo1;
  String logo2;
  String skor1;
  String skor2;
  String tim1;
  String tim2;
  FutsalModel({
    required this.docRef,
    required this.id,
    required this.logo1,
    required this.logo2,
    required this.skor1,
    required this.skor2,
    required this.tim1,
    required this.tim2,
  });

  factory FutsalModel.fromJson(DocumentSnapshot snapshot) {
    return FutsalModel(
      docRef: snapshot.reference,
      id: snapshot.id,
      logo1: snapshot['futsal']['logo1'],
      logo2: snapshot['futsal']['logo2'],
      skor1: snapshot['futsal']['skor1'],
      skor2: snapshot['futsal']['skor2'],
      tim1: snapshot['futsal']['tim1'],
      tim2: snapshot['futsal']['tim2'],
    );
  }
}
