import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'verify_with_picture_model.dart';
export 'verify_with_picture_model.dart';

class VerifyWithPictureWidget extends StatefulWidget {
  const VerifyWithPictureWidget({super.key});

  @override
  State<VerifyWithPictureWidget> createState() =>
      _VerifyWithPictureWidgetState();
}

class _VerifyWithPictureWidgetState extends State<VerifyWithPictureWidget>
    with TickerProviderStateMixin {
  late VerifyWithPictureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyWithPictureModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VerifyWithPicture'});
    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: 0.0,
            end: 1.0,
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
        title: 'VerifyWithPicture',
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
                                          CrossAxisAlignment.stretch,
                                      children: [
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
                                                'Verify with Picture & Discord',
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
                                                  0.0, 30.0, 0.0, 10.0),
                                          child: Text(
                                            'To verify your identity, please take a picture of your robot with license plates.',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Text(
                                            'Your location is captured to verify authenticity. It is deleted immediately after verification completes.',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.camera_alt,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'VERIFY_WITH_PICTURE_camera_alt_ICN_ON_TA');
                                                      logFirebaseEvent(
                                                          'IconButton_upload_media_to_firebase');
                                                      final selectedMedia =
                                                          await selectMedia(
                                                        imageQuality: 100,
                                                        multiImage: false,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }

                                                      logFirebaseEvent(
                                                          'IconButton_update_page_state');
                                                      _model.upload1State =
                                                          true;
                                                      while (_model
                                                          .isDataUploading) {
                                                        logFirebaseEvent(
                                                            'IconButton_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100));
                                                      }
                                                      logFirebaseEvent(
                                                          'IconButton_widget_animation');
                                                      if (animationsMap[
                                                              'iconOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'iconOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Robot Picture',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
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
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.check,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  size: 24.0,
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'iconOnActionTriggerAnimation']!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Text(
                                            'To verify your identity, please read the following statement.',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 10.0),
                                          child: Theme(
                                            data: ThemeData(
                                              checkboxTheme: const CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: CheckboxListTile(
                                              value: _model
                                                      .checkboxListTileValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                        .checkboxListTileValue =
                                                    newValue!);
                                              },
                                              title: Text(
                                                'I confirm that I have been a member of the VRC Discord server on my current team for at least 2 months.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 20.0),
                                          child: Text(
                                            'If this doesn\'t apply, choose a different verfication method or a different member of your team to verify.',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VERIFY_WITH_PICTURE_COMPLETE_VERIFICATIO');
                                              currentUserLocationValue =
                                                  await getCurrentUserLocation(
                                                      defaultLocation:
                                                          const LatLng(0.0, 0.0));
                                              logFirebaseEvent(
                                                  'Button_firestore_query');
                                              _model.teamDoc =
                                                  await queryTeamsRecordOnce(
                                                queryBuilder: (teamsRecord) =>
                                                    teamsRecord.where(
                                                  'teamID',
                                                  isEqualTo: valueOrDefault(
                                                      currentUserDocument
                                                          ?.teamID,
                                                      0),
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.teamDoc?.captainUID !=
                                                      null &&
                                                  _model.teamDoc?.captainUID !=
                                                      '') {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                    'VerifyInProgress-Other');
                                              } else {
                                                if (_model.teamDoc!.verified) {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.goNamed('HomePage');
                                                } else {
                                                  if ((_model.uploadedFileUrl !=
                                                              '') &&
                                                      _model
                                                          .checkboxListTileValue!) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await VerificationRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createVerificationRecordData(
                                                          displayName:
                                                              currentUserDisplayName,
                                                          realName: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.realName,
                                                              ''),
                                                          page1Path: _model
                                                              .uploadedFileUrl,
                                                          uid: currentUserUid,
                                                          teamNumber:
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.teamNum,
                                                                  ''),
                                                          teamID: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.teamID,
                                                              0),
                                                          requestTime:
                                                              getCurrentTimestamp,
                                                          method: 'picture',
                                                          location:
                                                              currentUserLocationValue
                                                                  ?.toString(),
                                                        ));
                                                    logFirebaseEvent(
                                                        'Button_request_permissions');
                                                    unawaited(
                                                      () async {
                                                        await requestPermission(
                                                            locationPermission);
                                                      }(),
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await _model
                                                        .teamDoc!.reference
                                                        .update(
                                                            createTeamsRecordData(
                                                      captainUID:
                                                          currentUserUid,
                                                      captainDisplayName:
                                                          currentUserDisplayName,
                                                    ));
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      verifiedOnTeam: true,
                                                      grade: getJsonField(
                                                        FFAppState()
                                                            .APIResponse1,
                                                        r'''$.data[:].grade''',
                                                      ).toString(),
                                                    ));
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await ChatsRecord.collection
                                                        .doc()
                                                        .set({
                                                      ...createChatsRecordData(
                                                        lastMessage: '',
                                                        lastMessageTime:
                                                            getCurrentTimestamp,
                                                        lastMessageSentBy:
                                                            currentUserReference,
                                                        teamNumA: valueOrDefault(
                                                            currentUserDocument
                                                                ?.teamNum,
                                                            ''),
                                                        groupChatId: functions
                                                            .teamIDFormatConv(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.teamID,
                                                                    0)),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'TeamID': [
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamID,
                                                                0)
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        'VerificationInProgress');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Verification Failed'),
                                                          content: const Text(
                                                              'You must complete all steps.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                }
                                              }

                                              safeSetState(() {});
                                            },
                                            text: 'Complete Verification',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 44.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'VERIFY_WITH_PICTURE_PAGE_BACK_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_navigate_back');
                                                    context.safePop();
                                                  },
                                                  text: 'Back',
                                                  options: FFButtonOptions(
                                                    height: 44.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'VERIFY_WITH_PICTURE_QUIT_VERIFICATION_BT');
                                                    logFirebaseEvent(
                                                        'Button_auth');
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signOut();
                                                    GoRouter.of(context)
                                                        .clearRedirectLocation();

                                                    context.goNamedAuth('entry',
                                                        context.mounted);
                                                  },
                                                  text: 'Quit Verification',
                                                  options: FFButtonOptions(
                                                    height: 44.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
