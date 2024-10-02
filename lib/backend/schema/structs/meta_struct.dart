// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MetaStruct extends FFFirebaseStruct {
  MetaStruct({
    int? currentPage,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _currentPage = currentPage,
        _firstPageUrl = firstPageUrl,
        _from = from,
        _lastPage = lastPage,
        _lastPageUrl = lastPageUrl,
        _nextPageUrl = nextPageUrl,
        _path = path,
        _perPage = perPage,
        _prevPageUrl = prevPageUrl,
        _to = to,
        _total = total,
        super(firestoreUtilData);

  // "current_page" field.
  int? _currentPage;
  int get currentPage => _currentPage ?? 0;
  set currentPage(int? val) => _currentPage = val;

  void incrementCurrentPage(int amount) => currentPage = currentPage + amount;

  bool hasCurrentPage() => _currentPage != null;

  // "first_page_url" field.
  String? _firstPageUrl;
  String get firstPageUrl => _firstPageUrl ?? '';
  set firstPageUrl(String? val) => _firstPageUrl = val;

  bool hasFirstPageUrl() => _firstPageUrl != null;

  // "from" field.
  int? _from;
  int get from => _from ?? 0;
  set from(int? val) => _from = val;

  void incrementFrom(int amount) => from = from + amount;

  bool hasFrom() => _from != null;

  // "last_page" field.
  int? _lastPage;
  int get lastPage => _lastPage ?? 0;
  set lastPage(int? val) => _lastPage = val;

  void incrementLastPage(int amount) => lastPage = lastPage + amount;

  bool hasLastPage() => _lastPage != null;

  // "last_page_url" field.
  String? _lastPageUrl;
  String get lastPageUrl => _lastPageUrl ?? '';
  set lastPageUrl(String? val) => _lastPageUrl = val;

  bool hasLastPageUrl() => _lastPageUrl != null;

  // "next_page_url" field.
  String? _nextPageUrl;
  String get nextPageUrl => _nextPageUrl ?? '';
  set nextPageUrl(String? val) => _nextPageUrl = val;

  bool hasNextPageUrl() => _nextPageUrl != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "per_page" field.
  int? _perPage;
  int get perPage => _perPage ?? 0;
  set perPage(int? val) => _perPage = val;

  void incrementPerPage(int amount) => perPage = perPage + amount;

  bool hasPerPage() => _perPage != null;

  // "prev_page_url" field.
  String? _prevPageUrl;
  String get prevPageUrl => _prevPageUrl ?? '';
  set prevPageUrl(String? val) => _prevPageUrl = val;

  bool hasPrevPageUrl() => _prevPageUrl != null;

  // "to" field.
  int? _to;
  int get to => _to ?? 0;
  set to(int? val) => _to = val;

  void incrementTo(int amount) => to = to + amount;

  bool hasTo() => _to != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static MetaStruct fromMap(Map<String, dynamic> data) => MetaStruct(
        currentPage: castToType<int>(data['current_page']),
        firstPageUrl: data['first_page_url'] as String?,
        from: castToType<int>(data['from']),
        lastPage: castToType<int>(data['last_page']),
        lastPageUrl: data['last_page_url'] as String?,
        nextPageUrl: data['next_page_url'] as String?,
        path: data['path'] as String?,
        perPage: castToType<int>(data['per_page']),
        prevPageUrl: data['prev_page_url'] as String?,
        to: castToType<int>(data['to']),
        total: castToType<int>(data['total']),
      );

  static MetaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'current_page': _currentPage,
        'first_page_url': _firstPageUrl,
        'from': _from,
        'last_page': _lastPage,
        'last_page_url': _lastPageUrl,
        'next_page_url': _nextPageUrl,
        'path': _path,
        'per_page': _perPage,
        'prev_page_url': _prevPageUrl,
        'to': _to,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'current_page': serializeParam(
          _currentPage,
          ParamType.int,
        ),
        'first_page_url': serializeParam(
          _firstPageUrl,
          ParamType.String,
        ),
        'from': serializeParam(
          _from,
          ParamType.int,
        ),
        'last_page': serializeParam(
          _lastPage,
          ParamType.int,
        ),
        'last_page_url': serializeParam(
          _lastPageUrl,
          ParamType.String,
        ),
        'next_page_url': serializeParam(
          _nextPageUrl,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'per_page': serializeParam(
          _perPage,
          ParamType.int,
        ),
        'prev_page_url': serializeParam(
          _prevPageUrl,
          ParamType.String,
        ),
        'to': serializeParam(
          _to,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetaStruct(
        currentPage: deserializeParam(
          data['current_page'],
          ParamType.int,
          false,
        ),
        firstPageUrl: deserializeParam(
          data['first_page_url'],
          ParamType.String,
          false,
        ),
        from: deserializeParam(
          data['from'],
          ParamType.int,
          false,
        ),
        lastPage: deserializeParam(
          data['last_page'],
          ParamType.int,
          false,
        ),
        lastPageUrl: deserializeParam(
          data['last_page_url'],
          ParamType.String,
          false,
        ),
        nextPageUrl: deserializeParam(
          data['next_page_url'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        perPage: deserializeParam(
          data['per_page'],
          ParamType.int,
          false,
        ),
        prevPageUrl: deserializeParam(
          data['prev_page_url'],
          ParamType.String,
          false,
        ),
        to: deserializeParam(
          data['to'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  static MetaStruct fromAlgoliaData(Map<String, dynamic> data) => MetaStruct(
        currentPage: convertAlgoliaParam(
          data['current_page'],
          ParamType.int,
          false,
        ),
        firstPageUrl: convertAlgoliaParam(
          data['first_page_url'],
          ParamType.String,
          false,
        ),
        from: convertAlgoliaParam(
          data['from'],
          ParamType.int,
          false,
        ),
        lastPage: convertAlgoliaParam(
          data['last_page'],
          ParamType.int,
          false,
        ),
        lastPageUrl: convertAlgoliaParam(
          data['last_page_url'],
          ParamType.String,
          false,
        ),
        nextPageUrl: convertAlgoliaParam(
          data['next_page_url'],
          ParamType.String,
          false,
        ),
        path: convertAlgoliaParam(
          data['path'],
          ParamType.String,
          false,
        ),
        perPage: convertAlgoliaParam(
          data['per_page'],
          ParamType.int,
          false,
        ),
        prevPageUrl: convertAlgoliaParam(
          data['prev_page_url'],
          ParamType.String,
          false,
        ),
        to: convertAlgoliaParam(
          data['to'],
          ParamType.int,
          false,
        ),
        total: convertAlgoliaParam(
          data['total'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MetaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetaStruct &&
        currentPage == other.currentPage &&
        firstPageUrl == other.firstPageUrl &&
        from == other.from &&
        lastPage == other.lastPage &&
        lastPageUrl == other.lastPageUrl &&
        nextPageUrl == other.nextPageUrl &&
        path == other.path &&
        perPage == other.perPage &&
        prevPageUrl == other.prevPageUrl &&
        to == other.to &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([
        currentPage,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        prevPageUrl,
        to,
        total
      ]);
}

MetaStruct createMetaStruct({
  int? currentPage,
  String? firstPageUrl,
  int? from,
  int? lastPage,
  String? lastPageUrl,
  String? nextPageUrl,
  String? path,
  int? perPage,
  String? prevPageUrl,
  int? to,
  int? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MetaStruct(
      currentPage: currentPage,
      firstPageUrl: firstPageUrl,
      from: from,
      lastPage: lastPage,
      lastPageUrl: lastPageUrl,
      nextPageUrl: nextPageUrl,
      path: path,
      perPage: perPage,
      prevPageUrl: prevPageUrl,
      to: to,
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MetaStruct? updateMetaStruct(
  MetaStruct? meta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMetaStructData(
  Map<String, dynamic> firestoreData,
  MetaStruct? meta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meta == null) {
    return;
  }
  if (meta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && meta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final metaData = getMetaFirestoreData(meta, forFieldValue);
  final nestedData = metaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMetaFirestoreData(
  MetaStruct? meta, [
  bool forFieldValue = false,
]) {
  if (meta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meta.toMap());

  // Add any Firestore field values
  meta.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMetaListFirestoreData(
  List<MetaStruct>? metas,
) =>
    metas?.map((e) => getMetaFirestoreData(e, true)).toList() ?? [];
