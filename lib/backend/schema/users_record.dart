import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "teamNum" field.
  String? _teamNum;
  String get teamNum => _teamNum ?? '';
  bool hasTeamNum() => _teamNum != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "teamName" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "nextAPId" field.
  String? _nextAPId;
  String get nextAPId => _nextAPId ?? '';
  bool hasNextAPId() => _nextAPId != null;

  // "futureAPIds" field.
  List<String>? _futureAPIds;
  List<String> get futureAPIds => _futureAPIds ?? const [];
  bool hasFutureAPIds() => _futureAPIds != null;

  // "teamLeader" field.
  bool? _teamLeader;
  bool get teamLeader => _teamLeader ?? false;
  bool hasTeamLeader() => _teamLeader != null;

  // "matchNotifs" field.
  bool? _matchNotifs;
  bool get matchNotifs => _matchNotifs ?? false;
  bool hasMatchNotifs() => _matchNotifs != null;

  // "eventNotifs" field.
  bool? _eventNotifs;
  bool get eventNotifs => _eventNotifs ?? false;
  bool hasEventNotifs() => _eventNotifs != null;

  // "emailNotifs" field.
  bool? _emailNotifs;
  bool get emailNotifs => _emailNotifs ?? false;
  bool hasEmailNotifs() => _emailNotifs != null;

  // "compType" field.
  String? _compType;
  String get compType => _compType ?? '';
  bool hasCompType() => _compType != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "checklistNotifs" field.
  bool? _checklistNotifs;
  bool get checklistNotifs => _checklistNotifs ?? false;
  bool hasChecklistNotifs() => _checklistNotifs != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "real_name" field.
  String? _realName;
  String get realName => _realName ?? '';
  bool hasRealName() => _realName != null;

  // "verifiedOnTeam" field.
  bool? _verifiedOnTeam;
  bool get verifiedOnTeam => _verifiedOnTeam ?? false;
  bool hasVerifiedOnTeam() => _verifiedOnTeam != null;

  // "grade" field.
  String? _grade;
  String get grade => _grade ?? '';
  bool hasGrade() => _grade != null;

  // "teamRef" field.
  DocumentReference? _teamRef;
  DocumentReference? get teamRef => _teamRef;
  bool hasTeamRef() => _teamRef != null;

  // "blockedUsers" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _teamNum = snapshotData['teamNum'] as String?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _teamName = snapshotData['teamName'] as String?;
    _nextAPId = snapshotData['nextAPId'] as String?;
    _futureAPIds = getDataList(snapshotData['futureAPIds']);
    _teamLeader = snapshotData['teamLeader'] as bool?;
    _matchNotifs = snapshotData['matchNotifs'] as bool?;
    _eventNotifs = snapshotData['eventNotifs'] as bool?;
    _emailNotifs = snapshotData['emailNotifs'] as bool?;
    _compType = snapshotData['compType'] as String?;
    _teamID = castToType<int>(snapshotData['teamID']);
    _region = snapshotData['region'] as String?;
    _checklistNotifs = snapshotData['checklistNotifs'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _realName = snapshotData['real_name'] as String?;
    _verifiedOnTeam = snapshotData['verifiedOnTeam'] as bool?;
    _grade = snapshotData['grade'] as String?;
    _teamRef = snapshotData['teamRef'] as DocumentReference?;
    _blockedUsers = getDataList(snapshotData['blockedUsers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? teamNum,
  String? role,
  String? title,
  String? teamName,
  String? nextAPId,
  bool? teamLeader,
  bool? matchNotifs,
  bool? eventNotifs,
  bool? emailNotifs,
  String? compType,
  int? teamID,
  String? region,
  bool? checklistNotifs,
  String? photoUrl,
  String? realName,
  bool? verifiedOnTeam,
  String? grade,
  DocumentReference? teamRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'teamNum': teamNum,
      'role': role,
      'title': title,
      'teamName': teamName,
      'nextAPId': nextAPId,
      'teamLeader': teamLeader,
      'matchNotifs': matchNotifs,
      'eventNotifs': eventNotifs,
      'emailNotifs': emailNotifs,
      'compType': compType,
      'teamID': teamID,
      'region': region,
      'checklistNotifs': checklistNotifs,
      'photo_url': photoUrl,
      'real_name': realName,
      'verifiedOnTeam': verifiedOnTeam,
      'grade': grade,
      'teamRef': teamRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.teamNum == e2?.teamNum &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.teamName == e2?.teamName &&
        e1?.nextAPId == e2?.nextAPId &&
        listEquality.equals(e1?.futureAPIds, e2?.futureAPIds) &&
        e1?.teamLeader == e2?.teamLeader &&
        e1?.matchNotifs == e2?.matchNotifs &&
        e1?.eventNotifs == e2?.eventNotifs &&
        e1?.emailNotifs == e2?.emailNotifs &&
        e1?.compType == e2?.compType &&
        e1?.teamID == e2?.teamID &&
        e1?.region == e2?.region &&
        e1?.checklistNotifs == e2?.checklistNotifs &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.realName == e2?.realName &&
        e1?.verifiedOnTeam == e2?.verifiedOnTeam &&
        e1?.grade == e2?.grade &&
        e1?.teamRef == e2?.teamRef &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.teamNum,
        e?.role,
        e?.title,
        e?.teamName,
        e?.nextAPId,
        e?.futureAPIds,
        e?.teamLeader,
        e?.matchNotifs,
        e?.eventNotifs,
        e?.emailNotifs,
        e?.compType,
        e?.teamID,
        e?.region,
        e?.checklistNotifs,
        e?.photoUrl,
        e?.realName,
        e?.verifiedOnTeam,
        e?.grade,
        e?.teamRef,
        e?.blockedUsers
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
