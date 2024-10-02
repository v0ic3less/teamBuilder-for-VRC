// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends FFFirebaseStruct {
  LocationStruct({
    String? venue,
    String? address1,
    String? address2,
    String? city,
    String? region,
    String? postcode,
    String? country,
    CoordinatesStruct? coordinates,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _venue = venue,
        _address1 = address1,
        _address2 = address2,
        _city = city,
        _region = region,
        _postcode = postcode,
        _country = country,
        _coordinates = coordinates,
        super(firestoreUtilData);

  // "venue" field.
  String? _venue;
  String get venue => _venue ?? '';
  set venue(String? val) => _venue = val;

  bool hasVenue() => _venue != null;

  // "address_1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  set address1(String? val) => _address1 = val;

  bool hasAddress1() => _address1 != null;

  // "address_2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  set address2(String? val) => _address2 = val;

  bool hasAddress2() => _address2 != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;

  bool hasRegion() => _region != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  set postcode(String? val) => _postcode = val;

  bool hasPostcode() => _postcode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "coordinates" field.
  CoordinatesStruct? _coordinates;
  CoordinatesStruct get coordinates => _coordinates ?? CoordinatesStruct();
  set coordinates(CoordinatesStruct? val) => _coordinates = val;

  void updateCoordinates(Function(CoordinatesStruct) updateFn) {
    updateFn(_coordinates ??= CoordinatesStruct());
  }

  bool hasCoordinates() => _coordinates != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        venue: data['venue'] as String?,
        address1: data['address_1'] as String?,
        address2: data['address_2'] as String?,
        city: data['city'] as String?,
        region: data['region'] as String?,
        postcode: data['postcode'] as String?,
        country: data['country'] as String?,
        coordinates: CoordinatesStruct.maybeFromMap(data['coordinates']),
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'venue': _venue,
        'address_1': _address1,
        'address_2': _address2,
        'city': _city,
        'region': _region,
        'postcode': _postcode,
        'country': _country,
        'coordinates': _coordinates?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'venue': serializeParam(
          _venue,
          ParamType.String,
        ),
        'address_1': serializeParam(
          _address1,
          ParamType.String,
        ),
        'address_2': serializeParam(
          _address2,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'region': serializeParam(
          _region,
          ParamType.String,
        ),
        'postcode': serializeParam(
          _postcode,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        venue: deserializeParam(
          data['venue'],
          ParamType.String,
          false,
        ),
        address1: deserializeParam(
          data['address_1'],
          ParamType.String,
          false,
        ),
        address2: deserializeParam(
          data['address_2'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        region: deserializeParam(
          data['region'],
          ParamType.String,
          false,
        ),
        postcode: deserializeParam(
          data['postcode'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeStructParam(
          data['coordinates'],
          ParamType.DataStruct,
          false,
          structBuilder: CoordinatesStruct.fromSerializableMap,
        ),
      );

  static LocationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LocationStruct(
        venue: convertAlgoliaParam(
          data['venue'],
          ParamType.String,
          false,
        ),
        address1: convertAlgoliaParam(
          data['address_1'],
          ParamType.String,
          false,
        ),
        address2: convertAlgoliaParam(
          data['address_2'],
          ParamType.String,
          false,
        ),
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        region: convertAlgoliaParam(
          data['region'],
          ParamType.String,
          false,
        ),
        postcode: convertAlgoliaParam(
          data['postcode'],
          ParamType.String,
          false,
        ),
        country: convertAlgoliaParam(
          data['country'],
          ParamType.String,
          false,
        ),
        coordinates: convertAlgoliaParam(
          data['coordinates'],
          ParamType.DataStruct,
          false,
          structBuilder: CoordinatesStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct &&
        venue == other.venue &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        region == other.region &&
        postcode == other.postcode &&
        country == other.country &&
        coordinates == other.coordinates;
  }

  @override
  int get hashCode => const ListEquality().hash([
        venue,
        address1,
        address2,
        city,
        region,
        postcode,
        country,
        coordinates
      ]);
}

LocationStruct createLocationStruct({
  String? venue,
  String? address1,
  String? address2,
  String? city,
  String? region,
  String? postcode,
  String? country,
  CoordinatesStruct? coordinates,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationStruct(
      venue: venue,
      address1: address1,
      address2: address2,
      city: city,
      region: region,
      postcode: postcode,
      country: country,
      coordinates:
          coordinates ?? (clearUnsetFields ? CoordinatesStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationStruct? updateLocationStruct(
  LocationStruct? location, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    location
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationStructData(
  Map<String, dynamic> firestoreData,
  LocationStruct? location,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (location == null) {
    return;
  }
  if (location.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && location.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationData = getLocationFirestoreData(location, forFieldValue);
  final nestedData = locationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = location.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationFirestoreData(
  LocationStruct? location, [
  bool forFieldValue = false,
]) {
  if (location == null) {
    return {};
  }
  final firestoreData = mapToFirestore(location.toMap());

  // Handle nested data for "coordinates" field.
  addCoordinatesStructData(
    firestoreData,
    location.hasCoordinates() ? location.coordinates : null,
    'coordinates',
    forFieldValue,
  );

  // Add any Firestore field values
  location.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationListFirestoreData(
  List<LocationStruct>? locations,
) =>
    locations?.map((e) => getLocationFirestoreData(e, true)).toList() ?? [];
