import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RobotEventsCall {
  static Future<ApiCallResponse> call({
    String? number = '',
    int? season = 190,
    int? id,
    String? method1 = '',
    int? program = 1,
    String? method2 = '',
    String? start = '',
    String? region = '',
    String? event = '',
    String? team = '',
    String? end = '',
    String? level = '',
    String? id2 = '',
    String? method3 = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'RobotEvents',
      apiUrl:
          'https://www.robotevents.com/api/v2/$method1/$id/$method2/$id2/$method3?per_page=250',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDY1MDlkNmZjZjgwMTU1ZDE2N2VjODgwNTYyMmIwY2Q3MDZhNDBmOWRhODhhZjJhZDJmYjcwMDk5ZTMxODk4ZTRmODQ2MmQ3ZmMzYzE1NTYiLCJpYXQiOjE3MDg5OTg4MzguODM2MzI0LCJuYmYiOjE3MDg5OTg4MzguODM2MzI3MSwiZXhwIjoyNjU1NzcwMDM4LjgyNzc1ODgsInN1YiI6IjEyNjEzMyIsInNjb3BlcyI6W119.QqZEjpyba5SsyVsZCTuIf2dCAdOfmMuhu50Zvv8ckX7719y7lqd6iaPCpYlNZeImEyWEupwdbDGAnNveRgimA_PNzhK1I8e30FEgYqznw5EZJzMvAc2vuboJCwCml17maSBxL2yfCgxED828xhaDY21irStls8HXGCY-ziwYn_MzYbyCGV-hELwKTkAtoxKfbSUxET9ohXbrKBh3Ivg_1BB1GA244g-CP7npCjZD27kGB7r0bOwhg71gulzaCWIcw4KWRszgynx_sN7ZgglKVyRiG5VtYNYlMi-VvvJIatZc_1SusetZjhaQAUIF9DoDXUmD3TclFmePR00WxvyXWJOBACiIc4E2r0sgkhMYuLOafMVGS09OVYVk-m7WG1Shpl2jazq1_gvgUQTi9twC1wrB9ChmycXYJqlSZSNu_CqTvZSwuAnoVpG_5hJCPI5P8u6hA6o49gA8o1BirD5RUX89M572YFM0v38ly6p4zTC7NqlvTaXr_Nm2QaT-1XurZKnyONDVQPjgAbWCVPRx_1lxxCrYVRymgKh586Yo4nhuY8k0Tb50L5aZYnesuFMXjo6OmXv-YAy1VKf9nL7WLRoIf3FOHEGticW15R5KnUgydMl403DCRuaoeuFncQXvqW2w4NSyxcJRK3sZIKLtLAZ8BpJpYmQogOUkyufgywc',
      },
      params: {
        'number': number,
        'start': start,
        'program': program,
        'region': region,
        'season': season,
        'event': event,
        'team': team,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? matchTeamNames(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].alliances[:].teams[:].team.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? matchFieldNames(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].field''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? matchNumbers(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].matchnum''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? matchColors(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].alliances[:].color''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? matchScores(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].alliances[:].score''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? skillScores(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].score''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? winPoints(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? rank(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].rank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? matchNames(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? teamRegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.location.region''',
      ));
  static String? eventCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].sku''',
      ));
  static String? eventStartTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].start''',
      ));
  static String? eventLevel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].level''',
      ));
  static List<String>? eventAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].location.address_1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventCity(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].location.city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventRegion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].location.region''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? eventCountry(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].location.country''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? eventID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  static int? div(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].division.id''',
      ));
  static bool? ongoing(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[:].ongoing''',
      ));
  static List<String>? scheduledStart(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].scheduled''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? number(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.number''',
      ));
  static String? teamCity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location.city''',
      ));
  static String? teamOrg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.organization''',
      ));
  static String? teamGrade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.grade''',
      ));
  static int? awardNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.meta.total''',
      ));
  static List<String>? awardTitles(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? awardLocations(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].event.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List? divisions(dynamic response) => getJsonField(
        response,
        r'''$.divisions''',
        true,
      ) as List?;
}

class GetTeamIDCall {
  static Future<ApiCallResponse> call({
    String? number = '',
    String? method1 = '',
    String? region = '',
    String? level = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTeamID',
      apiUrl: 'https://www.robotevents.com/api/v2/$method1',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDY1MDlkNmZjZjgwMTU1ZDE2N2VjODgwNTYyMmIwY2Q3MDZhNDBmOWRhODhhZjJhZDJmYjcwMDk5ZTMxODk4ZTRmODQ2MmQ3ZmMzYzE1NTYiLCJpYXQiOjE3MDg5OTg4MzguODM2MzI0LCJuYmYiOjE3MDg5OTg4MzguODM2MzI3MSwiZXhwIjoyNjU1NzcwMDM4LjgyNzc1ODgsInN1YiI6IjEyNjEzMyIsInNjb3BlcyI6W119.QqZEjpyba5SsyVsZCTuIf2dCAdOfmMuhu50Zvv8ckX7719y7lqd6iaPCpYlNZeImEyWEupwdbDGAnNveRgimA_PNzhK1I8e30FEgYqznw5EZJzMvAc2vuboJCwCml17maSBxL2yfCgxED828xhaDY21irStls8HXGCY-ziwYn_MzYbyCGV-hELwKTkAtoxKfbSUxET9ohXbrKBh3Ivg_1BB1GA244g-CP7npCjZD27kGB7r0bOwhg71gulzaCWIcw4KWRszgynx_sN7ZgglKVyRiG5VtYNYlMi-VvvJIatZc_1SusetZjhaQAUIF9DoDXUmD3TclFmePR00WxvyXWJOBACiIc4E2r0sgkhMYuLOafMVGS09OVYVk-m7WG1Shpl2jazq1_gvgUQTi9twC1wrB9ChmycXYJqlSZSNu_CqTvZSwuAnoVpG_5hJCPI5P8u6hA6o49gA8o1BirD5RUX89M572YFM0v38ly6p4zTC7NqlvTaXr_Nm2QaT-1XurZKnyONDVQPjgAbWCVPRx_1lxxCrYVRymgKh586Yo4nhuY8k0Tb50L5aZYnesuFMXjo6OmXv-YAy1VKf9nL7WLRoIf3FOHEGticW15R5KnUgydMl403DCRuaoeuFncQXvqW2w4NSyxcJRK3sZIKLtLAZ8BpJpYmQogOUkyufgywc',
        'Content-Type': 'application/json',
      },
      params: {
        'number': number,
        'region': region,
        'season': 190,
        'program': 1,
        'level': level,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? recievedTeamID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  static String? teamRegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].location.region''',
      ));
  static String? eventAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].location.address_1''',
      ));
  static String? eventCity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].location.city''',
      ));
  static String? eventPostcode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].location.postcode''',
      ));
  static String? eventCountry(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].location.country''',
      ));
  static String? eventStart(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].start''',
      ));
  static String? eventName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
  static String? eventSKU(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].sku''',
      ));
}

class GetAllSkillsCall {
  static Future<ApiCallResponse> call({
    int? season = 190,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllSkills',
      apiUrl: 'https://www.robotevents.com/api/seasons/$season/skills',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? rank(dynamic response) => (getJsonField(
        response,
        r'''$[:].rank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? teamIDS(dynamic response) => (getJsonField(
        response,
        r'''$[:].team.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? scores(dynamic response) => getJsonField(
        response,
        r'''$[:].scores''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
