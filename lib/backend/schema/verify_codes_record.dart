import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerifyCodesRecord extends FirestoreRecord {
  VerifyCodesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "requestDisplayName" field.
  String? _requestDisplayName;
  String get requestDisplayName => _requestDisplayName ?? '';
  bool hasRequestDisplayName() => _requestDisplayName != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "requestUID" field.
  String? _requestUID;
  String get requestUID => _requestUID ?? '';
  bool hasRequestUID() => _requestUID != null;

  // "requestTime" field.
  DateTime? _requestTime;
  DateTime? get requestTime => _requestTime;
  bool hasRequestTime() => _requestTime != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  void _initializeFields() {
    _requestDisplayName = snapshotData['requestDisplayName'] as String?;
    _teamID = castToType<int>(snapshotData['teamID']);
    _requestUID = snapshotData['requestUID'] as String?;
    _requestTime = snapshotData['requestTime'] as DateTime?;
    _code = snapshotData['code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verifyCodes');

  static Stream<VerifyCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerifyCodesRecord.fromSnapshot(s));

  static Future<VerifyCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VerifyCodesRecord.fromSnapshot(s));

  static VerifyCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerifyCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerifyCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerifyCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerifyCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerifyCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerifyCodesRecordData({
  String? requestDisplayName,
  int? teamID,
  String? requestUID,
  DateTime? requestTime,
  String? code,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requestDisplayName': requestDisplayName,
      'teamID': teamID,
      'requestUID': requestUID,
      'requestTime': requestTime,
      'code': code,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerifyCodesRecordDocumentEquality implements Equality<VerifyCodesRecord> {
  const VerifyCodesRecordDocumentEquality();

  @override
  bool equals(VerifyCodesRecord? e1, VerifyCodesRecord? e2) {
    return e1?.requestDisplayName == e2?.requestDisplayName &&
        e1?.teamID == e2?.teamID &&
        e1?.requestUID == e2?.requestUID &&
        e1?.requestTime == e2?.requestTime &&
        e1?.code == e2?.code;
  }

  @override
  int hash(VerifyCodesRecord? e) => const ListEquality().hash([
        e?.requestDisplayName,
        e?.teamID,
        e?.requestUID,
        e?.requestTime,
        e?.code
      ]);

  @override
  bool isValidKey(Object? o) => o is VerifyCodesRecord;
}
