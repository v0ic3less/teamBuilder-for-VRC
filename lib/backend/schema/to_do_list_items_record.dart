import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToDoListItemsRecord extends FirestoreRecord {
  ToDoListItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  bool hasChecked() => _checked != null;

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "assignedUsers" field.
  List<DocumentReference>? _assignedUsers;
  List<DocumentReference> get assignedUsers => _assignedUsers ?? const [];
  bool hasAssignedUsers() => _assignedUsers != null;

  // "timeFinishGoal" field.
  DateTime? _timeFinishGoal;
  DateTime? get timeFinishGoal => _timeFinishGoal;
  bool hasTimeFinishGoal() => _timeFinishGoal != null;

  void _initializeFields() {
    _teamID = castToType<int>(snapshotData['teamID']);
    _checked = snapshotData['checked'] as bool?;
    _itemName = snapshotData['itemName'] as String?;
    _assignedUsers = getDataList(snapshotData['assignedUsers']);
    _timeFinishGoal = snapshotData['timeFinishGoal'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('To-DoListItems');

  static Stream<ToDoListItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToDoListItemsRecord.fromSnapshot(s));

  static Future<ToDoListItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToDoListItemsRecord.fromSnapshot(s));

  static ToDoListItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToDoListItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToDoListItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToDoListItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToDoListItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToDoListItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToDoListItemsRecordData({
  int? teamID,
  bool? checked,
  String? itemName,
  DateTime? timeFinishGoal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teamID': teamID,
      'checked': checked,
      'itemName': itemName,
      'timeFinishGoal': timeFinishGoal,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToDoListItemsRecordDocumentEquality
    implements Equality<ToDoListItemsRecord> {
  const ToDoListItemsRecordDocumentEquality();

  @override
  bool equals(ToDoListItemsRecord? e1, ToDoListItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.teamID == e2?.teamID &&
        e1?.checked == e2?.checked &&
        e1?.itemName == e2?.itemName &&
        listEquality.equals(e1?.assignedUsers, e2?.assignedUsers) &&
        e1?.timeFinishGoal == e2?.timeFinishGoal;
  }

  @override
  int hash(ToDoListItemsRecord? e) => const ListEquality().hash([
        e?.teamID,
        e?.checked,
        e?.itemName,
        e?.assignedUsers,
        e?.timeFinishGoal
      ]);

  @override
  bool isValidKey(Object? o) => o is ToDoListItemsRecord;
}
