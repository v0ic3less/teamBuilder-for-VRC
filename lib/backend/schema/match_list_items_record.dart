import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchListItemsRecord extends FirestoreRecord {
  MatchListItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  bool hasChecked() => _checked != null;

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "matchID" field.
  int? _matchID;
  int get matchID => _matchID ?? 0;
  bool hasMatchID() => _matchID != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  void _initializeFields() {
    _checked = snapshotData['checked'] as bool?;
    _itemName = snapshotData['itemName'] as String?;
    _matchID = castToType<int>(snapshotData['matchID']);
    _teamID = castToType<int>(snapshotData['teamID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('match-list-items');

  static Stream<MatchListItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchListItemsRecord.fromSnapshot(s));

  static Future<MatchListItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchListItemsRecord.fromSnapshot(s));

  static MatchListItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchListItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchListItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchListItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchListItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchListItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchListItemsRecordData({
  bool? checked,
  String? itemName,
  int? matchID,
  int? teamID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checked': checked,
      'itemName': itemName,
      'matchID': matchID,
      'teamID': teamID,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchListItemsRecordDocumentEquality
    implements Equality<MatchListItemsRecord> {
  const MatchListItemsRecordDocumentEquality();

  @override
  bool equals(MatchListItemsRecord? e1, MatchListItemsRecord? e2) {
    return e1?.checked == e2?.checked &&
        e1?.itemName == e2?.itemName &&
        e1?.matchID == e2?.matchID &&
        e1?.teamID == e2?.teamID;
  }

  @override
  int hash(MatchListItemsRecord? e) => const ListEquality()
      .hash([e?.checked, e?.itemName, e?.matchID, e?.teamID]);

  @override
  bool isValidKey(Object? o) => o is MatchListItemsRecord;
}
