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

import 'dart:convert'; // For JSON parsing
import 'dart:math'; // For random token selection
import 'package:http/http.dart' as http;

// Token List
const tokenList = [
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYzg4MjZiMTY3NmE3NjVhNTE1MzJiYWNhMzVmYzM5ZWRlZDA3OGZmOWY3NmQwMTBlN2E2YmYwZDE1NzA2ZGE5NTA3MzZlNTQzNDliOGRkYWUiLCJpYXQiOjE3MjI2MzI5MjYuMjM3ODM1OSwibmJmIjoxNzIyNjMyOTI2LjIzNzgzOTksImV4cCI6MjY2OTMyMTMyNi4yMzE0MjkxLCJzdWIiOiIxMzIyNTQiLCJzY29wZXMiOltdfQ.iouLObT8XqiWmWdErO34d554R27F1T0mcOVcbde2c6C7Gaol-9h3CA8f1KRBOJ9LSG2NT11APeS63CM32tTJwSsf47zmqKMd-Z-V4VYqc-I_OPDuqi5Jf86rjYYMYEzL3isDxMi_miNFveuw_N9HKKxfEPr3gEujjfVn4i5Geb0unOXOA55vrKHydMZcTmtV9fr5my2LFWxazJWTDyIDeumOXKA6hmkP08ZUwRoF7ukpcwUal-SBFi8DIg34KYff7xCDXWp_wr42TXYzA9LlBAUJVF8g5mDaBjtrg3smQ6wfTDEzHzlCSwMzLEFI3yHX5YCBOff7JRgf_bFyN_RkLerdGlu89JChvr_8HXQW7NQPf6DAxUkqOPt7W8ebDQQNEMNa-Y6rlg6jnGVMLBQ9NWzWSEAsUoD5HppPl90dXBSwJyhgWY2zKSfUhi3hycAyw00Hyw6S2cJmIks0uF_0n_7WO235Di5xExx5MuIiWounv_NmYM73oR8jzC-6RSUsdsZoXUK2YxBkshXbBDQpXfqYRRwcZUo9zTlCtgbX5Dm0k-G9oRwL3xiUlP9qBfqJCgiC6var9_sOR5J7oDSqVtnEqVF6kDK6om4EKmDzKqcOqNwOJWgc62qh3t-QA80LtlAVSJ3rwZWhykLVU3JO-iDGJzkLOMzuv0qnEYzGwng',
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2ZlM2RlZGZjOGQ5YjE2M2UzNzExM2FlMWU4N2YzNWRhZmM3MDc3NjM0YjlmNjk0NjkyYTUxZWFiZTc5YjVhM2I2NTQyYWVhMzVlYWNhMWMiLCJpYXQiOjE3MjI2MzMwNjguMTk2MDE4OSwibmJmIjoxNzIyNjMzMDY4LjE5NjAyMywiZXhwIjoyNjY5MzIxNDY4LjE4Nzc1NTEsInN1YiI6IjEzMjI1NCIsInNjb3BlcyI6W119.CLF-rwXU92kga_87MnGoAEvXfj_6Ge-SpHuu2juwrwU2t0b6Qa7jmCxs3o42L0hdwPDVjVNZUpzsP6V8MpapuxzD3Ba2gbwzeg_Gh61oBu2e8gA5JTv4q36Y67Bow9SugypPRdIhFt7Fe5nHs1Z702tapqzQc-1Q-TenorFm6G_eMN_V-cx4bTYRJ-FsGE1U62_gVhTudSyL5H5fxzZi5BxCwMjWITGXyqwn8y3cHPjpEbsZr9faU971TZyfisojd9oM6YbSuMEhMaO2GTgZRl0eIoHa9ylrzWS6dhyw0s6_qwOCll2z2SZuPnXGf2mAozMPEj5fEL1t9vZdghGzxQcHG6VBMnfMnfAB0k6xT2wDUrBA0Vt8y_N5wAIcglVuvPiLSXLo2mEejIx6ELFZ5Mno47yYghoXus_DnXHpqyoCdh9loyBYMAGjyX-SK8uuDJHpMeunQHcfCLwLeYCMflE833nv5XEca8hb5WQhq5knDu_XghBIWXjVjOVToLK2FRcY08vdTeFu3OxVaAm8000JMZjhyhg3r2r5wIcmOintgt_vZ8541UmkTCKvEHZ8ItV9SvwHhxiSxqBOC0nDO7ONCoiDdmu1xIdNJP-WshP_-kXZXqKk04HvtQ14swEDB9hJqSl1hJp4hNjH5ZH3CY65CWOPRedA7q06SM9cLPg',
];

class TeamInfoAPIForParams extends StatefulWidget {
  const TeamInfoAPIForParams({
    super.key,
    this.width,
    this.height,
    this.teamID,
    this.season,
  });

  final double? width;
  final double? height;
  final int? teamID;
  final String? season;

  @override
  _TeamInfoAPIForParamsState createState() => _TeamInfoAPIForParamsState();
}

class _TeamInfoAPIForParamsState extends State<TeamInfoAPIForParams> {
  Map<String, dynamic>? apiResponse; // Store parsed API response

  int getRandomIndex() {
    final random = Random();
    return random.nextInt(tokenList.length);
  }

  Future<void> fetchData() async {
    try {
      final randomIndex = getRandomIndex();
      final token = tokenList[randomIndex];
      final headers = {
        'Authorization': 'Bearer $token',
      };

      var teamID = widget.teamID ?? '';
      var season = widget.season ?? '';

      // API call
      var response = await http.get(
        Uri.parse(
            'https://www.robotevents.com/api/v2/teams/$teamID?season=$season'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        var data = jsonDecode(response.body);
        setState(() {
          apiResponse = data;
          FFAppState().update(() {
            FFAppState().teamInfoAPI = data;
          });
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
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
      // Customize widget appearance
      child: apiResponse != null
          ? Text(apiResponse.toString())
          : const Text('Loading...'),
    );
  }
}
