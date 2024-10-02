// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:http/http.dart' as http;

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

// Replace with your API endpoint and token list

var apiEndpoint;
const tokenList = [
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYzg4MjZiMTY3NmE3NjVhNTE1MzJiYWNhMzVmYzM5ZWRlZDA3OGZmOWY3NmQwMTBlN2E2YmYwZDE1NzA2ZGE5NTA3MzZlNTQzNDliOGRkYWUiLCJpYXQiOjE3MjI2MzI5MjYuMjM3ODM1OSwibmJmIjoxNzIyNjMyOTI2LjIzNzgzOTksImV4cCI6MjY2OTMyMTMyNi4yMzE0MjkxLCJzdWIiOiIxMzIyNTQiLCJzY29wZXMiOltdfQ.iouLObT8XqiWmWdErO34d554R27F1T0mcOVcbde2c6C7Gaol-9h3CA8f1KRBOJ9LSG2NT11APeS63CM32tTJwSsf47zmqKMd-Z-V4VYqc-I_OPDuqi5Jf86rjYYMYEzL3isDxMi_miNFveuw_N9HKKxfEPr3gEujjfVn4i5Geb0unOXOA55vrKHydMZcTmtV9fr5my2LFWxazJWTDyIDeumOXKA6hmkP08ZUwRoF7ukpcwUal-SBFi8DIg34KYff7xCDXWp_wr42TXYzA9LlBAUJVF8g5mDaBjtrg3smQ6wfTDEzHzlCSwMzLEFI3yHX5YCBOff7JRgf_bFyN_RkLerdGlu89JChvr_8HXQW7NQPf6DAxUkqOPt7W8ebDQQNEMNa-Y6rlg6jnGVMLBQ9NWzWSEAsUoD5HppPl90dXBSwJyhgWY2zKSfUhi3hycAyw00Hyw6S2cJmIks0uF_0n_7WO235Di5xExx5MuIiWounv_NmYM73oR8jzC-6RSUsdsZoXUK2YxBkshXbBDQpXfqYRRwcZUo9zTlCtgbX5Dm0k-G9oRwL3xiUlP9qBfqJCgiC6var9_sOR5J7oDSqVtnEqVF6kDK6om4EKmDzKqcOqNwOJWgc62qh3t-QA80LtlAVSJ3rwZWhykLVU3JO-iDGJzkLOMzuv0qnEYzGwng',
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2ZlM2RlZGZjOGQ5YjE2M2UzNzExM2FlMWU4N2YzNWRhZmM3MDc3NjM0YjlmNjk0NjkyYTUxZWFiZTc5YjVhM2I2NTQyYWVhMzVlYWNhMWMiLCJpYXQiOjE3MjI2MzMwNjguMTk2MDE4OSwibmJmIjoxNzIyNjMzMDY4LjE5NjAyMywiZXhwIjoyNjY5MzIxNDY4LjE4Nzc1NTEsInN1YiI6IjEzMjI1NCIsInNjb3BlcyI6W119.CLF-rwXU92kga_87MnGoAEvXfj_6Ge-SpHuu2juwrwU2t0b6Qa7jmCxs3o42L0hdwPDVjVNZUpzsP6V8MpapuxzD3Ba2gbwzeg_Gh61oBu2e8gA5JTv4q36Y67Bow9SugypPRdIhFt7Fe5nHs1Z702tapqzQc-1Q-TenorFm6G_eMN_V-cx4bTYRJ-FsGE1U62_gVhTudSyL5H5fxzZi5BxCwMjWITGXyqwn8y3cHPjpEbsZr9faU971TZyfisojd9oM6YbSuMEhMaO2GTgZRl0eIoHa9ylrzWS6dhyw0s6_qwOCll2z2SZuPnXGf2mAozMPEj5fEL1t9vZdghGzxQcHG6VBMnfMnfAB0k6xT2wDUrBA0Vt8y_N5wAIcglVuvPiLSXLo2mEejIx6ELFZ5Mno47yYghoXus_DnXHpqyoCdh9loyBYMAGjyX-SK8uuDJHpMeunQHcfCLwLeYCMflE833nv5XEca8hb5WQhq5knDu_XghBIWXjVjOVToLK2FRcY08vdTeFu3OxVaAm8000JMZjhyhg3r2r5wIcmOintgt_vZ8541UmkTCKvEHZ8ItV9SvwHhxiSxqBOC0nDO7ONCoiDdmu1xIdNJP-WshP_-kXZXqKk04HvtQ14swEDB9hJqSl1hJp4hNjH5ZH3CY65CWOPRedA7q06SM9cLPg',
];

class RandomTokenApiCall extends StatefulWidget {
  const RandomTokenApiCall(
      {Key? key,
      this.width,
      this.height,
      this.responseVar,
      this.method,
      this.number,
      this.program,
      this.teamID,
      this.season,
      this.end,
      this.eventID,
      this.type,
      this.div,
      this.start,
      this.region,
      this.level})
      : super(key: key);

  final double? width;
  final double? height;
  final int? responseVar;
  final String? method;
  final String? number;
  final int? program;
  final int? teamID;
  final int? season;
  final String? end;
  final int? eventID;
  final String? type;
  final int? div;
  final String? start;
  final String? region;
  final String? level;

