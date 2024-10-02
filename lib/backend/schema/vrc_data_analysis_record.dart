import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VrcDataAnalysisRecord extends FirestoreRecord {
  VrcDataAnalysisRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "json" field.
  String? _json;
  String get json => _json ?? '';
  bool hasJson() => _json != null;

  void _initializeFields() {
    _json = snapshotData['json'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vrc-data-analysis');

  static Stream<VrcDataAnalysisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VrcDataAnalysisRecord.fromSnapshot(s));

  static Future<VrcDataAnalysisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VrcDataAnalysisRecord.fromSnapshot(s));

  static VrcDataAnalysisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VrcDataAnalysisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VrcDataAnalysisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VrcDataAnalysisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VrcDataAnalysisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VrcDataAnalysisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVrcDataAnalysisRecordData({
  String? json,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'json': json,
    }.withoutNulls,
  );

  return firestoreData;
}

class VrcDataAnalysisRecordDocumentEquality
    implements Equality<VrcDataAnalysisRecord> {
  const VrcDataAnalysisRecordDocumentEquality();

  @override
  bool equals(VrcDataAnalysisRecord? e1, VrcDataAnalysisRecord? e2) {
    return e1?.json == e2?.json;
  }

  @override
  int hash(VrcDataAnalysisRecord? e) => const ListEquality().hash([e?.json]);

  @override
  bool isValidKey(Object? o) => o is VrcDataAnalysisRecord;
}
