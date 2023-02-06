import 'package:cloud_firestore/cloud_firestore.dart';

class VoliModel {
  DocumentReference docRef;
  String id;
  String logo1;
  String logo2;
  String skor1;
  String skor2;
  String tim1;
  String tim2;
  VoliModel({
    required this.docRef,
    required this.id,
    required this.logo1,
    required this.logo2,
    required this.skor1,
    required this.skor2,
    required this.tim1,
    required this.tim2,
  });

  factory VoliModel.fromJson(DocumentSnapshot snapshot) {
    return VoliModel(
      docRef: snapshot.reference,
      id: snapshot.id,
      logo1: snapshot['voli']['logo1'],
      logo2: snapshot['voli']['logo2'],
      skor1: snapshot['voli']['skor1'],
      skor2: snapshot['voli']['skor2'],
      tim1: snapshot['voli']['tim1'],
      tim2: snapshot['voli']['tim2'],
    );
  }
}
