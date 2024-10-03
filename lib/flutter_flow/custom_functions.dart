import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertSTRToIMG(String? imagePath) {
  imagePath ??= '';

  return imagePath;
}

int subtractInt(
  int num1,
  int num2,
) {
  // adds two numbers together
  return num1 - num2;
}

double multiply(
  double num1,
  double num2,
) {
  // adds two numbers together
  return num1 * num2;
}

double subtract(
  double num1,
  double num2,
) {
  // adds two numbers together
  return num1 - num2;
}

double divide(
  double num1,
  double num2,
) {
  // adds two numbers together
  return num1 / num2;
}

DateTime? convDateTime(String? inputDateTime) {
  // Convert a date from RFC3339 format to a DateTime object
  if (inputDateTime == null) {
    return null;
  }
  var parsedString = DateTime.parse(inputDateTime).subtract(Duration(hours: 4));
  return parsedString;
}

String? convToWeb(String? str) {
  // Convert a normal string into one that can be used in a hyperlink
  if (str == null) {
    return null;
  }
  final regex = RegExp(r'[^\w\s]+');
  final replaced = str.replaceAll(regex, '');
  return Uri.encodeFull(replaced);
}

int calcNumLose(List<String> list) {
  // find the number of times "win" is listed in list
  int count = 0;
  for (String item in list) {
    if (item == 'lose') {
      count++;
    }
  }
  return count;
}

int calcNumTies(List<String> list) {
  // find the number of times "win" is listed in list
  int count = 0;
  for (String item in list) {
    if (item == 'tie') {
      count++;
    }
  }
  return count;
}

double add(
  double num1,
  double num2,
) {
  // adds two numbers together
  return num1 + num2;
}

double? getPercentage(
  List<int> scores,
  List<String> userTeams,
) {
  // Ensure the scores array has an even length
  if (scores.length % 2 != 0) {
    print('Error: The scores array must have an even length.');
    return null;
  }

  int matchesWon = 0;
  int totalMatches = scores.length ~/ 2;

  // Calculate the results of each match
  for (int i = 0; i < totalMatches; i++) {
    int scoreRed = scores[2 * i + 1];
    int scoreBlue = scores[2 * i];
    String userTeam = userTeams[i];

    // Determine the winner of the match
    String matchWinner = scoreRed > scoreBlue ? 'red' : 'blue';

    // Check if the user's team won
    if (userTeam == matchWinner) {
      matchesWon++;
    }
  }

  // Calculate the winning percentage
  double winningPercentage = (matchesWon / totalMatches) * 100;

  return winningPercentage;
}

int? sumSkills(List<String>? nums) {
  if (nums == null || nums.length != 2) {
    return null;
  }
  return int.parse(nums[0]) + int.parse(nums[1]);
}

