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

import '../../flutter_flow/flutter_flow_util.dart';

import 'dart:math';
import 'package:http/http.dart' as http;

const tokenList = [
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYzg4MjZiMTY3NmE3NjVhNTE1MzJiYWNhMzVmYzM5ZWRlZDA3OGZmOWY3NmQwMTBlN2E2YmYwZDE1NzA2ZGE5NTA3MzZlNTQzNDliOGRkYWUiLCJpYXQiOjE3MjI2MzI5MjYuMjM3ODM1OSwibmJmIjoxNzIyNjMyOTI2LjIzNzgzOTksImV4cCI6MjY2OTMyMTMyNi4yMzE0MjkxLCJzdWIiOiIxMzIyNTQiLCJzY29wZXMiOltdfQ.iouLObT8XqiWmWdErO34d554R27F1T0mcOVcbde2c6C7Gaol-9h3CA8f1KRBOJ9LSG2NT11APeS63CM32tTJwSsf47zmqKMd-Z-V4VYqc-I_OPDuqi5Jf86rjYYMYEzL3isDxMi_miNFveuw_N9HKKxfEPr3gEujjfVn4i5Geb0unOXOA55vrKHydMZcTmtV9fr5my2LFWxazJWTDyIDeumOXKA6hmkP08ZUwRoF7ukpcwUal-SBFi8DIg34KYff7xCDXWp_wr42TXYzA9LlBAUJVF8g5mDaBjtrg3smQ6wfTDEzHzlCSwMzLEFI3yHX5YCBOff7JRgf_bFyN_RkLerdGlu89JChvr_8HXQW7NQPf6DAxUkqOPt7W8ebDQQNEMNa-Y6rlg6jnGVMLBQ9NWzWSEAsUoD5HppPl90dXBSwJyhgWY2zKSfUhi3hycAyw00Hyw6S2cJmIks0uF_0n_7WO235Di5xExx5MuIiWounv_NmYM73oR8jzC-6RSUsdsZoXUK2YxBkshXbBDQpXfqYRRwcZUo9zTlCtgbX5Dm0k-G9oRwL3xiUlP9qBfqJCgiC6var9_sOR5J7oDSqVtnEqVF6kDK6om4EKmDzKqcOqNwOJWgc62qh3t-QA80LtlAVSJ3rwZWhykLVU3JO-iDGJzkLOMzuv0qnEYzGwng',
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2ZlM2RlZGZjOGQ5YjE2M2UzNzExM2FlMWU4N2YzNWRhZmM3MDc3NjM0YjlmNjk0NjkyYTUxZWFiZTc5YjVhM2I2NTQyYWVhMzVlYWNhMWMiLCJpYXQiOjE3MjI2MzMwNjguMTk2MDE4OSwibmJmIjoxNzIyNjMzMDY4LjE5NjAyMywiZXhwIjoyNjY5MzIxNDY4LjE4Nzc1NTEsInN1YiI6IjEzMjI1NCIsInNjb3BlcyI6W119.CLF-rwXU92kga_87MnGoAEvXfj_6Ge-SpHuu2juwrwU2t0b6Qa7jmCxs3o42L0hdwPDVjVNZUpzsP6V8MpapuxzD3Ba2gbwzeg_Gh61oBu2e8gA5JTv4q36Y67Bow9SugypPRdIhFt7Fe5nHs1Z702tapqzQc-1Q-TenorFm6G_eMN_V-cx4bTYRJ-FsGE1U62_gVhTudSyL5H5fxzZi5BxCwMjWITGXyqwn8y3cHPjpEbsZr9faU971TZyfisojd9oM6YbSuMEhMaO2GTgZRl0eIoHa9ylrzWS6dhyw0s6_qwOCll2z2SZuPnXGf2mAozMPEj5fEL1t9vZdghGzxQcHG6VBMnfMnfAB0k6xT2wDUrBA0Vt8y_N5wAIcglVuvPiLSXLo2mEejIx6ELFZ5Mno47yYghoXus_DnXHpqyoCdh9loyBYMAGjyX-SK8uuDJHpMeunQHcfCLwLeYCMflE833nv5XEca8hb5WQhq5knDu_XghBIWXjVjOVToLK2FRcY08vdTeFu3OxVaAm8000JMZjhyhg3r2r5wIcmOintgt_vZ8541UmkTCKvEHZ8ItV9SvwHhxiSxqBOC0nDO7ONCoiDdmu1xIdNJP-WshP_-kXZXqKk04HvtQ14swEDB9hJqSl1hJp4hNjH5ZH3CY65CWOPRedA7q06SM9cLPg',
];

