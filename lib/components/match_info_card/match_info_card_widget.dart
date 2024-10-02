import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'match_info_card_model.dart';
export 'match_info_card_model.dart';

class MatchInfoCardWidget extends StatefulWidget {
  const MatchInfoCardWidget({
    super.key,
    required this.teamName1,
    required this.teamName2,
    required this.teamName3,
    required this.teamName4,
    required this.matchName,
    required this.fieldName,
    required this.startTime,
    required this.startTimeRelative,
    required this.teamID1,
    required this.teamID2,
    required this.teamID3,
    required this.teamID4,
  });

  final String? teamName1;
  final String? teamName2;
  final String? teamName3;
  final String? teamName4;
  final String? matchName;
  final String? fieldName;
  final String? startTime;
  final String? startTimeRelative;
  final int? teamID1;
  final int? teamID2;
  final int? teamID3;
  final int? teamID4;

  @override
  State<MatchInfoCardWidget> createState() => _MatchInfoCardWidgetState();
}

class _MatchInfoCardWidgetState extends State<MatchInfoCardWidget> {
  late MatchInfoCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchInfoCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).accent4,
            FlutterFlowTheme.of(context).primaryBackground
          ],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(-0.14, -1.0),
          end: const AlignmentDirectional(0.14, 1.0),
        ),
        borderRadius: BorderRadius.circular(11.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxHeight: 1000.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(13.0, 7.0, 13.0, 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width: 5.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          widget.teamName3!,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Sora',
                                                color: (widget.teamName3 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                '')) ||
                                                        (widget.teamName4 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                ''))
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          widget.teamName4!,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Sora',
                                                color: (widget.teamName3 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                '')) ||
                                                        (widget.teamName4 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                ''))
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.matchName,
                                'Q00',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Sora',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          widget.teamName1!,
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: (widget.teamName1 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                '')) ||
                                                        (widget.teamName2 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                ''))
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          widget.teamName2!,
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: (widget.teamName1 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                '')) ||
                                                        (widget.teamName2 ==
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.teamNum,
                                                                ''))
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: 5.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(13.0, 15.0, 13.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120.0,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.startTime!,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Sora',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.startTimeRelative,
                              '[relative]',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (false)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '1%',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sora',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Win Chance',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    Container(
                      width: 120.0,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.fieldName!,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Sora',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Field',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 7.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'MATCH_INFO_CARD_MESSAGE_ALLIANCE_BTN_ON_');
                            logFirebaseEvent('Button_action_block');
                            await action_blocks.messageTeam(
                              context,
                              teamID: () {
                                if (widget.teamName3 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamID4;
                                } else if (widget.teamName4 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamID3;
                                } else if (widget.teamName1 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamID2;
                                } else if (widget.teamName2 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamID1;
                                } else {
                                  return 153961;
                                }
                              }(),
                              teamNum: () {
                                if (widget.teamName3 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamName4;
                                } else if (widget.teamName4 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamName3;
                                } else if (widget.teamName1 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamName2;
                                } else if (widget.teamName2 ==
                                    valueOrDefault(
                                        currentUserDocument?.teamNum, '')) {
                                  return widget.teamName1;
                                } else {
                                  return '10M';
                                }
                              }(),
                            );
                          },
                          text: 'Message Alliance',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 13.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'MATCH_INFO_CARD_ALL_MATCHES_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'Schedule-EventDetails',
                              queryParameters: {
                                'teamsMatches': serializeParam(
                                  FFAppState().APIResponse3,
                                  ParamType.JSON,
                                ),
                                'eventsMatches': serializeParam(
                                  FFAppState().APIResponse5,
                                  ParamType.JSON,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'All Matches',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
