import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReportsRecord extends FirestoreRecord {
  UserReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "inappropriateContent_isTrue" field.
  bool? _inappropriateContentIsTrue;
  bool get inappropriateContentIsTrue => _inappropriateContentIsTrue ?? false;
  bool hasInappropriateContentIsTrue() => _inappropriateContentIsTrue != null;

  // "abuseOrHarassment_isTrue" field.
  bool? _abuseOrHarassmentIsTrue;
  bool get abuseOrHarassmentIsTrue => _abuseOrHarassmentIsTrue ?? false;
  bool hasAbuseOrHarassmentIsTrue() => _abuseOrHarassmentIsTrue != null;

  // "impersonation_isTrue" field.
  bool? _impersonationIsTrue;
  bool get impersonationIsTrue => _impersonationIsTrue ?? false;
  bool hasImpersonationIsTrue() => _impersonationIsTrue != null;

  // "spam_isTrue" field.
  bool? _spamIsTrue;
  bool get spamIsTrue => _spamIsTrue ?? false;
  bool hasSpamIsTrue() => _spamIsTrue != null;

  // "other_isTrue" field.
  bool? _otherIsTrue;
  bool get otherIsTrue => _otherIsTrue ?? false;
  bool hasOtherIsTrue() => _otherIsTrue != null;

  // "reportedTime" field.
  DateTime? _reportedTime;
  DateTime? get reportedTime => _reportedTime;
  bool hasReportedTime() => _reportedTime != null;

  // "explanation" field.
  String? _explanation;
  String get explanation => _explanation ?? '';
  bool hasExplanation() => _explanation != null;

  // "messageContent" field.
  String? _messageContent;
  String get messageContent => _messageContent ?? '';
  bool hasMessageContent() => _messageContent != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "imageContent" field.
  String? _imageContent;
  String get imageContent => _imageContent ?? '';
  bool hasImageContent() => _imageContent != null;

  // "videoContent" field.
  String? _videoContent;
  String get videoContent => _videoContent ?? '';
  bool hasVideoContent() => _videoContent != null;

  // "reportedUserRef" field.
  DocumentReference? _reportedUserRef;
  DocumentReference? get reportedUserRef => _reportedUserRef;
  bool hasReportedUserRef() => _reportedUserRef != null;

  // "reporterUserRef" field.
  DocumentReference? _reporterUserRef;
  DocumentReference? get reporterUserRef => _reporterUserRef;
  bool hasReporterUserRef() => _reporterUserRef != null;

  // "inappropriateDescription_isTrue" field.
  bool? _inappropriateDescriptionIsTrue;
  bool get inappropriateDescriptionIsTrue =>
      _inappropriateDescriptionIsTrue ?? false;
  bool hasInappropriateDescriptionIsTrue() =>
      _inappropriateDescriptionIsTrue != null;

  // "reviewed" field.
  bool? _reviewed;
  bool get reviewed => _reviewed ?? false;
  bool hasReviewed() => _reviewed != null;

  void _initializeFields() {
    _inappropriateContentIsTrue =
        snapshotData['inappropriateContent_isTrue'] as bool?;
    _abuseOrHarassmentIsTrue =
        snapshotData['abuseOrHarassment_isTrue'] as bool?;
    _impersonationIsTrue = snapshotData['impersonation_isTrue'] as bool?;
    _spamIsTrue = snapshotData['spam_isTrue'] as bool?;
    _otherIsTrue = snapshotData['other_isTrue'] as bool?;
    _reportedTime = snapshotData['reportedTime'] as DateTime?;
    _explanation = snapshotData['explanation'] as String?;
    _messageContent = snapshotData['messageContent'] as String?;
    _name = snapshotData['name'] as String?;
    _imageContent = snapshotData['imageContent'] as String?;
    _videoContent = snapshotData['videoContent'] as String?;
    _reportedUserRef = snapshotData['reportedUserRef'] as DocumentReference?;
    _reporterUserRef = snapshotData['reporterUserRef'] as DocumentReference?;
    _inappropriateDescriptionIsTrue =
        snapshotData['inappropriateDescription_isTrue'] as bool?;
    _reviewed = snapshotData['reviewed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_reports');

  static Stream<UserReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserReportsRecord.fromSnapshot(s));

  static Future<UserReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserReportsRecord.fromSnapshot(s));

  static UserReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserReportsRecordData({
  bool? inappropriateContentIsTrue,
  bool? abuseOrHarassmentIsTrue,
  bool? impersonationIsTrue,
  bool? spamIsTrue,
  bool? otherIsTrue,
  DateTime? reportedTime,
  String? explanation,
  String? messageContent,
  String? name,
  String? imageContent,
  String? videoContent,
  DocumentReference? reportedUserRef,
  DocumentReference? reporterUserRef,
  bool? inappropriateDescriptionIsTrue,
  bool? reviewed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'inappropriateContent_isTrue': inappropriateContentIsTrue,
      'abuseOrHarassment_isTrue': abuseOrHarassmentIsTrue,
      'impersonation_isTrue': impersonationIsTrue,
      'spam_isTrue': spamIsTrue,
      'other_isTrue': otherIsTrue,
      'reportedTime': reportedTime,
      'explanation': explanation,
      'messageContent': messageContent,
      'name': name,
      'imageContent': imageContent,
      'videoContent': videoContent,
      'reportedUserRef': reportedUserRef,
      'reporterUserRef': reporterUserRef,
      'inappropriateDescription_isTrue': inappropriateDescriptionIsTrue,
      'reviewed': reviewed,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserReportsRecordDocumentEquality implements Equality<UserReportsRecord> {
  const UserReportsRecordDocumentEquality();

  @override
  bool equals(UserReportsRecord? e1, UserReportsRecord? e2) {
    return e1?.inappropriateContentIsTrue == e2?.inappropriateContentIsTrue &&
        e1?.abuseOrHarassmentIsTrue == e2?.abuseOrHarassmentIsTrue &&
        e1?.impersonationIsTrue == e2?.impersonationIsTrue &&
        e1?.spamIsTrue == e2?.spamIsTrue &&
        e1?.otherIsTrue == e2?.otherIsTrue &&
        e1?.reportedTime == e2?.reportedTime &&
        e1?.explanation == e2?.explanation &&
        e1?.messageContent == e2?.messageContent &&
        e1?.name == e2?.name &&
        e1?.imageContent == e2?.imageContent &&
        e1?.videoContent == e2?.videoContent &&
        e1?.reportedUserRef == e2?.reportedUserRef &&
        e1?.reporterUserRef == e2?.reporterUserRef &&
        e1?.inappropriateDescriptionIsTrue ==
            e2?.inappropriateDescriptionIsTrue &&
        e1?.reviewed == e2?.reviewed;
  }

  @override
  int hash(UserReportsRecord? e) => const ListEquality().hash([
        e?.inappropriateContentIsTrue,
        e?.abuseOrHarassmentIsTrue,
        e?.impersonationIsTrue,
        e?.spamIsTrue,
        e?.otherIsTrue,
        e?.reportedTime,
        e?.explanation,
        e?.messageContent,
        e?.name,
        e?.imageContent,
        e?.videoContent,
        e?.reportedUserRef,
        e?.reporterUserRef,
        e?.inappropriateDescriptionIsTrue,
        e?.reviewed
      ]);

  @override
  bool isValidKey(Object? o) => o is UserReportsRecord;
}
