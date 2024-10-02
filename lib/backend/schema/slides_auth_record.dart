import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlidesAuthRecord extends FirestoreRecord {
  SlidesAuthRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "scanned" field.
  bool? _scanned;
  bool get scanned => _scanned ?? false;
  bool hasScanned() => _scanned != null;

  void _initializeFields() {
    _token = snapshotData['token'] as String?;
    _teamID = castToType<int>(snapshotData['teamID']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _scanned = snapshotData['scanned'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('slidesAuth');

  static Stream<SlidesAuthRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SlidesAuthRecord.fromSnapshot(s));

  static Future<SlidesAuthRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SlidesAuthRecord.fromSnapshot(s));

  static SlidesAuthRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SlidesAuthRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SlidesAuthRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SlidesAuthRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SlidesAuthRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SlidesAuthRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSlidesAuthRecordData({
  String? token,
  int? teamID,
  DateTime? timestamp,
  bool? scanned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'token': token,
      'teamID': teamID,
      'timestamp': timestamp,
      'scanned': scanned,
    }.withoutNulls,
  );

  return firestoreData;
}

class SlidesAuthRecordDocumentEquality implements Equality<SlidesAuthRecord> {
  const SlidesAuthRecordDocumentEquality();

  @override
  bool equals(SlidesAuthRecord? e1, SlidesAuthRecord? e2) {
    return e1?.token == e2?.token &&
        e1?.teamID == e2?.teamID &&
        e1?.timestamp == e2?.timestamp &&
        e1?.scanned == e2?.scanned;
  }

  @override
  int hash(SlidesAuthRecord? e) => const ListEquality()
      .hash([e?.token, e?.teamID, e?.timestamp, e?.scanned]);

  @override
  bool isValidKey(Object? o) => o is SlidesAuthRecord;
}
