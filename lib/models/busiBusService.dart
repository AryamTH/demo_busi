import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//final CollectionReference _mainCollection = _firestore.collection('notes');
// All Method and propiruty to ininteract eith firestore

class BusiDataBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * to define the user id to link it with his documents
  //final String schoolId;
  //BusiDataBaseService(this.schoolId) {}

  // collection refrence to particlar collection in Data Base(use when CRUD)
  // First Refrence for BUSES
  final CollectionReference busiBusCollection =
      // Add the collection in our firestore DB -> it's crete it for us !
      FirebaseFirestore.instance.collection('busiBus');
  // CRUD documents happinig by using this var: busiBusCollection
  // each user has documents
  // collectio inside it "Documents" and the documents have "Propreties"
  // each user have Uniqe id and each document for each user has the same ID!
  // if we use * we must add schoolId in parameter
  Future busiUAddBusrData(int busPlate, int busNumber, int basCapacity) async {
    return await busiBusCollection.doc().set({
      //pririties:ss
      'busPlate': busPlate,
      'busNumber': busNumber,
      'basCapacity': basCapacity,
    });
  }

  Future busiAddBusInfo(int busPlate, int busNumber, int basCapacity) async {
    try {
      // make request to firebase by instanse of req
      await busiBusCollection.doc().set({});
    } catch (e) {}
  }
  //get collection

  //CREATE: add new bus

  //READ: get the bus data from DB

  //UPDATE: update bus data in DB

  //DELETE: delete bus data from DB
}
