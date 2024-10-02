import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RevealsRecord extends FirestoreRecord {
  RevealsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "posted" field.
  DateTime? _posted;
  DateTime? get posted => _posted;
  bool hasPosted() => _posted != null;

  // "thumbnailUrl" field.
  String? _thumbnailUrl;
  String get thumbnailUrl => _thumbnailUrl ?? '';
  bool hasThumbnailUrl() => _thumbnailUrl != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _link = snapshotData['link'] as String?;
    _name = snapshotData['name'] as String?;
    _posted = snapshotData['posted'] as DateTime?;
    _thumbnailUrl = snapshotData['thumbnailUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reveals');

  static Stream<RevealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RevealsRecord.fromSnapshot(s));

  static Future<RevealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RevealsRecord.fromSnapshot(s));

  static RevealsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RevealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RevealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RevealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RevealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RevealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRevealsRecordData({
  String? id,
  String? link,
  String? name,
  DateTime? posted,
  String? thumbnailUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'link': link,
      'name': name,
      'posted': posted,
      'thumbnailUrl': thumbnailUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class RevealsRecordDocumentEquality implements Equality<RevealsRecord> {
  const RevealsRecordDocumentEquality();

  @override
  bool equals(RevealsRecord? e1, RevealsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.link == e2?.link &&
        e1?.name == e2?.name &&
        e1?.posted == e2?.posted &&
        e1?.thumbnailUrl == e2?.thumbnailUrl;
  }

  @override
  int hash(RevealsRecord? e) => const ListEquality()
      .hash([e?.id, e?.link, e?.name, e?.posted, e?.thumbnailUrl]);

  @override
  bool isValidKey(Object? o) => o is RevealsRecord;
}
