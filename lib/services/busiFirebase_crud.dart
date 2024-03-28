// CRUSD fo bus
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_busi/models/busiBus.dart';
import 'dart:convert';

// ref to firebase collectio n
class BusiFirebase_crud {
  final CollectionReference busiBusCollection =
      // Add the collection in our firestore DB -> it's crete it for us !
      FirebaseFirestore.instance.collection('Buses');
  // 1- Create
  Future createBus({BusiBus? busAdd}) async {
    if (busAdd != null) {
      // refrence to Doc
      final busDoc = FirebaseFirestore.instance.collection('Buses').doc();
      // convert model obj to json data by:
      final json = busAdd.toJson();
      //create doc
      await busDoc.set(json);
    } else {
      // Handle the case where busAdd is null
      print('busAdd is null');
    }
  }

  // 2- Read:
  Stream<List<BusiBus>> busRead() =>
      FirebaseFirestore.instance.collection('Buses').snapshots().map((snapshot)
       => snapshot.docs.map((doc) => BusiBus.fromJson(doc.data())).toList());
}
