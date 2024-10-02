import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future checkVerify(
  BuildContext context, {
  required bool? redirectToHome,
}) async {
  TeamsRecord? teamDoc;

  if (!FFAppState().verified) {
    logFirebaseEvent('checkVerify_firestore_query');
    teamDoc = await queryTeamsRecordOnce(
      queryBuilder: (teamsRecord) => teamsRecord.where(
        'teamID',
        isEqualTo: valueOrDefault(currentUserDocument?.teamID, 0),
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (teamDoc!.verified) {
      if (valueOrDefault<bool>(currentUserDocument?.verifiedOnTeam, false)) {
        logFirebaseEvent('checkVerify_update_app_state');
        FFAppState().verified = true;
      } else {
        if (teamDoc.captainUID == currentUserUid) {
          logFirebaseEvent('checkVerify_update_app_state');
          FFAppState().verified = true;
          logFirebaseEvent('checkVerify_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            verifiedOnTeam: true,
          ));
        } else {
          logFirebaseEvent('checkVerify_navigate_to');

          context.pushNamed('JoinTeam');

          return;
        }
      }
    } else {
      if (teamDoc.captainUID != '') {
        if (teamDoc.captainUID == currentUserUid) {
          logFirebaseEvent('checkVerify_navigate_to');

          context.pushNamed('VerificationInProgress');

          return;
        } else {
          logFirebaseEvent('checkVerify_navigate_to');

          context.pushNamed('VerifyInProgress-Other');

          return;
        }
      } else {
        if (valueOrDefault(currentUserDocument?.teamNum, '') == '') {
          logFirebaseEvent('checkVerify_navigate_to');

          context.goNamed(
            'AccountCreation2',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        } else {
          logFirebaseEvent('checkVerify_navigate_to');

          context.pushNamed('ChooseVerifyMethod');

          return;
        }
      }
    }
  }
  if (redirectToHome!) {
    logFirebaseEvent('checkVerify_navigate_to');

    context.goNamed(
      'HomePage',
      extra: <String, dynamic>{
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }
}

Future<bool> checkVerifyReturn(BuildContext context) async {
  TeamsRecord? teamDoc;

  if (!FFAppState().verified) {
    logFirebaseEvent('checkVerifyReturn_firestore_query');
    teamDoc = await queryTeamsRecordOnce(
      queryBuilder: (teamsRecord) => teamsRecord.where(
        'teamID',
        isEqualTo: valueOrDefault(currentUserDocument?.teamID, 0),
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (teamDoc!.verified) {
      if (valueOrDefault<bool>(currentUserDocument?.verifiedOnTeam, false)) {
        logFirebaseEvent('checkVerifyReturn_update_app_state');
        FFAppState().verified = true;
      } else {
        if (teamDoc.captainUID == currentUserUid) {
          logFirebaseEvent('checkVerifyReturn_update_app_state');
          FFAppState().verified = true;
          logFirebaseEvent('checkVerifyReturn_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            verifiedOnTeam: true,
          ));
        } else {
          return false;
        }
      }
    } else {
      if (teamDoc.captainUID != '') {
        if (teamDoc.captainUID == currentUserUid) {
          return false;
        }

        return false;
      } else {
        if (valueOrDefault(currentUserDocument?.teamNum, '') == '') {
          return false;
        }

        return false;
      }
    }
  }
  return true;
}

Future clearAPIResponses(BuildContext context) async {
  logFirebaseEvent('clearAPIResponses_update_app_state');
  FFAppState().APIResponse1 = null;
  FFAppState().APIResponse2 = null;
  FFAppState().APIResponse3 = null;
  FFAppState().APIResponse4 = null;
  FFAppState().APIResponse5 = null;
  FFAppState().APIResponse6 = null;
  FFAppState().APIResponse7 = null;
  FFAppState().APIResponse8 = null;
  FFAppState().APIResponse9 = null;
  FFAppState().APIResponse10 = null;
  FFAppState().APIResponse11 = null;
  FFAppState().APIResponse12 = null;
  FFAppState().APIResponse13 = null;
  FFAppState().APIResponse14 = null;
  FFAppState().APIResponse15 = null;
  FFAppState().APIResponse16 = null;
  FFAppState().APIResponse17 = null;
  FFAppState().APIResponse18 = null;
  FFAppState().APIResponse19 = null;
  FFAppState().APIResponse20 = null;
  FFAppState().update(() {});
}

Future messageTeam(
  BuildContext context, {
  required int? teamID,
  required String? teamNum,
}) async {
  TeamsRecord? teamExists;
  ChatsRecord? chatSearch;
  ChatsRecord? newChatThread;

  logFirebaseEvent('messageTeam_firestore_query');
  teamExists = await queryTeamsRecordOnce(
    queryBuilder: (teamsRecord) => teamsRecord.where(
      'teamID',
      isEqualTo: teamID,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (teamExists != null) {
    logFirebaseEvent('messageTeam_firestore_query');
    chatSearch = await queryChatsRecordOnce(
      queryBuilder: (chatsRecord) => chatsRecord.where(Filter.or(
        Filter(
          'group_chat_id',
          isEqualTo: functions.combineStr(
              functions.teamIDFormatConv(teamID!)!,
              functions.teamIDFormatConv(
                  valueOrDefault(currentUserDocument?.teamID, 0))!),
        ),
        Filter(
          'group_chat_id',
          isEqualTo: functions.combineStr(
              functions.teamIDFormatConv(
                  valueOrDefault(currentUserDocument?.teamID, 0))!,
              functions.teamIDFormatConv(teamID)!),
        ),
      )),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (chatSearch != null) {
      logFirebaseEvent('messageTeam_navigate_to');

      context.pushNamed(
        'chat_2_Details',
        queryParameters: {
          'chatRef': serializeParam(
            chatSearch,
            ParamType.Document,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'chatRef': chatSearch,
        },
      );
    } else {
      // newChat
      logFirebaseEvent('messageTeam_newChat');

      var chatsRecordReference = ChatsRecord.collection.doc();
      await chatsRecordReference.set({
        ...createChatsRecordData(
          lastMessage: '',
          lastMessageTime: getCurrentTimestamp,
          lastMessageSentBy: currentUserReference,
          groupChatId: functions.combineStr(
              functions.teamIDFormatConv(
                  valueOrDefault(currentUserDocument?.teamID, 0))!,
              teamID!.toString()),
          teamNumA: valueOrDefault(currentUserDocument?.teamNum, ''),
          teamNumB: functions.conToCaps(teamNum),
        ),
        ...mapToFirestore(
          {
            'TeamID': [valueOrDefault(currentUserDocument?.teamID, 0)],
          },
        ),
      });
      newChatThread = ChatsRecord.getDocumentFromData({
        ...createChatsRecordData(
          lastMessage: '',
          lastMessageTime: getCurrentTimestamp,
          lastMessageSentBy: currentUserReference,
          groupChatId: functions.combineStr(
              functions.teamIDFormatConv(
                  valueOrDefault(currentUserDocument?.teamID, 0))!,
              teamID.toString()),
          teamNumA: valueOrDefault(currentUserDocument?.teamNum, ''),
          teamNumB: functions.conToCaps(teamNum),
        ),
        ...mapToFirestore(
          {
            'TeamID': [valueOrDefault(currentUserDocument?.teamID, 0)],
          },
        ),
      }, chatsRecordReference);
      logFirebaseEvent('messageTeam_backend_call');

      await newChatThread.reference.update({
        ...mapToFirestore(
          {
            'TeamID': FieldValue.arrayUnion([teamID]),
          },
        ),
      });
      logFirebaseEvent('messageTeam_navigate_to');

      context.pushNamed(
        'chat_2_Details',
        queryParameters: {
          'chatRef': serializeParam(
            newChatThread,
            ParamType.Document,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'chatRef': newChatThread,
        },
      );
    }
  } else {
    logFirebaseEvent('messageTeam_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Uh Oh!'),
          content:
              const Text('It looks like this team isn\'t signed up to Team Builder!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
