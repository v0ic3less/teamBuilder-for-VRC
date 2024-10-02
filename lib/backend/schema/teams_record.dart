import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamsRecord extends FirestoreRecord {
  TeamsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "teamNum" field.
  String? _teamNum;
  String get teamNum => _teamNum ?? '';
  bool hasTeamNum() => _teamNum != null;

  // "premiumTeam" field.
  bool? _premiumTeam;
  bool get premiumTeam => _premiumTeam ?? false;
  bool hasPremiumTeam() => _premiumTeam != null;

  // "teamID" field.
  int? _teamID;
  int get teamID => _teamID ?? 0;
  bool hasTeamID() => _teamID != null;

  // "captainUID" field.
  String? _captainUID;
  String get captainUID => _captainUID ?? '';
  bool hasCaptainUID() => _captainUID != null;

  // "captainDisplayName" field.
  String? _captainDisplayName;
  String get captainDisplayName => _captainDisplayName ?? '';
  bool hasCaptainDisplayName() => _captainDisplayName != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "descript" field.
  String? _descript;
  String get descript => _descript ?? '';
  bool hasDescript() => _descript != null;

  // "robotPics" field.
  List<String>? _robotPics;
  List<String> get robotPics => _robotPics ?? const [];
  bool hasRobotPics() => _robotPics != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "teamNotes" field.
  List<String>? _teamNotes;
  List<String> get teamNotes => _teamNotes ?? const [];
  bool hasTeamNotes() => _teamNotes != null;

  // "notesID" field.
  List<int>? _notesID;
  List<int> get notesID => _notesID ?? const [];
  bool hasNotesID() => _notesID != null;

  // "captures" field.
  List<String>? _captures;
  List<String> get captures => _captures ?? const [];
  bool hasCaptures() => _captures != null;

  // "teamMembers" field.
  List<DocumentReference>? _teamMembers;
  List<DocumentReference> get teamMembers => _teamMembers ?? const [];
  bool hasTeamMembers() => _teamMembers != null;

  // "captainRef" field.
  DocumentReference? _captainRef;
  DocumentReference? get captainRef => _captainRef;
  bool hasCaptainRef() => _captainRef != null;

  void _initializeFields() {
    _teamNum = snapshotData['teamNum'] as String?;
    _premiumTeam = snapshotData['premiumTeam'] as bool?;
    _teamID = castToType<int>(snapshotData['teamID']);
    _captainUID = snapshotData['captainUID'] as String?;
    _captainDisplayName = snapshotData['captainDisplayName'] as String?;
    _verified = snapshotData['verified'] as bool?;
    _descript = snapshotData['descript'] as String?;
    _robotPics = getDataList(snapshotData['robotPics']);
    _tags = getDataList(snapshotData['tags']);
    _teamNotes = getDataList(snapshotData['teamNotes']);
    _notesID = getDataList(snapshotData['notesID']);
    _captures = getDataList(snapshotData['captures']);
    _teamMembers = getDataList(snapshotData['teamMembers']);
    _captainRef = snapshotData['captainRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teams');

  static Stream<TeamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamsRecord.fromSnapshot(s));

  static Future<TeamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamsRecord.fromSnapshot(s));

  static TeamsRecord fromSnapshot(DocumentSnapshot snapshot) => TeamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamsRecord._(reference, mapFromFirestore(data));

  static TeamsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TeamsRecord.getDocumentFromData(
        {
          'teamNum': snapshot.data['teamNum'],
          'premiumTeam': snapshot.data['premiumTeam'],
          'teamID': convertAlgoliaParam(
            snapshot.data['teamID'],
            ParamType.int,
            false,
          ),
          'captainUID': snapshot.data['captainUID'],
          'captainDisplayName': snapshot.data['captainDisplayName'],
          'verified': snapshot.data['verified'],
          'descript': snapshot.data['descript'],
          'robotPics': safeGet(
            () => snapshot.data['robotPics'].toList(),
          ),
          'tags': safeGet(
            () => snapshot.data['tags'].toList(),
          ),
          'teamNotes': safeGet(
            () => snapshot.data['teamNotes'].toList(),
          ),
          'notesID': safeGet(
            () => convertAlgoliaParam<int>(
              snapshot.data['notesID'],
              ParamType.int,
              true,
            ).toList(),
          ),
          'captures': safeGet(
            () => snapshot.data['captures'].toList(),
          ),
          'teamMembers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['teamMembers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'captainRef': convertAlgoliaParam(
            snapshot.data['captainRef'],
            ParamType.DocumentReference,
            false,
          ),
        },
        TeamsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TeamsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'teams',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TeamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamsRecordData({
  String? teamNum,
  bool? premiumTeam,
  int? teamID,
  String? captainUID,
  String? captainDisplayName,
  bool? verified,
  String? descript,
  DocumentReference? captainRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teamNum': teamNum,
      'premiumTeam': premiumTeam,
      'teamID': teamID,
      'captainUID': captainUID,
      'captainDisplayName': captainDisplayName,
      'verified': verified,
      'descript': descript,
      'captainRef': captainRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamsRecordDocumentEquality implements Equality<TeamsRecord> {
  const TeamsRecordDocumentEquality();

  @override
  bool equals(TeamsRecord? e1, TeamsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.teamNum == e2?.teamNum &&
        e1?.premiumTeam == e2?.premiumTeam &&
        e1?.teamID == e2?.teamID &&
        e1?.captainUID == e2?.captainUID &&
        e1?.captainDisplayName == e2?.captainDisplayName &&
        e1?.verified == e2?.verified &&
        e1?.descript == e2?.descript &&
        listEquality.equals(e1?.robotPics, e2?.robotPics) &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        listEquality.equals(e1?.teamNotes, e2?.teamNotes) &&
        listEquality.equals(e1?.notesID, e2?.notesID) &&
        listEquality.equals(e1?.captures, e2?.captures) &&
        listEquality.equals(e1?.teamMembers, e2?.teamMembers) &&
        e1?.captainRef == e2?.captainRef;
  }

  @override
  int hash(TeamsRecord? e) => const ListEquality().hash([
        e?.teamNum,
        e?.premiumTeam,
        e?.teamID,
        e?.captainUID,
        e?.captainDisplayName,
        e?.verified,
        e?.descript,
        e?.robotPics,
        e?.tags,
        e?.teamNotes,
        e?.notesID,
        e?.captures,
        e?.teamMembers,
        e?.captainRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamsRecord;
}
