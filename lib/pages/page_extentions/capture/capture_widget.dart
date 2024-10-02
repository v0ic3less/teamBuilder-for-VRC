import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'capture_model.dart';
export 'capture_model.dart';

class CaptureWidget extends StatefulWidget {
  const CaptureWidget({super.key});

  @override
  State<CaptureWidget> createState() => _CaptureWidgetState();
}

class _CaptureWidgetState extends State<CaptureWidget> {
  late CaptureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptureModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Capture'});
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
        title: 'Capture',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CAPTURE_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed('HomePage');
                },
              ),
              title: Text(
                'Capture',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Sora',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 28.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 540.0,
                            child: custom_widgets.CameraPhoto(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 540.0,
                              update: _model.updateVal,
                            ),
                          ),
                        ),
                        Text(
                          FFAppState().cameraDirection.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        decoration: const BoxDecoration(),
                        child: Text(
                          'Upgrade for uncompressed photos',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CAPTURE_PAGE_TAKE_PHOTO_BTN_ON_TAP');
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().makePhoto = true;
                          logFirebaseEvent('Button_update_page_state');
                          _model.updateVal = _model.updateVal + 1;
                          safeSetState(() {});
                          logFirebaseEvent('Button_wait__delay');
                          await Future.delayed(
                              const Duration(milliseconds: 1000));
                          if (FFAppState().filePath == '') {
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().makePhoto = true;
                            logFirebaseEvent('Button_update_page_state');
                            _model.updateVal = _model.updateVal + 1;
                            safeSetState(() {});
                            logFirebaseEvent('Button_wait__delay');
                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                            if (FFAppState().filePath == '') {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'Something went wrong. Please try again.'),
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
                              logFirebaseEvent('Button_firestore_query');
                              _model.teamDoc2 = await queryTeamsRecordOnce(
                                queryBuilder: (teamsRecord) =>
                                    teamsRecord.where(
                                  'teamID',
                                  isEqualTo: valueOrDefault(
                                      currentUserDocument?.teamID, 0),
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              logFirebaseEvent('Button_backend_call');

                              await _model.teamDoc2!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'captures': FieldValue.arrayUnion([
                                      functions.convertSTRToIMG(
                                          FFAppState().filePath)
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Captured',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          } else {
                            logFirebaseEvent('Button_firestore_query');
                            _model.teamDoc = await queryTeamsRecordOnce(
                              queryBuilder: (teamsRecord) => teamsRecord.where(
                                'teamID',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.teamID, 0),
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            logFirebaseEvent('Button_backend_call');

                            await _model.teamDoc!.reference.update({
                              ...mapToFirestore(
                                {
                                  'captures': FieldValue.arrayUnion([
                                    functions
                                        .convertSTRToIMG(FFAppState().filePath)
                                  ]),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Captured',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Take Photo',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 57.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('CAPTURE_PAGE_Icon_xjhu95nv_ON_TAP');
                          logFirebaseEvent('Icon_update_app_state');
                          FFAppState().cameraDirection =
                              FFAppState().cameraDirection == 0 ? 1 : 0;
                          FFAppState().update(() {});
                          logFirebaseEvent('Icon_navigate_to');

                          context.goNamed(
                            'Capture',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.flip_camera_ios_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 57.0),
                      child: Icon(
                        Icons.phonelink_ring_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
