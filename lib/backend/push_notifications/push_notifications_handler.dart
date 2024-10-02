import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/TB-Star-Logo.png',
              width: MediaQuery.sizeOf(context).width * 0.25,
              height: MediaQuery.sizeOf(context).height * 0.25,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': (data) async => ParameterData(
        allParams: {
          'from': getParameter<int>(data, 'from'),
        },
      ),
  'login': ParameterData.none(),
  'settings': ParameterData.none(),
  'loading': (data) async => ParameterData(
        allParams: {
          'loadName': getParameter<String>(data, 'loadName'),
        },
      ),
  'createaccount': ParameterData.none(),
  'AccountCreation2': ParameterData.none(),
  'settings-general': ParameterData.none(),
  'settings-yourteam': ParameterData.none(),
  'settings-notifications': ParameterData.none(),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'Messages': (data) async => ParameterData(
        allParams: {
          'from': getParameter<int>(data, 'from'),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'Capture': ParameterData.none(),
  'Upgrade': ParameterData.none(),
  'Schedule': (data) async => ParameterData(
        allParams: {
          'from': getParameter<int>(data, 'from'),
        },
      ),
  'teamCreation': ParameterData.none(),
  'passwordReset': ParameterData.none(),
  'Explore': (data) async => ParameterData(
        allParams: {
          'from': getParameter<int>(data, 'from'),
        },
      ),
  'Schedule-EventDetails': (data) async => const ParameterData(
        allParams: {},
      ),
  'More': (data) async => ParameterData(
        allParams: {
          'from': getParameter<int>(data, 'from'),
        },
      ),
  'ContentCode': ParameterData.none(),
  'TeamContent': (data) async => ParameterData(
        allParams: {
          'teamID': getParameter<int>(data, 'teamID'),
        },
      ),
  'MatchChecklist': ParameterData.none(),
  'JoinTeam': ParameterData.none(),
  'ChooseVerifyMethod': ParameterData.none(),
  'VerifyWithNotebook': ParameterData.none(),
  'VerificationInProgress': ParameterData.none(),
  'AddTeamMember': ParameterData.none(),
  'VerificationFailed': ParameterData.none(),
  'VerifyInProgress-Other': ParameterData.none(),
  'JoinTeamCode': ParameterData.none(),
  'VerifyWithPicture': ParameterData.none(),
  'AllTeams': ParameterData.none(),
  'To-DoList': ParameterData.none(),
  'TeamProfile': ParameterData.none(),
  'WelcomeScreen1': ParameterData.none(),
  'entry': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
