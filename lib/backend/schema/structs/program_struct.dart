// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProgramStruct extends FFFirebaseStruct {
  ProgramStruct({
    int? id,
    String? name,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _code = code,
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

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static ProgramStruct fromMap(Map<String, dynamic> data) => ProgramStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        code: data['code'] as String?,
      );

  static ProgramStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProgramStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'code': _code,
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
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramStruct(
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
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  static ProgramStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProgramStruct(
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
        code: convertAlgoliaParam(
          data['code'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProgramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramStruct &&
        id == other.id &&
        name == other.name &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, code]);
}

ProgramStruct createProgramStruct({
  int? id,
  String? name,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProgramStruct(
      id: id,
      name: name,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProgramStruct? updateProgramStruct(
  ProgramStruct? program, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    program
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProgramStructData(
  Map<String, dynamic> firestoreData,
  ProgramStruct? program,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (program == null) {
    return;
  }
  if (program.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && program.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final programData = getProgramFirestoreData(program, forFieldValue);
  final nestedData = programData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = program.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProgramFirestoreData(
  ProgramStruct? program, [
  bool forFieldValue = false,
]) {
  if (program == null) {
    return {};
  }
  final firestoreData = mapToFirestore(program.toMap());

  // Add any Firestore field values
  program.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProgramListFirestoreData(
  List<ProgramStruct>? programs,
) =>
    programs?.map((e) => getProgramFirestoreData(e, true)).toList() ?? [];