bool? checkIfListIsEmpy(List<String>? list) {
  if (list != null && list.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

int? getFirstElm(List<int>? arr) {
  // get the first item of the array
  if (arr != null && arr.isNotEmpty) {
    return arr.first;
  } else {
    return null;
  }
}

int? combineInt(
  int firstInt,
  int secondInt,
) {
  // combine two integers 6 digits long into a single integer 12 digits long
  return int.parse('$firstInt$secondInt');
}

String? teamIDFormatConv(int teamID) {
  //  check if an input integer consists of less than six digits, and if it does, add leading zeros with padLeft until the intiger does have 6 digits, and output as a string
  String teamIDString = teamID.toString();
  if (teamIDString.length < 6) {
    teamIDString = teamIDString.padLeft(6, '0');
  }
  return teamIDString;
}

String? combineStr(
  String str1,
  String str2,
) {
  // combine two strings into one string
  return '$str1$str2';
}

String? matchNameConv(String input) {
// Use regular expressions to match and extract different formats
  RegExp practiceRegExp = RegExp(r'Practice #(\d+)');
  RegExp qualifierRegExp = RegExp(r'Qualifier #(\d+)');
  RegExp rFormatRegExp = RegExp(r'R16 #(\d+-\d+)');
  RegExp finalRegExp = RegExp(r'Final #(\d+-\d+)');
  RegExp sfRegExp = RegExp(r'SF #(\d+-\d+)');
  RegExp qfRegExp = RegExp(r'QF #(\d+-\d+)');

  if (qualifierRegExp.hasMatch(input)) {
    Match match = qualifierRegExp.firstMatch(input)!;
    String number = match.group(1)!;
    return 'Q$number';
  } else if (rFormatRegExp.hasMatch(input)) {
    Match match = rFormatRegExp.firstMatch(input)!;
    String numbers = match.group(1)!;
    return 'R$numbers';
  } else if (finalRegExp.hasMatch(input)) {
    Match match = finalRegExp.firstMatch(input)!;
    String numbers = match.group(1)!;
    return 'F$numbers';
  } else if (sfRegExp.hasMatch(input)) {
    Match match = sfRegExp.firstMatch(input)!;
    String numbers = match.group(1)!;
    return 'SF$numbers';
  } else if (qfRegExp.hasMatch(input)) {
    Match match = qfRegExp.firstMatch(input)!;
    String numbers = match.group(1)!;
    return 'QF$numbers';
  } else if (practiceRegExp.hasMatch(input)) {
    Match match = practiceRegExp.firstMatch(input)!;
    String numbers = match.group(1)!;
    return 'P$numbers';
  } else {
    // If the input string does not match the expected patterns, return 'NA'
    return 'NA';
  }
}

String? conToCaps(String? string) {
  // covert all letters in a string into capital letters
  if (string == null) return null;
  return string.toUpperCase();
}

List<String> calcMatchResults(
  List<String> scoresStr,
  List<String> matchColors,
) {
  // Convert scoresStr to List<int>
  List<int> scores = scoresStr.map((s) => int.parse(s.trim())).toList();

  // Find the number of trailing zeros
  int trailingZeroCount = 0;
  for (int i = scores.length - 1; i >= 0; i--) {
    if (scores[i] == 0) {
      trailingZeroCount++;
    } else {
      break;
    }
  }

  // Remove trailing zeros if their count is even
  if (trailingZeroCount % 2 == 0) {
    scores = scores.sublist(0, scores.length - trailingZeroCount);
  }

  // Trim matchColors to match the length of the trimmed scores
  int matchesCount = (scores.length / 2).ceil();
  matchColors = matchColors.sublist(0, matchesCount);

  // Organize items in scores into lists blueScores and redScores
  List<int> blueScores = [];
  List<int> redScores = [];

  for (int i = 0; i < scores.length; i++) {
    if (i % 2 == 0) {
      redScores.add(scores[i]);
    } else {
      blueScores.add(scores[i]);
    }
  }

  // Ensure both blueScores and redScores have the same length
  if (blueScores.length > redScores.length) {
    blueScores.removeLast();
  } else if (redScores.length > blueScores.length) {
    redScores.removeLast();
  }

  // Compare corresponding values of redScores, blueScores, and matchColors
  List<String> matchResults = [];

  for (int i = 0; i < redScores.length; i++) {
    if (redScores[i] > blueScores[i] && matchColors[i] == 'red') {
      matchResults.add('lose');
    } else if (redScores[i] < blueScores[i] && matchColors[i] == 'blue') {
      matchResults.add('lose');
    } else if (redScores[i] < blueScores[i] && matchColors[i] == 'red') {
      matchResults.add('win');
    } else if (redScores[i] > blueScores[i] && matchColors[i] == 'blue') {
      matchResults.add('win');
    } else {
      matchResults.add('tie');
    }
  }

  return matchResults;
}

int calcNumWins(List<String> list) {
  // find the number of times "win" is listed in list
  int count = 0;
  for (String item in list) {
    if (item == 'win') {
      count++;
    }
  }
  return count;
}

String? dateTimeToRobotEventsTime(DateTime? dateTime) {
  // Convert dateTime into a string with the following format: 2023-10-20T00:00:00 . YYYY-MM-DDTHH:MM:SS
  if (dateTime == null) return null;
  final formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
  return formatter.format(dateTime);
}

String? findPercentWinsLosses(
  int? wins,
  int? losses,
) {
  // find the percentages of wins to losses, and return it with a percent symbol at the end
  if (wins == null || losses == null || wins + losses == 0) {
    return null;
  }
  final double percentage = (wins / (wins + losses)) * 100;
  final String formattedPercentage = percentage.toStringAsFixed(0);
  return '$formattedPercentage%';
}

List<String>? strArrToIntArr(List<int>? intList) {
  // make a list of strings a list of integers, where the strings are always numbers
  return intList?.map((int i) => i.toString()).toList();
}

dynamic getNextMatch(dynamic matchRequest) {
  // Ensure matchRequest is not null and contains 'data'
  if (matchRequest != null && matchRequest is List) {
    final data = matchRequest;
    final currentTime = DateTime.now();
    final filterValue = currentTime.add(Duration(minutes: 5));
    // Filter out all practice matches that were scheduled to begin 5 minutes ago or later
    final List<dynamic> filteredPratcice = data
        .where((match) =>
            filterValue.compareTo(DateTime.parse(match['scheduled'])) > 0 &&
            match['name'].contains('Practice'))
        .toList();
    // Filter matches where 'started' is null
    final List<dynamic> filteredMatches =
        filteredPratcice.where((match) => match['started'] == null).toList();

    // Sort filtered matches by scheduled time (assuming 'scheduled' is a string in format YYYY-MM-DDTHH:MM:SS-HH:MM)
    filteredMatches.sort((a, b) {
      final DateTime aScheduledTime = DateTime.parse(a['scheduled']);
      final DateTime bScheduledTime = DateTime.parse(b['scheduled']);
      return aScheduledTime.compareTo(bScheduledTime);
    });

    // Return the filtered and sorted matches
    return filteredMatches;
  } else {
    // Return an empty list if matchRequest or 'data' is null
    return [];
  }
}

dynamic getOngoingEvents(dynamic eventsJSONResponse) {
// Ensure matchRequest is not null and contains 'data'
  if (eventsJSONResponse != null && eventsJSONResponse['data'] is List) {
    final data = eventsJSONResponse['data'];

    // Filter events where 'started' is null
    final List<dynamic> filteredEvents = data
        .where((val) =>
            val['ongoing'] == 'True' && val['awards_finalized'] == 'False')
        .toList();

    // Return the filtered and sorted events
    return filteredEvents;
  } else {
    return [];
  }

  // Return an empty list if eventsJSONResponse or 'data' is null
}

DateTime? timeFourDaysBack() {
  // create a function that takes the current datetime and goes back four days and outputs a new datetime
  final now = DateTime.now();
  final fourDaysAgo = now.subtract(Duration(days: 1));
  return fourDaysAgo;
}

dynamic getCompletedMatches(dynamic matchRequest) {
  // Ensure matchRequest is not null and contains 'data'
  if (matchRequest != null && matchRequest is List) {
    final data = matchRequest;

    // Filter matches where 'started' is null
    final List<dynamic> filteredMatches =
        data.where((match) => match['started'] != null).toList();

    // Sort filtered matches by scheduled time (assuming 'scheduled' is a string in format YYYY-MM-DDTHH:MM:SS-HH:MM)
    filteredMatches.sort((a, b) {
      final DateTime aScheduledTime = DateTime.parse(a['scheduled']);
      final DateTime bScheduledTime = DateTime.parse(b['scheduled']);
      return aScheduledTime.compareTo(bScheduledTime);
    });

    // Return the filtered and sorted matches
    return filteredMatches;
  } else {
    // Return an empty list if matchRequest or 'data' is null
    return [];
  }
}

DateTime? currentTimeUTC() {
  // convert current time to UTC
  return DateTime.now().toUtc();
}

List<String>? allianceColorFinder(
  dynamic matchesList,
  int? teamID,
) {
  List<String> allianceColors = [];

  // Iterate through each match in the matchesList
  for (var match in matchesList) {
    // Check if 'alliances' exists and is a list within the match
    if (match['alliances'] != null && match['alliances'] is List) {
      for (var alliance in match['alliances']) {
        // Check if 'teams' exists and is a list within the alliance
        if (alliance['teams'] != null && alliance['teams'] is List) {
          for (var team in alliance['teams']) {
            // Ensure team['team'] and team['team']['id'] exist before comparing
            if (team['team'] != null && team['team']['id'] == teamID) {
              // Add the corresponding alliance color to the list if it exists
              if (alliance['color'] != null && alliance['color'] is String) {
                allianceColors.add(alliance['color']);
              }
            }
          }
        }
      }
    }
  }

  return allianceColors;
}

bool? checkPasswordSecure(String? password) {
  // check if a password is secure. it should have a number, a uppercase and lowercase character, a special character, and at least a length of 8
  if (password == null) {
    return false;
  }

  final hasNumber = password.contains(RegExp(r'\d'));
  final hasUpper = password.contains(RegExp(r'[A-Z]'));
  final hasLower = password.contains(RegExp(r'[a-z]'));
  final hasSpecial =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-[]/\`~]'));
  final isLengthValid = password.length >= 8;

  return hasNumber && hasUpper && hasLower && hasSpecial && isLengthValid;
}

bool? checkLenOfStr(
  int? length,
  String? str,
) {
  // check if "str" is at least as long as "length"
  if (str == null || length == null) {
    return null;
  }
  return str.length >= length;
}

bool? checkStringsSame(
  String? str1,
  String? str2,
) {
  // check if str1 is equal to str2
  if (str1 == str2) {
    return true;
  } else {
    return false;
  }
}

int? jsonPathLength(dynamic list) {
  return list.length;
}

dynamic sortTeamsByTeamNum(dynamic eventsRankingsAPI) {
  // sort $.data[:].team.name which is formated with a 1-5 digit number and a letter at the end by going from smallest numbers to largest number and if two have the same numbers then sort by the letter in alphabetical order
  List<dynamic> teams = eventsRankingsAPI;
  teams.sort((a, b) {
    String aTeamNum = a['team']['name'];
    String bTeamNum = b['team']['name'];
    int aNum = int.parse(aTeamNum.replaceAll(RegExp('[^0-9]'), ''));
    int bNum = int.parse(bTeamNum.replaceAll(RegExp('[^0-9]'), ''));
    String aLetter = aTeamNum.replaceAll(RegExp('[0-9]'), '');
    String bLetter = bTeamNum.replaceAll(RegExp('[0-9]'), '');
    if (aNum == bNum) {
      return aLetter.compareTo(bLetter);
    } else {
      return aNum.compareTo(bNum);
    }
  });
  return teams.map((team) => team);
}

bool? checkIfJSONListIsEmpy(dynamic json) {
  if (json != null && json.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

DateTime? calcMatchStartTime(String startTime) {
  print('print matchStartTime=$startTime');
  if (startTime == null) {
    print('returning null');
    return null;
  }
  var localEventStartTime = DateTime.parse(startTime);
  return localEventStartTime;
}

dynamic sortByWP(dynamic jsonList) {
  jsonList.sort((a, b) => b['wp'].compareTo(a['wp']));
  return jsonList;
}

dynamic getProgOrDriveSkills(
  String progOrDrive,
  dynamic skillsAPI,
) {
  if (progOrDrive == 'program') {
    var programSkills = skillsAPI.where((val) => val['type'] = 'programming');
    return programSkills;
  } else if (progOrDrive == 'drive') {
    var driveSkills = skillsAPI.where((val) => val['type'] = 'driver');
    return driveSkills;
  }
}

int? getIndex(
  int itemInList,
  List<int> list,
) {
  int index = list.indexWhere((item) => item == itemInList);
  if (index != -1) {
    return index;
  } else {
    return null;
  }
}

int? calcMatchScheduleStartTime(String datetime) {
  var time = DateTime.parse(datetime);
  var unixTime = time.millisecondsSinceEpoch;
  return unixTime;
}

double? calcOPR(
  dynamic json,
  int? teamID,
) {
  if (json == null || teamID == null) {
    return null;
  }

  // Parse the matches
  List<dynamic> matches = json;
  Map<int, List<double>> teamScores = {};
  Map<int, int> teamParticipation = {};

  for (var match in matches) {
    // For each alliance, extract scores and teams
    for (var alliance in match['alliances']) {
      int allianceScore = alliance['score'];
      List<dynamic> teams = alliance['teams'];

      // Distribute the alliance score equally to each team
      double individualScoreContribution = allianceScore / teams.length;

      // Track score contribution for each team in the alliance
      for (var teamData in teams) {
        int currentTeamID = teamData['team']['id'];

        if (!teamScores.containsKey(currentTeamID)) {
          teamScores[currentTeamID] = [];
          teamParticipation[currentTeamID] = 0;
        }

        // Add score contribution for the team and count its participation
        teamScores[currentTeamID]?.add(individualScoreContribution);
        teamParticipation[currentTeamID] =
            teamParticipation[currentTeamID]! + 1;
      }
    }
  }

  // Calculate OPR for the target team
  if (teamScores.containsKey(teamID) && teamParticipation[teamID]! > 0) {
    List<double> scores = teamScores[teamID]!;
    // OPR is the average score contribution across all matches
    double totalScore = scores.reduce((a, b) => a + b);
    double opr = totalScore / teamParticipation[teamID]!;

    // Round to two decimal places and return
    return double.parse(opr.toStringAsFixed(2));
  } else {
    return null; // Return null if the team has no matches
  }
}

double? calcDPR(
  dynamic json,
  int? teamID,
) {
  if (json == null || teamID == null) {
    return null;
  }

  // Parse the matches
  List<dynamic> matches = json;
  Map<int, List<double>> defensiveScores = {};
  Map<int, int> teamParticipation = {};

  for (var match in matches) {
    // Check alliances
    List<dynamic> alliances = match['alliances'];

    // Assume there are exactly two alliances, "red" and "blue"
    var redAlliance = alliances[0];
    var blueAlliance = alliances[1];

    // Determine if the teamID is in either alliance
    bool isInRed = redAlliance['teams']
        .any((teamData) => teamData['team']['id'] == teamID);
    bool isInBlue = blueAlliance['teams']
        .any((teamData) => teamData['team']['id'] == teamID);

    // Get the opposing score if the team is in one of the alliances
    int opposingScore = 0;

    if (isInRed) {
      opposingScore = blueAlliance['score'];
    } else if (isInBlue) {
      opposingScore = redAlliance['score'];
    } else {
      continue; // Skip this match if the team isn't in either alliance
    }

    // Track defensive performance
    List<dynamic> teamList =
        isInRed ? redAlliance['teams'] : blueAlliance['teams'];

    for (var teamData in teamList) {
      int currentTeamID = teamData['team']['id'];

      if (!defensiveScores.containsKey(currentTeamID)) {
        defensiveScores[currentTeamID] = [];
        teamParticipation[currentTeamID] = 0;
      }

      // Add the score of the opposing alliance
      defensiveScores[currentTeamID]?.add(opposingScore.toDouble());
      teamParticipation[currentTeamID] = teamParticipation[currentTeamID]! + 1;
    }
  }

  // Calculate DPR for the target team
  if (defensiveScores.containsKey(teamID) && teamParticipation[teamID]! > 0) {
    List<double> scoresAgainst = defensiveScores[teamID]!;
    // DPR is the average score against this team across all matches
    double totalScoreAgainst = scoresAgainst.reduce((a, b) => a + b);

    // Round to two decimal places and return
    return double.parse(
        (totalScoreAgainst / teamParticipation[teamID]!).toStringAsFixed(2));
  } else {
    return null; // Return null if the team has no matches
  }
}

double? calcCCWM(
  double? opr,
  double? dpr,
) {
  // Ensure both OPR and DPR are not null
  if (opr == null || dpr == null) {
    return null;
  }

  // CCWM is calculated as the difference between OPR and DPR
  double ccwm = opr - dpr;

  // Round to two decimal places and return
  return double.parse(ccwm.toStringAsFixed(2));
}

String? trueSkillParser(
  String? teamName,
  String? jsonString,
) {
  if (teamName == null ||
      teamName.isEmpty ||
      jsonString == null ||
      jsonString.isEmpty) {
    return "N/A"; // Return "N/A" if inputs are invalid
  }

  try {
    // Parse the provided JSON string into a Dart Map
    final Map<String, dynamic> parsedJson = jsonDecode(jsonString);

    // Search for the team by name
    for (var key in parsedJson.keys) {
      var team = parsedJson[key];
      if (team['name'] == teamName) {
        // Return the trueSkill of the found team as a string
        return team['trueSkill']?.toString() ?? "N/A";
      }
    }

    // If the team is not found, return "N/A"
    return "N/A";
  } catch (e) {
    print('Error parsing JSON or finding team: $e');
    return "N/A"; // Return "N/A" in case of any parsing errors
  }
}

String? ccwmParser(
  String? teamName,
  String? jsonString,
) {
  if (teamName == null ||
      teamName.isEmpty ||
      jsonString == null ||
      jsonString.isEmpty) {
    return "N/A"; // Return "N/A" if inputs are invalid
  }

  try {
    // Parse the provided JSON string into a Dart Map
    final Map<String, dynamic> parsedJson = jsonDecode(jsonString);

    // Search for the team by name
    for (var key in parsedJson.keys) {
      var team = parsedJson[key];
      if (team['name'] == teamName) {
        // Return the CCWM of the found team as a string
        return team['ccwm']?.toString() ?? "N/A";
      }
    }

    // If the team is not found, return "N/A"
    return "N/A";
  } catch (e) {
    print('Error parsing JSON or finding team: $e');
    return "N/A"; // Return "N/A" in case of any parsing errors
  }
}

List<DocumentReference> combineDocRefLists(
  List<DocumentReference> listOne,
  List<DocumentReference> listTwo,
) {
  // create a function that combines listOne and listTwo
  List<DocumentReference> combinedList = [];
  combinedList.addAll(listOne);
  combinedList.addAll(listTwo);
  return combinedList;
}

List<int> combineIntList(
  int intOne,
  int intTwo,
) {
  // create a function that combines intOne and intTwo into a single integer list
  return [intOne, intTwo];
}

int? matchTeamIDtoRank(
  List<int>? teamIDS,
  List<int>? teamRanks,
  int? targetID,
) {
  if (teamIDS == null ||
      teamRanks == null ||
      teamIDS.length != teamRanks.length ||
      targetID == null) {
    return null; // Return null if inputs are invalid or lengths don't match, or if targetID is null
  }

  // Find the index of the targetID in the teamIDS list
  int teamIndex = teamIDS.indexOf(targetID);

  // If the targetID exists in the list, return the corresponding rank; otherwise return null
  if (teamIndex != -1) {
    return teamRanks[teamIndex];
  } else {
    return null; // Return null if the targetID is not found
  }
}

String? getTeamSkillsData(
  int? targetTeamID,
  List<int>? teamIDS,
  List<dynamic>? teamData,
  String? method,
) {
// Helper function to format dates as MM/DD/YYYY
  String formatDate(String dateString) {
    if (dateString.isEmpty)
      return ""; // Return empty if the date is not available

    DateTime parsedDate = DateTime.parse(dateString);
    return DateFormat('MM/dd/yyyy')
        .format(parsedDate); // Return date in MM/DD/YYYY format
  }

  // Ensure targetTeamID is not null and teamIDS is valid
  if (targetTeamID != null && teamIDS != null && teamIDS.isNotEmpty) {
    // Find the index of the target team in the teamIDS list
    int teamIndex = teamIDS.indexOf(targetTeamID);

    // Check if the target team index is valid
    if (teamIndex != -1 && teamData != null && teamData.length > teamIndex) {
      // Get the corresponding team data from the array
      var teamInfo = teamData[teamIndex];

      // Check the method and return the corresponding property
      switch (method) {
        case "progStopTime":
          return teamInfo["progStopTime"]?.toString();
        case "driverStopTime":
          return teamInfo["driverStopTime"]?.toString();
        case "maxProgramming":
          return teamInfo["maxProgramming"]?.toString();
        case "maxDriver":
          return teamInfo["maxDriver"]?.toString();
        case "progScoredAt":
          return formatDate(teamInfo["progScoredAt"]);
        case "driverScoredAt":
          return formatDate(teamInfo["driverScoredAt"]);
        case "programming":
          return teamInfo["programming"]?.toString();
        case "driver":
          return teamInfo["driver"]?.toString();
        case "score":
          return teamInfo["score"]?.toString();
        default:
          return null; // Return null if the method is not recognized
      }
    }
  }

  // If the team is not found or data is invalid, return null
  return null;
}

String? addSuffixtoNumber(String? number) {
  // Check if the input is valid
  if (number == null || number.isEmpty) {
    return null;
  }

  // Convert the string number to an integer
  int? num = int.tryParse(number);

  // If parsing fails, return the original string
  if (num == null) {
    return number;
  }

  // Handle special cases for numbers ending in 11, 12, or 13
  if (num % 100 >= 11 && num % 100 <= 13) {
    return '$num th';
  }

  // For all other cases, check the last digit
  switch (num % 10) {
    case 1:
      return '$num st';
    case 2:
      return '$num nd';
    case 3:
      return '$num rd';
    default:
      return '$num th';
  }
}

List<int>? objtoint(List<dynamic>? json) {
  // Return null if input is null
  if (json == null) return null;

  // Filter and map the list, keeping only integers
  return json.whereType<int>().toList();
}

String? avgelement(
  List<int>? intList,
  int? amountofDecimals,
) {
  if (intList == null || intList.isEmpty) {
    return "N/A";
  }

  // Sum the elements as double
  double sum = intList
      .map((e) => e.toDouble())
      .reduce((value, element) => value + element);

  double average = sum / intList.length;

  // Format the average to the specified number of decimal places
  return average.toStringAsFixed(amountofDecimals ??
      2); // Default to 2 decimal places if amountofDecimals is null
}
