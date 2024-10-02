import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerificationMessagesRecord extends FirestoreRecord {
  VerificationMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "message" field.
  int? _message;
  int get message => _message ?? 0;
  bool hasMessage() => _message != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "teamNum" field.
  String? _teamNum;
  String get teamNum => _teamNum ?? '';
  bool hasTeamNum() => _teamNum != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _message = castToType<int>(snapshotData['message']);
    _userID = snapshotData['userID'] as String?;
    _teamID = castToType<int>(snapshotData['teamID']);
    _teamNum = snapshotData['teamNum'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verificationMessages');

  static Stream<VerificationMessagesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => VerificationMessagesRecord.fromSnapshot(s));

  static Future<VerificationMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VerificationMessagesRecord.fromSnapshot(s));

  static VerificationMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerificationMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerificationMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerificationMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerificationMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerificationMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerificationMessagesRecordData({
  DateTime? date,
  int? message,
  String? userID,
  int? teamID,
  String? teamNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'message': message,
      'userID': userID,
      'teamID': teamID,
      'teamNum': teamNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerificationMessagesRecordDocumentEquality
    implements Equality<VerificationMessagesRecord> {
  const VerificationMessagesRecordDocumentEquality();

  @override
  bool equals(VerificationMessagesRecord? e1, VerificationMessagesRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.message == e2?.message &&
        e1?.userID == e2?.userID &&
        e1?.teamID == e2?.teamID &&
        e1?.teamNum == e2?.teamNum;
  }

  @override
  int hash(VerificationMessagesRecord? e) => const ListEquality()
      .hash([e?.date, e?.message, e?.userID, e?.teamID, e?.teamNum]);

  @override
  bool isValidKey(Object? o) => o is VerificationMessagesRecord;
}
