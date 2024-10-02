import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotosRecord extends FirestoreRecord {
  PhotosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "folderName" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  bool hasFolderName() => _folderName != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  bool hasPath() => _path != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _folderName = snapshotData['folderName'] as String?;
    _path = snapshotData['path'] as String?;
    _userid = snapshotData['userid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('photos');

  static Stream<PhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotosRecord.fromSnapshot(s));

  static Future<PhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotosRecord.fromSnapshot(s));

  static PhotosRecord fromSnapshot(DocumentSnapshot snapshot) => PhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotosRecordData({
  DateTime? date,
  String? name,
  DocumentReference? userRef,
  String? folderName,
  String? path,
  String? userid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'name': name,
      'userRef': userRef,
      'folderName': folderName,
      'path': path,
      'userid': userid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotosRecordDocumentEquality implements Equality<PhotosRecord> {
  const PhotosRecordDocumentEquality();

  @override
  bool equals(PhotosRecord? e1, PhotosRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.name == e2?.name &&
        e1?.userRef == e2?.userRef &&
        e1?.folderName == e2?.folderName &&
        e1?.path == e2?.path &&
        e1?.userid == e2?.userid;
  }

  @override
  int hash(PhotosRecord? e) => const ListEquality()
      .hash([e?.date, e?.name, e?.userRef, e?.folderName, e?.path, e?.userid]);

  @override
  bool isValidKey(Object? o) => o is PhotosRecord;
}
