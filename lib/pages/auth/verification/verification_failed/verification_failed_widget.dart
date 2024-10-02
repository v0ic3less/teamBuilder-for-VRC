import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'verification_failed_model.dart';
export 'verification_failed_model.dart';

class VerificationFailedWidget extends StatefulWidget {
  const VerificationFailedWidget({super.key});

  @override
  State<VerificationFailedWidget> createState() =>
      _VerificationFailedWidgetState();
}

class _VerificationFailedWidgetState extends State<VerificationFailedWidget> {
  late VerificationFailedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationFailedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VerificationFailed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFICATION_FAILED_VerificationFailed_O');
      logFirebaseEvent('VerificationFailed_backend_call');

      await currentUserReference!.update({
        ...createUsersRecordData(
          verifiedOnTeam: false,
          email: '',
        ),
        ...mapToFirestore(
          {
            'teamLeader': FieldValue.delete(),
          },
        ),
      });
      logFirebaseEvent('VerificationFailed_firestore_query');
      _model.teamDoc = await queryTeamsRecordOnce(
        queryBuilder: (teamsRecord) => teamsRecord.where(
          'teamID',
          isEqualTo: valueOrDefault(currentUserDocument?.teamID, 0),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('VerificationFailed_backend_call');

      await _model.teamDoc!.reference.update({
        ...mapToFirestore(
          {
            'captainUID': FieldValue.delete(),
            'captainDisplayName': FieldValue.delete(),
          },
        ),
      });
      logFirebaseEvent('VerificationFailed_firestore_query');
      _model.chat = await queryChatsRecordOnce(
        queryBuilder: (chatsRecord) => chatsRecord.where(
          'group_chat_id',
          isEqualTo: functions
              .teamIDFormatConv(valueOrDefault(currentUserDocument?.teamID, 0)),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('VerificationFailed_backend_call');
      await _model.chat!.reference.delete();
      logFirebaseEvent('VerificationFailed_auth');
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signOut();
      GoRouter.of(context).clearRedirectLocation();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'VerificationFailed',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 6,
                      child: AuthUserStreamWidget(
                        builder: (context) => StreamBuilder<List<TeamsRecord>>(
                          stream: queryTeamsRecord(
                            queryBuilder: (teamsRecord) => teamsRecord.where(
                              'teamID',
                              isEqualTo: valueOrDefault(
                                  currentUserDocument?.teamID, 0),
                            ),
                            singleRecord: true,
                          )..listen((snapshot) {
                              List<TeamsRecord> formContainerTeamsRecordList =
                                  snapshot;
                              final formContainerTeamsRecord =
                                  formContainerTeamsRecordList.isNotEmpty
                                      ? formContainerTeamsRecordList.first
                                      : null;
                              if (_model.formContainerPreviousSnapshot !=
                                      null &&
                                  !const ListEquality(
                                          TeamsRecordDocumentEquality())
                                      .equals(
                                          formContainerTeamsRecordList,
                                          _model
                                              .formContainerPreviousSnapshot)) {
                                () async {
                                  logFirebaseEvent(
                                      'VERIFICATION_FAILED_formContainer_ON_DAT');
                                  if (formContainerTeamsRecord!.verified) {
                                    logFirebaseEvent(
                                        'formContainer_navigate_to');

                                    context.goNamed('HomePage');
                                  }

                                  safeSetState(() {});
                                }();
                              }
                              _model.formContainerPreviousSnapshot = snapshot;
                            }),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 35.0,
                                  height: 35.0,
                                  child: SpinKitSquareCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                ),
                              );
                            }
                            List<TeamsRecord> formContainerTeamsRecordList =
                                snapshot.data!;
                            final formContainerTeamsRecord =
                                formContainerTeamsRecordList.isNotEmpty
                                    ? formContainerTeamsRecordList.first
                                    : null;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'VERIFICATION_FAILED_formContainer_ON_TAP');
                                if (formContainerTeamsRecord!.verified) {
                                  logFirebaseEvent('formContainer_navigate_to');

                                  context.goNamed('HomePage');
                                }
                              },
                              child: Container(
                                width: 100.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: StreamBuilder<
                                    List<VerificationMessagesRecord>>(
                                  stream: queryVerificationMessagesRecord(
                                    queryBuilder:
                                        (verificationMessagesRecord) =>
                                            verificationMessagesRecord.where(
                                      'userID',
                                      isEqualTo: currentUserUid,
                                    ),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: SpinKitSquareCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 35.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<VerificationMessagesRecord>
                                        scrollingContainerVerificationMessagesRecordList =
                                        snapshot.data!;
                                    final scrollingContainerVerificationMessagesRecord =
                                        scrollingContainerVerificationMessagesRecordList
                                                .isNotEmpty
                                            ? scrollingContainerVerificationMessagesRecordList
                                                .first
                                            : null;

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 140.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Team Builder',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 430.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Verification Failed',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Text(
                                                        'We didn\'t have enough information to verify your account.\n\nTo retry, log in again with the same credentials.',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'VERIFICATION_FAILED_GO_TO_LOGIN_BTN_ON_T');
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context
                                                            .goNamed('login');
                                                      },
                                                      text: 'Go to Login',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