class HomePageAPI extends StatefulWidget {
  const HomePageAPI({
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
  _HomePageAPIState createState() => _HomePageAPIState();
}

class _HomePageAPIState extends State<HomePageAPI> {
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

    var teamID = widget.teamID;
    var season = widget.season;

    var teamIDPar = teamID != null ? '&teamID=$teamID' : '';
    var seasonPar = season != null ? '&season=$season' : '';

    var currentTimeLocal = DateTime.now();
    var startTimeMinusSix = currentTimeLocal.subtract(Duration(days: 6));
    var startTimePlusOne = currentTimeLocal.add(Duration(days: 1));
    var startTimePlusSix = currentTimeLocal.add(Duration(days: 6));
    var startTimeMinusOne = currentTimeLocal.subtract(Duration(days: 1));
    final formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
    var startTime = formatter.format(startTimeMinusSix);
    var startPar = '&start=$startTime';
    var filteredEvents;
    var upcomingEvents;

    // teams/events API (For future events)
    var inputTeamsUpcomingEvents = await http.get(
      Uri.parse(
          'https://www.robotevents.com/api/v2/teams/$teamID/events?season=190$startPar'),
      headers: headers,
    );
    final teamsEvents =
        jsonDecode(inputTeamsUpcomingEvents.body) as Map<String, dynamic>;

    var eventsData = teamsEvents['data'];
    print('eventsData has been set print $eventsData');

    var eventID;
    var div;
    var timeZoneOffset;

    if (eventsData != null) {
      final eventsWithinSixDays = eventsData
          .where((value) =>
              DateTime.parse(value['start'])
                      .subtract(Duration(hours: 4))
                      .compareTo(startTimeMinusSix) >
                  0 &&
              DateTime.parse(value['start'])
                      .subtract(Duration(hours: 4))
                      .compareTo(startTimePlusOne) <
                  0 &&
              DateTime.parse(value['end'])
                      .add(Duration(hours: 20))
                      .compareTo(startTimeMinusOne) >
                  0)
          .toList();
      upcomingEvents = eventsData
          .where((ev) =>
              ev['start'] != null &&
              ev['end'] != null &&
              DateTime.parse(ev['start']).compareTo(startTimePlusSix) >= 0)
          .toList();
      print('eventsWithinSixDays variable is set print $eventsWithinSixDays');
      if (eventsWithinSixDays.isNotEmpty && eventsWithinSixDays != null) {
        for (var location in eventsWithinSixDays) {
          print('print  location $location');
          if (location['location'] != null) {
            var lat = location['location']['coordinates']['lat'];
            var lon = location['location']['coordinates']['lon'];
            print('lat and lon is set print');
            if (lat != null && lon != null) {
              print('print lat and lon is not null');
              int random(int min, int max) {
                return min + Random().nextInt(max - min);
              }

              var randomInt = (random(0,
                  1000)); // Output : 19, 5, 15.. (5 -> 19, 20 is not included)
              var timeZoneResponse = await http.get(Uri.parse(
                  'https://corsproxy.io/?https://timeapi.io/api/timezone/coordinate?latitude=$lat&longitude=$lon&r=$randomInt'));
              print(
                  'timezon url print: https://corsproxy.io/?https://timeapi.io/api/timezone/coordinate?latitude=$lat&longitude=$lon&r=$randomInt');
              if (timeZoneResponse.statusCode == 200) {
                var timeZoneInfo =
                    jsonDecode(timeZoneResponse.body) as Map<String, dynamic>;
                print('timezon api was successful print $timeZoneInfo');
                if (timeZoneInfo != null &&
                    timeZoneInfo['currentLocalTime'] != null &&
                    DateTime.parse(location['end'])
                            .add(Duration(hours: 20))
                            .compareTo(DateTime.parse(
                                timeZoneInfo['currentLocalTime'])) >=
                        0 &&
                    DateTime.parse(location['start'])
                            .subtract(Duration(hours: 4))
                            .compareTo(DateTime.parse(
                                timeZoneInfo['currentLocalTime'])) <=
                        0) {
                  print(
                      'print the end time of the event was after the current local time');
                  print(
                      DateTime.parse(location['end']).add(Duration(hours: 20)));
                  if (location.isNotEmpty && location is List) {
                    eventID = location[0]['id'];
                    div = location[0]['divisions'][0]['id'];
                  } else if (location.isNotEmpty && location is! List) {
                    print('list was not a list and is not empty print');
                    eventID = location['id'];

                    div = location['divisions'][0]['id'];
                  } else {
                    print('location variable is empty print');
                  }
                  print('print $eventID and $div');
                  print(timeZoneInfo['currentLocalTime']);
                  print(location['end']);
                  print(
                      DateTime.parse(location['end']).add(Duration(hours: 20)));
                  print(DateTime.parse(timeZoneInfo['currentLocalTime']));
                  filteredEvents = location;
                  if (DateTime.parse(timeZoneInfo['currentLocalTime'])
                          .compareTo(currentTimeLocal) ==
                      0) {
                    timeZoneOffset = 0;
                  } else if (DateTime.parse(timeZoneInfo['currentLocalTime'])
                          .compareTo(currentTimeLocal) >=
                      0) {
                    var difference =
                        DateTime.parse(timeZoneInfo['currentLocalTime'])
                            .difference(currentTimeLocal);
                    timeZoneOffset = -difference.inHours;
                  } else if (DateTime.parse(timeZoneInfo['currentLocalTime'])
                          .compareTo(currentTimeLocal) <=
                      0) {
                    var difference =
                        DateTime.parse(timeZoneInfo['currentLocalTime'])
                            .difference(currentTimeLocal);
                    timeZoneOffset = difference.inHours;
                  }
                } else if (timeZoneInfo != null &&
                    timeZoneInfo['currentLocalTime'] != null &&
                    DateTime.parse(location['start'])
                            .subtract(Duration(hours: 4))
                            .compareTo(DateTime.parse(
                                timeZoneInfo['currentLocalTime'])) >=
                        0) {
                  print("bottom condition true print");
                  upcomingEvents.add(location);
                } else {
                  print("timeZoneInfo is null or doesnt meet criteria print");
                }
              } else {
                print('Failed to fetch timezone data print');
              }
            }
          } else {
            print('Location data is missing or invalid. print');
          }
        }
        print('print filtered events $filteredEvents');
        /*if (filteredEvents != null && filteredEvents.isNotEmpty) {
          setState(() {
            FFAppState().update(() {
              FFAppState().APIResponse1 = jsonDecode(filteredEvents);
            });
          });
        } else {
          print('No events found after filtering. print');
        }*/
      } else {
        print('No events found within the specified date range. print');
      }
    } else {
      print('eventsList is empty or not a list. print');
    }
    print('print code got to events/rankings');
    print('print upcoming events $upcomingEvents');

    if (eventID != null && div != null) {
      // events/rankings API
      var inputEventsRankings = await http.get(
        Uri.parse(
            'https://www.robotevents.com/api/v2/events/$eventID/divisions/$div/rankings?per_page=250'),
        headers: headers,
      );
      var eventsRankingsOutput =
          jsonDecode(inputEventsRankings.body) as Map<String, dynamic>;
      var eventsRankings = eventsRankingsOutput['data'];
      print(eventsRankings);

      // events/matches API
      var inputEventsMatches = await http.get(
        Uri.parse(
            'https://www.robotevents.com/api/v2/events/$eventID/divisions/$div/matches?per_page=250'),
        headers: headers,
      );
      var eventsMatchesOutput =
          jsonDecode(inputEventsMatches.body) as Map<String, dynamic>;
      var eventsMatches = eventsMatchesOutput['data'];

      // events/skills API
      var inputEventsSkills = await http.get(
        Uri.parse(
            'https://www.robotevents.com/api/v2/events/$eventID/skills?per_page=250'),
        headers: headers,
      );
      var eventsSkillsOutput =
          jsonDecode(inputEventsSkills.body) as Map<String, dynamic>;
      var eventsSkills = eventsSkillsOutput['data'];

      // events/teams API
      var inputEventsTeams = await http.get(
        Uri.parse(
            'https://www.robotevents.com/api/v2/events/$eventID/teams?per_page=250'),
        headers: headers,
      );
      var eventsTeamsOutput =
          jsonDecode(inputEventsTeams.body) as Map<String, dynamic>;
      var eventsTeams = eventsTeamsOutput['data'];

      // teams/rankings API
      var ranksList = eventsRankings as List;
      var teamsRankings =
          ranksList.where((vals) => vals['team']['id'] == teamID).toList();
      print('parsed teams/rankings print');

      // teams/skills API
      var skillsList = eventsSkills as List;
      var teamsSkills =
          skillsList.where((val) => val['team']['id'] == teamID).toList();

      // teams/matches API
      var matchesList = eventsMatches as List;
      var teamsMatches = matchesList.where((val) {
        var alliances = val['alliances'] as List; // Ensure alliances is a list
        return alliances.any((alliance) {
          var teams = alliance['teams']; // Get the teams
          if (teams is List) {
            // Check if teams is actually a list
            print('teams is a list print');
            return teams.any((team) => team['team']['id'] == teamID);
          }
          print('teams is not a list print');
          return false; // In case teams is not a list, skip
        });
      }).toList();
      print('blah');

      setState(() {
        FFAppState().update(() {
          FFAppState().APIResponse16 = filteredEvents;
          FFAppState().APIResponse17 = teamsRankings;
          //FFAppState().APIResponse3 = teamsMatches;
          //FFAppState().APIResponse4 = eventsRankings;
          //FFAppState().APIResponse5 = eventsMatches;
          //FFAppState().APIResponse6 = eventsSkills;
          //FFAppState().APIResponse7 = upcomingEvents;
          FFAppState().APIResponse18 = teamsSkills;
          //FFAppState().APIResponse9 = eventsTeams;
          FFAppState().TimeZoneOffset = timeZoneOffset;
        });
      });
    }

    setState(() {
      FFAppState().update(() {
        FFAppState().APIResponse7 = upcomingEvents;
        //FFAppState().TimeZoneOffset = timeZoneOffset;
      });
    });
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
