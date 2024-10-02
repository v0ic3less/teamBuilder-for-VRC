// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends FFFirebaseStruct {
  DataStruct({
    int? id,
    String? sku,
    String? name,
    String? start,
    String? end,
    SeasonStruct? season,
    ProgramStruct? program,
    LocationStruct? location,
    List<DivisionsStruct>? divisions,
    String? level,
    bool? ongoing,
    bool? awardsFinalized,
    String? eventType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _sku = sku,
        _name = name,
        _start = start,
        _end = end,
        _season = season,
        _program = program,
        _location = location,
        _divisions = divisions,
        _level = level,
        _ongoing = ongoing,
        _awardsFinalized = awardsFinalized,
        _eventType = eventType,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "sku" field.
  String? _sku;
  String get sku => _sku ?? '';
  set sku(String? val) => _sku = val;

  bool hasSku() => _sku != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  set start(String? val) => _start = val;

  bool hasStart() => _start != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  set end(String? val) => _end = val;

  bool hasEnd() => _end != null;

  // "season" field.
  SeasonStruct? _season;
  SeasonStruct get season => _season ?? SeasonStruct();
  set season(SeasonStruct? val) => _season = val;

  void updateSeason(Function(SeasonStruct) updateFn) {
    updateFn(_season ??= SeasonStruct());
  }

  bool hasSeason() => _season != null;

  // "program" field.
  ProgramStruct? _program;
  ProgramStruct get program => _program ?? ProgramStruct();
  set program(ProgramStruct? val) => _program = val;

  void updateProgram(Function(ProgramStruct) updateFn) {
    updateFn(_program ??= ProgramStruct());
  }

  bool hasProgram() => _program != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  // "divisions" field.
  List<DivisionsStruct>? _divisions;
  List<DivisionsStruct> get divisions => _divisions ?? const [];
  set divisions(List<DivisionsStruct>? val) => _divisions = val;

  void updateDivisions(Function(List<DivisionsStruct>) updateFn) {
    updateFn(_divisions ??= []);
  }

  bool hasDivisions() => _divisions != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  set level(String? val) => _level = val;

  bool hasLevel() => _level != null;

  // "ongoing" field.
  bool? _ongoing;
  bool get ongoing => _ongoing ?? false;
  set ongoing(bool? val) => _ongoing = val;

  bool hasOngoing() => _ongoing != null;

  // "awards_finalized" field.
  bool? _awardsFinalized;
  bool get awardsFinalized => _awardsFinalized ?? false;
  set awardsFinalized(bool? val) => _awardsFinalized = val;

  bool hasAwardsFinalized() => _awardsFinalized != null;

  // "event_type" field.
  String? _eventType;
  String get eventType => _eventType ?? '';
  set eventType(String? val) => _eventType = val;

  bool hasEventType() => _eventType != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        id: castToType<int>(data['id']),
        sku: data['sku'] as String?,
        name: data['name'] as String?,
        start: data['start'] as String?,
        end: data['end'] as String?,
        season: SeasonStruct.maybeFromMap(data['season']),
        program: ProgramStruct.maybeFromMap(data['program']),
        location: LocationStruct.maybeFromMap(data['location']),
        divisions: getStructList(
          data['divisions'],
          DivisionsStruct.fromMap,
        ),
        level: data['level'] as String?,
        ongoing: data['ongoing'] as bool?,
        awardsFinalized: data['awards_finalized'] as bool?,
        eventType: data['event_type'] as String?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'sku': _sku,
        'name': _name,
        'start': _start,
        'end': _end,
        'season': _season?.toMap(),
        'program': _program?.toMap(),
        'location': _location?.toMap(),
        'divisions': _divisions?.map((e) => e.toMap()).toList(),
        'level': _level,
        'ongoing': _ongoing,
        'awards_finalized': _awardsFinalized,
        'event_type': _eventType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'sku': serializeParam(
          _sku,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.String,
        ),
        'end': serializeParam(
          _end,
          ParamType.String,
        ),
        'season': serializeParam(
          _season,
          ParamType.DataStruct,
        ),
        'program': serializeParam(
          _program,
          ParamType.DataStruct,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'divisions': serializeParam(
          _divisions,
          ParamType.DataStruct,
          isList: true,
        ),
        'level': serializeParam(
          _level,
          ParamType.String,
        ),
        'ongoing': serializeParam(
          _ongoing,
          ParamType.bool,
        ),
        'awards_finalized': serializeParam(
          _awardsFinalized,
          ParamType.bool,
        ),
        'event_type': serializeParam(
          _eventType,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        sku: deserializeParam(
          data['sku'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.String,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.String,
          false,
        ),
        season: deserializeStructParam(
          data['season'],
          ParamType.DataStruct,
          false,
          structBuilder: SeasonStruct.fromSerializableMap,
        ),
        program: deserializeStructParam(
          data['program'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramStruct.fromSerializableMap,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        divisions: deserializeStructParam<DivisionsStruct>(
          data['divisions'],
          ParamType.DataStruct,
          true,
          structBuilder: DivisionsStruct.fromSerializableMap,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.String,
          false,
        ),
        ongoing: deserializeParam(
          data['ongoing'],
          ParamType.bool,
          false,
        ),
        awardsFinalized: deserializeParam(
          data['awards_finalized'],
          ParamType.bool,
          false,
        ),
        eventType: deserializeParam(
          data['event_type'],
          ParamType.String,
          false,
        ),
      );

  static DataStruct fromAlgoliaData(Map<String, dynamic> data) => DataStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.int,
          false,
        ),
        sku: convertAlgoliaParam(
          data['sku'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        start: convertAlgoliaParam(
          data['start'],
          ParamType.String,
          false,
        ),
        end: convertAlgoliaParam(
          data['end'],
          ParamType.String,
          false,
        ),
        season: convertAlgoliaParam(
          data['season'],
          ParamType.DataStruct,
          false,
          structBuilder: SeasonStruct.fromAlgoliaData,
        ),
        program: convertAlgoliaParam(
          data['program'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramStruct.fromAlgoliaData,
        ),
        location: convertAlgoliaParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromAlgoliaData,
        ),
        divisions: convertAlgoliaParam<DivisionsStruct>(
          data['divisions'],
          ParamType.DataStruct,
          true,
          structBuilder: DivisionsStruct.fromAlgoliaData,
        ),
        level: convertAlgoliaParam(
          data['level'],
          ParamType.String,
          false,
        ),
        ongoing: convertAlgoliaParam(
          data['ongoing'],
          ParamType.bool,
          false,
        ),
        awardsFinalized: convertAlgoliaParam(
          data['awards_finalized'],
          ParamType.bool,
          false,
        ),
        eventType: convertAlgoliaParam(
          data['event_type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DataStruct &&
        id == other.id &&
        sku == other.sku &&
        name == other.name &&
        start == other.start &&
        end == other.end &&
        season == other.season &&
        program == other.program &&
        location == other.location &&
        listEquality.equals(divisions, other.divisions) &&
        level == other.level &&
        ongoing == other.ongoing &&
        awardsFinalized == other.awardsFinalized &&
        eventType == other.eventType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        sku,
        name,
        start,
        end,
        season,
        program,
        location,
        divisions,
        level,
        ongoing,
        awardsFinalized,
        eventType
      ]);
}

DataStruct createDataStruct({
  int? id,
  String? sku,
  String? name,
  String? start,
  String? end,
  SeasonStruct? season,
  ProgramStruct? program,
  LocationStruct? location,
  String? level,
  bool? ongoing,
  bool? awardsFinalized,
  String? eventType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataStruct(
      id: id,
      sku: sku,
      name: name,
      start: start,
      end: end,
      season: season ?? (clearUnsetFields ? SeasonStruct() : null),
      program: program ?? (clearUnsetFields ? ProgramStruct() : null),
      location: location ?? (clearUnsetFields ? LocationStruct() : null),
      level: level,
      ongoing: ongoing,
      awardsFinalized: awardsFinalized,
      eventType: eventType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataStruct? updateDataStruct(
  DataStruct? data, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    data
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataStructData(
  Map<String, dynamic> firestoreData,
  DataStruct? data,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (data == null) {
    return;
  }
  if (data.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && data.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataData = getDataFirestoreData(data, forFieldValue);
  final nestedData = dataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = data.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataFirestoreData(
  DataStruct? data, [
  bool forFieldValue = false,
]) {
  if (data == null) {
    return {};
  }
  final firestoreData = mapToFirestore(data.toMap());

  // Handle nested data for "season" field.
  addSeasonStructData(
    firestoreData,
    data.hasSeason() ? data.season : null,
    'season',
    forFieldValue,
  );

  // Handle nested data for "program" field.
  addProgramStructData(
    firestoreData,
    data.hasProgram() ? data.program : null,
    'program',
    forFieldValue,
  );

  // Handle nested data for "location" field.
  addLocationStructData(
    firestoreData,
    data.hasLocation() ? data.location : null,
    'location',
    forFieldValue,
  );

  // Add any Firestore field values
  data.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataListFirestoreData(
  List<DataStruct>? datas,
) =>
    datas?.map((e) => getDataFirestoreData(e, true)).toList() ?? [];
