import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'verification_in_progress_model.dart';
export 'verification_in_progress_model.dart';

class VerificationInProgressWidget extends StatefulWidget {
  const VerificationInProgressWidget({super.key});

  @override
  State<VerificationInProgressWidget> createState() =>
      _VerificationInProgressWidgetState();
}

class _VerificationInProgressWidgetState
    extends State<VerificationInProgressWidget> {
  late VerificationInProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationInProgressModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VerificationInProgress'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFICATION_IN_PROGRESS_VerificationInP');
      logFirebaseEvent('VerificationInProgress_firestore_query');
      _model.verifMsg = await queryVerificationMessagesRecordOnce(
        queryBuilder: (verificationMessagesRecord) => verificationMessagesRecord
            .where(
              'teamID',
              isEqualTo: valueOrDefault(currentUserDocument?.teamID, 0),
            )
            .orderBy('date', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.verifMsg != null) {
        if (_model.verifMsg?.message == 0) {
          logFirebaseEvent('VerificationInProgress_backend_call');
          await _model.verifMsg!.reference.delete();
          logFirebaseEvent('VerificationInProgress_navigate_to');

          context.goNamed(
            'VerificationFailed',
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
        title: 'VerificationInProgress',
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
                        builder: (context) =>
                            StreamBuilder<List<VerificationMessagesRecord>>(
                          stream: queryVerificationMessagesRecord(
                            queryBuilder: (verificationMessagesRecord) =>
                                verificationMessagesRecord.where(
                              'teamID',
                              isEqualTo: valueOrDefault(
                                  currentUserDocument?.teamID, 0),
                            ),
                          )..listen((snapshot) {
                              List<VerificationMessagesRecord>
                                  containerVerificationMessagesRecordList =
                                  snapshot;
                              if (_model.containerPreviousSnapshot != null &&
                                  !const ListEquality(
                                          VerificationMessagesRecordDocumentEquality())
                                      .equals(
                                          containerVerificationMessagesRecordList,
                                          _model.containerPreviousSnapshot)) {
                                () async {
                                  logFirebaseEvent(
                                      'VERIFICATION_IN_PROGRESS_Container_9nmmi');
                                  logFirebaseEvent('Container_firestore_query');
                                  _model.verifMsgCopy =
                                      await queryVerificationMessagesRecordOnce(
                                    queryBuilder:
                                        (verificationMessagesRecord) =>
                                            verificationMessagesRecord
                                                .where(
                                                  'teamID',
                                                  isEqualTo: valueOrDefault(
                                                      currentUserDocument
                                                          ?.teamID,
                                                      0),
                                                )
                                                .orderBy('date',
                                                    descending: true),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.verifMsg != null) {
                                    if (_model.verifMsg?.message == 0) {
                                      logFirebaseEvent(
                                          'Container_backend_call');
                                      await _model.verifMsg!.reference.delete();
                                      logFirebaseEvent('Container_navigate_to');

                                      context.goNamed(
                                        'VerificationFailed',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    }
                                  }

                                  safeSetState(() {});
                                }();
                              }
                              _model.containerPreviousSnapshot = snapshot;
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
                            List<VerificationMessagesRecord>
                                containerVerificationMessagesRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: StreamBuilder<List<TeamsRecord>>(
                                stream: queryTeamsRecord(
                                  queryBuilder: (teamsRecord) =>
                                      teamsRecord.where(
                                    'teamID',
                                    isEqualTo: valueOrDefault(
                                        currentUserDocument?.teamID, 0),
                                  ),
                                  singleRecord: true,
                                )..listen((snapshot) {
                                    List<TeamsRecord>
                                        formContainerTeamsRecordList = snapshot;
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
                                            'VERIFICATION_IN_PROGRESS_formContainer_O');
                                        logFirebaseEvent(
                                            'formContainer_action_block');
                                        await action_blocks.checkVerify(
                                          context,
                                          redirectToHome: true,
                                        );

                                        safeSetState(() {});
                                      }();
                                    }
                                    _model.formContainerPreviousSnapshot =
                                        snapshot;
                                  }),
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
                                  List<TeamsRecord>
                                      formContainerTeamsRecordList =
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
                                          'VERIFICATION_IN_PROGRESS_formContainer_O');
                                      if (formContainerTeamsRecord!.verified) {
                                        logFirebaseEvent(
                                            'formContainer_navigate_to');

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
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Team Builder',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(24.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Verification In Progress',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                          'We\'re working on making sure we know who you are. You\'ll recieve an email when you have been verified.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Text(
                                                          'In the meantime, verify your email so you can use all of Team Builder\'s features.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'VERIFICATION_IN_PROGRESS_REFRESH_BTN_ON_');
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                              'HomePage');
                                                        },
                                                        text: 'Refresh',
                                                        options:
                                                            FFButtonOptions(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
