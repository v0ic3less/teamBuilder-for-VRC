// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RobotEventsEventsStruct extends FFFirebaseStruct {
  RobotEventsEventsStruct({
    MetaStruct? meta,
    List<DataStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _meta = meta,
        _data = data,
        super(firestoreUtilData);

  // "meta" field.
  MetaStruct? _meta;
  MetaStruct get meta => _meta ?? MetaStruct();
  set meta(MetaStruct? val) => _meta = val;

  void updateMeta(Function(MetaStruct) updateFn) {
    updateFn(_meta ??= MetaStruct());
  }

  bool hasMeta() => _meta != null;

  // "data" field.
  List<DataStruct>? _data;
  List<DataStruct> get data => _data ?? const [];
  set data(List<DataStruct>? val) => _data = val;

  void updateData(Function(List<DataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static RobotEventsEventsStruct fromMap(Map<String, dynamic> data) =>
      RobotEventsEventsStruct(
        meta: MetaStruct.maybeFromMap(data['meta']),
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static RobotEventsEventsStruct? maybeFromMap(dynamic data) => data is Map
      ? RobotEventsEventsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'meta': _meta?.toMap(),
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RobotEventsEventsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RobotEventsEventsStruct(
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromSerializableMap,
        ),
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  static RobotEventsEventsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RobotEventsEventsStruct(
        meta: convertAlgoliaParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromAlgoliaData,
        ),
        data: convertAlgoliaParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RobotEventsEventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RobotEventsEventsStruct &&
        meta == other.meta &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([meta, data]);
}

RobotEventsEventsStruct createRobotEventsEventsStruct({
  MetaStruct? meta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RobotEventsEventsStruct(
      meta: meta ?? (clearUnsetFields ? MetaStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RobotEventsEventsStruct? updateRobotEventsEventsStruct(
  RobotEventsEventsStruct? robotEventsEvents, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    robotEventsEvents
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRobotEventsEventsStructData(
  Map<String, dynamic> firestoreData,
  RobotEventsEventsStruct? robotEventsEvents,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (robotEventsEvents == null) {
    return;
  }
  if (robotEventsEvents.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && robotEventsEvents.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final robotEventsEventsData =
      getRobotEventsEventsFirestoreData(robotEventsEvents, forFieldValue);
  final nestedData =
      robotEventsEventsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = robotEventsEvents.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRobotEventsEventsFirestoreData(
  RobotEventsEventsStruct? robotEventsEvents, [
  bool forFieldValue = false,
]) {
  if (robotEventsEvents == null) {
    return {};
  }
  final firestoreData = mapToFirestore(robotEventsEvents.toMap());

  // Handle nested data for "meta" field.
  addMetaStructData(
    firestoreData,
    robotEventsEvents.hasMeta() ? robotEventsEvents.meta : null,
    'meta',
    forFieldValue,
  );

  // Add any Firestore field values
  robotEventsEvents.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRobotEventsEventsListFirestoreData(
  List<RobotEventsEventsStruct>? robotEventsEventss,
) =>
    robotEventsEventss
        ?.map((e) => getRobotEventsEventsFirestoreData(e, true))
        .toList() ??
    [];