  @override
  State<RandomTokenApiCall> createState() => _RandomTokenApiCallState();
}

class _RandomTokenApiCallState extends State<RandomTokenApiCall> {
  Map<String, dynamic>? apiResponse;
  int getRandomIndex() {
    final random = Random();
    return random.nextInt(tokenList.length);
  }

  Future<void> fetchData() async {
    final randomIndex = getRandomIndex();
    final token = tokenList[randomIndex];
    final headers = {
      'Authorization': 'Bearer $token',
    };

    var responseVar = widget.responseVar;

    var method = widget.method;
    var number = widget.number;
    var program = widget.program;
    var teamID = widget.teamID;
    var season = widget.season;
    var end = widget.end;
    var eventID = widget.eventID;
    var type = widget.type;
    var div = widget.div;
    var start = widget.start;
    var region = widget.region;
    var level = widget.level;

    var numberPar;
    var programPar;
    var teamIDPar;
    var seasonPar;
    var endPar;
    var eventIDPar;
    var typePar;
    var divPar;
    var startPar;
    var regionPar;
    var levelPar;

    if (number != null) {
      numberPar = '&number=$number';
    } else {
      numberPar = '';
    }

    if (program != null) {
      programPar = '&program=$program';
    } else {
      programPar = '';
    }

    if (teamID != null) {
      teamIDPar = '&id=$program';
    } else {
      teamIDPar = '';
    }

    if (season != null) {
      seasonPar = '&season=$season';
    } else {
      seasonPar = '';
    }

    if (end != null) {
      end = '&end=$end';
    } else {
      endPar = '';
    }

    if (eventID != null) {
      eventIDPar = '&eventID=$eventID';
    } else {
      eventIDPar = '';
    }

    if (type != null) {
      typePar = '&type=$type';
    } else {
      typePar = '';
    }

    if (div != null) {
      divPar = '&div=$div';
    } else {
      divPar = '';
    }

    if (start != null) {
      startPar = '&start=$start';
    } else {
      startPar = '';
    }

    if (region != null) {
      regionPar = '&region=$region';
    } else {
      regionPar = '';
    }

    if (level != null) {
      levelPar = '&level=$level';
    } else {
      levelPar = '';
    }

    print(numberPar);
    print(programPar);

    if (method == 'teams') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/teams?$numberPar$programPar';
    }

    if (method == 'teams/') {
      apiEndpoint = 'https://www.robotevents.com/api/v2/teams/$teamID';
    }

    if (method == 'teams/events') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/teams/$teamID/events?$seasonPar$endPar';
    }

    if (method == 'teams/matches') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/teams/$teamID/matches?$eventIDPar$seasonPar';
    }

    if (method == 'teams/rankings') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/teams/$teamID/rankings?$eventIDPar';
    }

    if (method == 'teams/skills') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/teams/$teamID/skills?$eventIDPar$typePar$seasonPar';
    }

    if (method == 'teams/awards') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/teams/$teamID/awards?$eventIDPar$seasonPar';
    }

    if (method == 'events') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/events?per_page=250$seasonPar$endPar$startPar$regionPar$levelPar';
    }

    if (method == 'events/') {
      apiEndpoint = 'https://www.robotevents.com/api/v2/events/$eventID';
    }

    if (method == 'events/teams') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/events/$eventID/teams?$numberPar';
    }

    if (method == 'events/matches') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/events/$eventID/divisions/$div/matches?$teamIDPar';
    }

    if (method == 'events/rankings') {
      apiEndpoint =
          'https://www.robotevents.com/api/v2/events/$eventID/divisions/$div/rankings?$teamIDPar';
    }

    if (method == 'teamInfo') {
      apiEndpoint = 'https://www.robotevents.com/api/v2/teams/$teamID';
    }

    final response =
        await http.get(Uri.parse('$apiEndpoint'), headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        apiResponse = jsonDecode(response.body);
        if (responseVar == 1) {
          FFAppState().update(() {
            FFAppState().APIResponse1 = jsonDecode(response.body);
          });
          FFAppState().update(() {});
        } else if (responseVar == 2) {
          FFAppState().update(() {
            FFAppState().APIResponse2 = jsonDecode(response.body);
          });
        } else if (responseVar == 3) {
          FFAppState().update(() {
            FFAppState().APIResponse3 = jsonDecode(response.body);
          });
        } else if (responseVar == 4) {
          FFAppState().update(() {
            FFAppState().APIResponse4 = jsonDecode(response.body);
          });
        } else if (responseVar == 5) {
          FFAppState().update(() {
            FFAppState().APIResponse5 = jsonDecode(response.body);
          });
        } else if (responseVar == 21) {
          FFAppState().update(() {
            FFAppState().APIResponse21 = jsonDecode(response.body);
          });
        }
      });
      FFAppState().update(() {});
    } else {
      // Handle error
      print('Error fetching data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // You can customize the widget's appearance here
      child: Text(apiResponse?.toString() ?? 'Loading...'),
    );
  }
}
