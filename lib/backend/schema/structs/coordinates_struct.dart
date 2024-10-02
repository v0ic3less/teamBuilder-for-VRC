// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CoordinatesStruct extends FFFirebaseStruct {
  CoordinatesStruct({
    double? lat,
    double? lon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lon = lon,
        super(firestoreUtilData);

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lon" field.
  double? _lon;
  double get lon => _lon ?? 0.0;
  set lon(double? val) => _lon = val;

  void incrementLon(double amount) => lon = lon + amount;

  bool hasLon() => _lon != null;

  static CoordinatesStruct fromMap(Map<String, dynamic> data) =>
      CoordinatesStruct(
        lat: castToType<double>(data['lat']),
        lon: castToType<double>(data['lon']),
      );

  static CoordinatesStruct? maybeFromMap(dynamic data) => data is Map
      ? CoordinatesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lon': _lon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lon': serializeParam(
          _lon,
          ParamType.double,
        ),
      }.withoutNulls;

  static CoordinatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoordinatesStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lon: deserializeParam(
          data['lon'],
          ParamType.double,
          false,
        ),
      );

  static CoordinatesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CoordinatesStruct(
        lat: convertAlgoliaParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lon: convertAlgoliaParam(
          data['lon'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CoordinatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoordinatesStruct && lat == other.lat && lon == other.lon;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lon]);
}

CoordinatesStruct createCoordinatesStruct({
  double? lat,
  double? lon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoordinatesStruct(
      lat: lat,
      lon: lon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoordinatesStruct? updateCoordinatesStruct(
  CoordinatesStruct? coordinates, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coordinates
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoordinatesStructData(
  Map<String, dynamic> firestoreData,
  CoordinatesStruct? coordinates,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coordinates == null) {
    return;
  }
  if (coordinates.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coordinates.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coordinatesData =
      getCoordinatesFirestoreData(coordinates, forFieldValue);
  final nestedData =
      coordinatesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coordinates.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoordinatesFirestoreData(
  CoordinatesStruct? coordinates, [
  bool forFieldValue = false,
]) {
  if (coordinates == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coordinates.toMap());

  // Add any Firestore field values
  coordinates.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoordinatesListFirestoreData(
  List<CoordinatesStruct>? coordinatess,
) =>
    coordinatess?.map((e) => getCoordinatesFirestoreData(e, true)).toList() ??
    [];
