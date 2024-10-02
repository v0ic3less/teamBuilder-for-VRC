// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DivisionsStruct extends FFFirebaseStruct {
  DivisionsStruct({
    int? id,
    String? name,
    int? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _order = order,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  static DivisionsStruct fromMap(Map<String, dynamic> data) => DivisionsStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        order: castToType<int>(data['order']),
      );

  static DivisionsStruct? maybeFromMap(dynamic data) => data is Map
      ? DivisionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
      }.withoutNulls;

  static DivisionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DivisionsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
      );

  static DivisionsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DivisionsStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        order: convertAlgoliaParam(
          data['order'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DivisionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DivisionsStruct &&
        id == other.id &&
        name == other.name &&
        order == other.order;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, order]);
}

DivisionsStruct createDivisionsStruct({
  int? id,
  String? name,
  int? order,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DivisionsStruct(
      id: id,
      name: name,
      order: order,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DivisionsStruct? updateDivisionsStruct(
  DivisionsStruct? divisions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    divisions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDivisionsStructData(
  Map<String, dynamic> firestoreData,
  DivisionsStruct? divisions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (divisions == null) {
    return;
  }
  if (divisions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && divisions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final divisionsData = getDivisionsFirestoreData(divisions, forFieldValue);
  final nestedData = divisionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = divisions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDivisionsFirestoreData(
  DivisionsStruct? divisions, [
  bool forFieldValue = false,
]) {
  if (divisions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(divisions.toMap());

  // Add any Firestore field values
  divisions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDivisionsListFirestoreData(
  List<DivisionsStruct>? divisionss,
) =>
    divisionss?.map((e) => getDivisionsFirestoreData(e, true)).toList() ?? [];
