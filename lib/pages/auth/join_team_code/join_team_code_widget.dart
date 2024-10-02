import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_report/user_report_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'join_team_code_model.dart';
export 'join_team_code_model.dart';

class JoinTeamCodeWidget extends StatefulWidget {
  const JoinTeamCodeWidget({super.key});

  @override
  State<JoinTeamCodeWidget> createState() => _JoinTeamCodeWidgetState();
}

class _JoinTeamCodeWidgetState extends State<JoinTeamCodeWidget>
    with TickerProviderStateMixin {
  late JoinTeamCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JoinTeamCodeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'JoinTeamCode'});
    animationsMap.addAll({
      'pinCodeOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 0.005,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: -0.01,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 0.005,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'JoinTeamCode',
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
                      child: Container(
                        width: 100.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Team Builder',
                                    style: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => SizedBox(
                                            width: 0.0,
                                            height: 0.0,
                                            child: custom_widgets
                                                .RandomTokenApiCall(
                                              width: 0.0,
                                              height: 0.0,
                                              responseVar: 1,
                                              method: 'teams/',
                                              teamID: valueOrDefault(
                                                  currentUserDocument?.teamID,
                                                  0),
                                            ),
                                          ),
                                        ),
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              StreamBuilder<List<TeamsRecord>>(
                                            stream: queryTeamsRecord(
                                              queryBuilder: (teamsRecord) =>
                                                  teamsRecord.where(
                                                'teamID',
                                                isEqualTo: valueOrDefault(
                                                    currentUserDocument?.teamID,
                                                    0),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 35.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TeamsRecord>
                                                  textTeamsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final textTeamsRecord =
                                                  textTeamsRecordList.isNotEmpty
                                                      ? textTeamsRecordList
                                                          .first
                                                      : null;

                                              return Text(
                                                'Ask ${valueOrDefault<String>(
                                                  textTeamsRecord
                                                      ?.captainDisplayName,
                                                  '[captainName]',
                                                )} for the join code they just recieved.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          letterSpacing: 0.0,
                                                        ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            'The code will be located in the \'Add Team Members\' section of Settings.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 36.0, 0.0, 0.0),
                                          child: PinCodeTextField(
                                            autoDisposeControllers: false,
                                            appContext: context,
                                            length: 6,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      letterSpacing: 0.0,
                                                    ),
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            enableActiveFill: false,
                                            autoFocus: true,
                                            enablePinAutofill: false,
                                            errorTextSpace: 16.0,
                                            showCursor: true,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            obscureText: false,
                                            hintCharacter: '●',
                                            keyboardType: TextInputType.number,
                                            pinTheme: PinTheme(
                                              fieldHeight: 44.0,
                                              fieldWidth: 44.0,
                                              borderWidth: 2.0,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(12.0),
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                topLeft: Radius.circular(12.0),
                                                topRight: Radius.circular(12.0),
                                              ),
                                              shape: PinCodeFieldShape.box,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              inactiveColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              selectedColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            controller:
                                                _model.pinCodeController,
                                            onChanged: (_) {},
                                            onCompleted: (_) async {
                                              logFirebaseEvent(
                                                  'JOIN_TEAM_CODE_PinCode_2w3hquuv_ON_PINCO');
                                              logFirebaseEvent(
                                                  'PinCode_firestore_query');
                                              _model.code =
                                                  await queryVerifyCodesRecordOnce(
                                                queryBuilder:
                                                    (verifyCodesRecord) =>
                                                        verifyCodesRecord.where(
                                                  'requestUID',
                                                  isEqualTo: currentUserUid,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.code?.code ==
                                                  _model.pinCodeController!
                                                      .text) {
                                                logFirebaseEvent(
                                                    'PinCode_backend_call');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  verifiedOnTeam: true,
                                                ));
                                                logFirebaseEvent(
                                                    'PinCode_backend_call');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  grade: getJsonField(
                                                    FFAppState().APIResponse1,
                                                    r'''$.data[:].grade''',
                                                  ).toString(),
                                                ));
                                                logFirebaseEvent(
                                                    'PinCode_backend_call');
                                                await _model.code!.reference
                                                    .delete();
                                                logFirebaseEvent(
                                                    'PinCode_navigate_to');

                                                context.pushNamed('HomePage');
                                              } else {
                                                logFirebaseEvent(
                                                    'PinCode_widget_animation');
                                                if (animationsMap[
                                                        'pinCodeOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'pinCodeOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }
                                                logFirebaseEvent(
                                                    'PinCode_clear_text_fields_pin_codes');
                                                safeSetState(() {
                                                  _model.pinCodeController
                                                      ?.clear();
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: _model
                                                .pinCodeControllerValidator
                                                .asValidator(context),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'pinCodeOnActionTriggerAnimation']!,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Builder(
                                                builder: (context) => Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'JOIN_TEAM_CODE_REPORT_IMPERSONATION_BTN_');
                                                      logFirebaseEvent(
                                                          'Button_firestore_query');
                                                      _model.team =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                                      'teamID',
                                                                      isEqualTo:
                                                                          valueOrDefault(
                                                                              currentUserDocument?.teamID,
                                                                              0),
                                                                    )
                                                                    .where(
                                                                      'uid',
                                                                      isNotEqualTo:
                                                                          currentUserUid,
                                                                    ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus(),
                                                              child: SizedBox(
                                                                height: 430.0,
                                                                width: 300.0,
                                                                child:
                                                                    UserReportWidget(
                                                                  reportedUserRef:
                                                                      _model
                                                                          .team!
                                                                          .reference,
                                                                  reporterUserRef:
                                                                      currentUserReference!,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        'Report Impersonation',
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
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
