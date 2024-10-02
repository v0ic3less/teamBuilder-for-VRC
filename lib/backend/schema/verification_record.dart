import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerificationRecord extends FirestoreRecord {
  VerificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "real_name" field.
  String? _realName;
  String get realName => _realName ?? '';
  bool hasRealName() => _realName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "team_number" field.
  String? _teamNumber;
  String get teamNumber => _teamNumber ?? '';
  bool hasTeamNumber() => _teamNumber != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "requestTime" field.
  DateTime? _requestTime;
  DateTime? get requestTime => _requestTime;
  bool hasRequestTime() => _requestTime != null;

  // "page_1_path" field.
  String? _page1Path;
  String get page1Path => _page1Path ?? '';
  bool hasPage1Path() => _page1Path != null;

  // "page_2_path" field.
  String? _page2Path;
  String get page2Path => _page2Path ?? '';
  bool hasPage2Path() => _page2Path != null;

  // "method" field.
  String? _method;
  String get method => _method ?? '';
  bool hasMethod() => _method != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _realName = snapshotData['real_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _teamNumber = snapshotData['team_number'] as String?;
    _teamID = castToType<int>(snapshotData['teamID']);
    _requestTime = snapshotData['requestTime'] as DateTime?;
    _page1Path = snapshotData['page_1_path'] as String?;
    _page2Path = snapshotData['page_2_path'] as String?;
    _method = snapshotData['method'] as String?;
    _location = snapshotData['location'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verification');

  static Stream<VerificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerificationRecord.fromSnapshot(s));

  static Future<VerificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VerificationRecord.fromSnapshot(s));

  static VerificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerificationRecordData({
  String? displayName,
  String? realName,
  String? uid,
  String? teamNumber,
  int? teamID,
  DateTime? requestTime,
  String? page1Path,
  String? page2Path,
  String? method,
  String? location,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'real_name': realName,
      'uid': uid,
      'team_number': teamNumber,
      'teamID': teamID,
      'requestTime': requestTime,
      'page_1_path': page1Path,
      'page_2_path': page2Path,
      'method': method,
      'location': location,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerificationRecordDocumentEquality
    implements Equality<VerificationRecord> {
  const VerificationRecordDocumentEquality();

  @override
  bool equals(VerificationRecord? e1, VerificationRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.realName == e2?.realName &&
        e1?.uid == e2?.uid &&
        e1?.teamNumber == e2?.teamNumber &&
        e1?.teamID == e2?.teamID &&
        e1?.requestTime == e2?.requestTime &&
        e1?.page1Path == e2?.page1Path &&
        e1?.page2Path == e2?.page2Path &&
        e1?.method == e2?.method &&
        e1?.location == e2?.location &&
        e1?.email == e2?.email;
  }

  @override
  int hash(VerificationRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.realName,
        e?.uid,
        e?.teamNumber,
        e?.teamID,
        e?.requestTime,
        e?.page1Path,
        e?.page2Path,
        e?.method,
        e?.location,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is VerificationRecord;
}
