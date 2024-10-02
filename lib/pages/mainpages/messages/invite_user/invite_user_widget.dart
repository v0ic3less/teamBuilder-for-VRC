import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'invite_user_model.dart';
export 'invite_user_model.dart';

class InviteUserWidget extends StatefulWidget {
  const InviteUserWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final bool? parameter3;
  final ChatsRecord? parameter4;

  @override
  State<InviteUserWidget> createState() => _InviteUserWidgetState();
}

class _InviteUserWidgetState extends State<InviteUserWidget> {
  late InviteUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InviteUserModel());

    _model.chatTeamNumberTextController ??= TextEditingController();
    _model.chatTeamNumberFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 0.0, 30.0),
              child: Text(
                'Invite a team to chat',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Sora',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 30.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.chatTeamNumberTextController,
                  focusNode: _model.chatTeamNumberFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Team Number',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                  maxLength: 6,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (context,
                          {required currentLength,
                          required isFocused,
                          maxLength}) =>
                      null,
                  validator: _model.chatTeamNumberTextControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('INVITE_USER_COMP_SEND_INVITE_BTN_ON_TAP');
                  logFirebaseEvent('Button_backend_call');
                  _model.otherTeamID = await GetTeamIDCall.call(
                    method1: 'teams',
                    number: functions
                        .conToCaps(_model.chatTeamNumberTextController.text),
                  );

                  logFirebaseEvent('Button_firestore_query');
                  _model.teamExists = await queryTeamsRecordOnce(
                    queryBuilder: (teamsRecord) => teamsRecord.where(
                      'teamNum',
                      isEqualTo: functions
                          .conToCaps(_model.chatTeamNumberTextController.text),
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  if (getJsonField(
                        (_model.otherTeamID?.jsonBody ?? ''),
                        r'''$.data[:].id''',
                      ) !=
                      null) {
                    if (_model.teamExists != null) {
                      if (functions.conToCaps(valueOrDefault(
                              currentUserDocument?.teamNum, '')) ==
                          functions.conToCaps(
                              _model.chatTeamNumberTextController.text)) {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Cannot Create Chat With Yourself'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        if (widget.parameter4?.groupChatId ==
                            functions.combineStr(
                                functions.teamIDFormatConv(valueOrDefault(
                                    currentUserDocument?.teamID, 0))!,
                                functions.teamIDFormatConv(
                                    GetTeamIDCall.recievedTeamID(
                                  (_model.otherTeamID?.jsonBody ?? ''),
                                )!)!)) {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Chat Already Exists'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          logFirebaseEvent('Button_backend_call');
                          _model.usersTeam = await TeamsRecord.getDocumentOnce(
                              currentUserDocument!.teamRef!);
                          // newChat
                          logFirebaseEvent('Button_newChat');

                          var chatsRecordReference =
                              ChatsRecord.collection.doc();
                          await chatsRecordReference.set({
                            ...createChatsRecordData(
                              lastMessage: '',
                              lastMessageTime: getCurrentTimestamp,
                              lastMessageSentBy: currentUserReference,
                              groupChatId: functions.combineStr(
                                  functions.teamIDFormatConv(valueOrDefault(
                                      currentUserDocument?.teamID, 0))!,
                                  functions.teamIDFormatConv(
                                      GetTeamIDCall.recievedTeamID(
                                    (_model.otherTeamID?.jsonBody ?? ''),
                                  )!)!),
                              teamNumA: valueOrDefault(
                                  currentUserDocument?.teamNum, ''),
                              teamNumB: functions.conToCaps(
                                  _model.chatTeamNumberTextController.text),
                            ),
                            ...mapToFirestore(
                              {
                                'TeamID': functions.combineIntList(
                                    _model.teamExists!.teamID,
                                    valueOrDefault(
                                        currentUserDocument?.teamID, 0)),
                                'users': functions.combineDocRefLists(
                                    _model.teamExists!.teamMembers.toList(),
                                    _model.usersTeam!.teamMembers.toList()),
                              },
                            ),
                          });
                          _model.newChatThread =
                              ChatsRecord.getDocumentFromData({
                            ...createChatsRecordData(
                              lastMessage: '',
                              lastMessageTime: getCurrentTimestamp,
                              lastMessageSentBy: currentUserReference,
                              groupChatId: functions.combineStr(
                                  functions.teamIDFormatConv(valueOrDefault(
                                      currentUserDocument?.teamID, 0))!,
                                  functions.teamIDFormatConv(
                                      GetTeamIDCall.recievedTeamID(
                                    (_model.otherTeamID?.jsonBody ?? ''),
                                  )!)!),
                              teamNumA: valueOrDefault(
                                  currentUserDocument?.teamNum, ''),
                              teamNumB: functions.conToCaps(
                                  _model.chatTeamNumberTextController.text),
                            ),
                            ...mapToFirestore(
                              {
                                'TeamID': functions.combineIntList(
                                    _model.teamExists!.teamID,
                                    valueOrDefault(
                                        currentUserDocument?.teamID, 0)),
                                'users': functions.combineDocRefLists(
                                    _model.teamExists!.teamMembers.toList(),
                                    _model.usersTeam!.teamMembers.toList()),
                              },
                            ),
                          }, chatsRecordReference);
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            'chat_2_Details',
                            queryParameters: {
                              'chatRef': serializeParam(
                                _model.newChatThread,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chatRef': _model.newChatThread,
                            },
                          );
                        }
                      }
                    } else {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('User Not Found'),
                            content: const Text(
                                'The team you are trying to chat with isn\'t signed up on TeamBuilder'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('No Such Team'),
                          content:
                              const Text('No such team was found in our database.'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Retry'),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  safeSetState(() {});
                },
                text: 'Send Invite',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
