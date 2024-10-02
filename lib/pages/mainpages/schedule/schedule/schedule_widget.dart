import '/auth/firebase_auth/auth_util.dart';
import '/components/events/events_widget.dart';
import '/components/match_info_card/match_info_card_widget.dart';
import '/components/nav_bar_b_g_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({
    super.key,
    this.from,
  });

  final int? from;

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget>
    with TickerProviderStateMixin {
  late ScheduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Schedule'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCHEDULE_PAGE_Schedule_ON_INIT_STATE');
      logFirebaseEvent('Schedule_action_block');
      await action_blocks.checkVerify(
        context,
        redirectToHome: false,
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.linear,
            delay: 600.0.ms,
            duration: 900.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(2.0, 2.0),
          ),
          FadeEffect(
            curve: Curves.linear,
            delay: 600.0.ms,
            duration: 900.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'navBarBGOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(
                functions.multiply(
                    functions.add(
                        functions.divide(
                            functions.subtract(
                                MediaQuery.sizeOf(context).width, 40.0),
                            5.0),
                        0.0),
                    0.0),
                0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'navBarBGOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(
                functions.multiply(
                    functions.add(
                        functions.divide(
                            functions.subtract(
                                MediaQuery.sizeOf(context).width, 40.0),
                            5.0),
                        0.0),
                    1.0),
                0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'navBarBGOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(
                functions.multiply(
                    functions.add(
                        functions.divide(
                            functions.subtract(
                                MediaQuery.sizeOf(context).width, 40.0),
                            5.0),
                        0.0),
                    2.0),
                0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'navBarBGOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(
                functions.multiply(
                    functions.add(
                        functions.divide(
                            functions.subtract(
                                MediaQuery.sizeOf(context).width, 40.0),
                            5.0),
                        0.0),
                    3.0),
                0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'navBarBGOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(
                functions.multiply(
                    functions.add(
                        functions.divide(
                            functions.subtract(
                                MediaQuery.sizeOf(context).width, 40.0),
                            5.0),
                        0.0),
                    4.0),
                0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'navBarBGOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 260.0.ms,
            begin: const Offset(20.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
    context.watch<FFAppState>();

    return Title(
        title: 'Schedule',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 70.0,
                      sigmaY: 70.0,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.015,
                        height: MediaQuery.sizeOf(context).height * 0.783,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).tertiary,
                              const Color(0x71100F16)
                            ],
                            stops: const [0.0, 1.0],
                            begin: const AlignmentDirectional(0.0, -1.0),
                            end: const AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(1000.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (valueOrDefault<bool>(
                                  currentUserDocument?.verifiedOnTeam, false) &&
                              FFAppState().verified)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 70.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(
                                        width: 0.0,
                                        height: 0.0,
                                        child: custom_widgets.HomePageAPI(
                                          width: 0.0,
                                          height: 0.0,
                                          teamID: valueOrDefault(
                                              currentUserDocument?.teamID, 0),
                                          season: '190',
                                        ),
                                      ),
                                      if (FFAppState().APIResponse1 != null
                                          ? true
                                          : false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.vertical,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    width: 350.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          FFAppState()
                                                              .APIResponse1,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 6.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 10.0,
                                                                height: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation']!),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: 'Ongoing Now',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 25.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
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
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (false)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        'Agenda',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxHeight: 1000.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      10.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 165.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'Button pressed ...');
                                                                        },
                                                                        text:
                                                                            'Full Agenda',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                        ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'Button pressed ...');
                                                                        },
                                                                        text:
                                                                            'Full Agenda',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Next Match',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (functions
                                                          .checkIfJSONListIsEmpy(
                                                              FFAppState()
                                                                  .APIResponse3)!
                                                      ? false
                                                      : true)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        'Match schedules haven\'t gotten posted yet. They\'ll show up here when they do.',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  if ((getJsonField(
                                                            functions.getNextMatch(
                                                                FFAppState()
                                                                    .APIResponse3),
                                                            r'''$[0].alliances[0].teams[0].team.name''',
                                                          ) ==
                                                          null) &&
                                                      functions
                                                          .checkIfJSONListIsEmpy(
                                                              FFAppState()
                                                                  .APIResponse3)!)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        'All matches have been played',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                            functions.getNextMatch(
                                                                FFAppState()
                                                                    .APIResponse3),
                                                            r'''$[0].scheduled''',
                                                          ) !=
                                                          null
                                                      ? true
                                                      : false)
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .matchInfoCardModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              MatchInfoCardWidget(
                                                            teamName1:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                functions.getNextMatch(
                                                                    FFAppState()
                                                                        .APIResponse3),
                                                                r'''$[0].alliances[0].teams[0].team.name''',
                                                              )?.toString(),
                                                              '[1]',
                                                            ),
                                                            teamName2:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                functions.getNextMatch(
                                                                    FFAppState()
                                                                        .APIResponse3),
                                                                r'''$[0].alliances[0].teams[1].team.name''',
                                                              )?.toString(),
                                                              '[2]',
                                                            ),
                                                            teamName3:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                functions.getNextMatch(
                                                                    FFAppState()
                                                                        .APIResponse3),
                                                                r'''$[0].alliances[1].teams[0].team.name''',
                                                              )?.toString(),
                                                              '[3]',
                                                            ),
                                                            teamName4:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                functions.getNextMatch(
                                                                    FFAppState()
                                                                        .APIResponse3),
                                                                r'''$[0].alliances[1].teams[1].team.name''',
                                                              )?.toString(),
                                                              '[4]',
                                                            ),
                                                            matchName: functions
                                                                .matchNameConv(
                                                                    getJsonField(
                                                              functions.getNextMatch(
                                                                  FFAppState()
                                                                      .APIResponse3),
                                                              r'''$[0].name''',
                                                            ).toString())!,
                                                            fieldName:
                                                                getJsonField(
                                                              functions.getNextMatch(
                                                                  FFAppState()
                                                                      .APIResponse3),
                                                              r'''$[0].field''',
                                                            ).toString(),
                                                            startTime:
                                                                dateTimeFormat(
                                                              "h:mm a",
                                                              DateTime.fromMillisecondsSinceEpoch(
                                                                  valueOrDefault<
                                                                      int>(
                                                                functions
                                                                    .calcMatchScheduleStartTime(
                                                                        getJsonField(
                                                                  functions.getNextMatch(
                                                                      FFAppState()
                                                                          .APIResponse3),
                                                                  r'''$[0].scheduled''',
                                                                ).toString()),
                                                                00,
                                                              )),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            startTimeRelative:
                                                                dateTimeFormat(
                                                              "relative",
                                                              functions
                                                                  .calcMatchStartTime(
                                                                      getJsonField(
                                                                functions.getNextMatch(
                                                                    FFAppState()
                                                                        .APIResponse3),
                                                                r'''$[0].scheduled''',
                                                              ).toString()),
                                                              locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageShortCode ??
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                            ),
                                                            teamID1:
                                                                getJsonField(
                                                              functions.getNextMatch(
                                                                  FFAppState()
                                                                      .APIResponse3),
                                                              r'''$[0].alliances[0].teams[0].team.id''',
                                                            ),
                                                            teamID2:
                                                                getJsonField(
                                                              functions.getNextMatch(
                                                                  FFAppState()
                                                                      .APIResponse3),
                                                              r'''$[0].alliances[0].teams[1].team.id''',
                                                            ),
                                                            teamID3:
                                                                getJsonField(
                                                              functions.getNextMatch(
                                                                  FFAppState()
                                                                      .APIResponse3),
                                                              r'''$[0].alliances[1].teams[0].team.id''',
                                                            ),
                                                            teamID4:
                                                                getJsonField(
                                                              functions.getNextMatch(
                                                                  FFAppState()
                                                                      .APIResponse3),
                                                              r'''$[0].alliances[1].teams[1].team.id''',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              if (RobotEventsEventsStruct
                                                              .maybeFromMap(
                                                                  FFAppState()
                                                                      .APIResponse2)
                                                          ?.data !=
                                                      null &&
                                                  (RobotEventsEventsStruct
                                                              .maybeFromMap(
                                                                  FFAppState()
                                                                      .APIResponse2)
                                                          ?.data)!
                                                      .isNotEmpty)
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SCHEDULE_PAGE_Container_j4ose2wu_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container_navigate_to');

                                                    context.pushNamed(
                                                      'Schedule-EventDetails',
                                                      queryParameters: {
                                                        'teamsMatches':
                                                            serializeParam(
                                                          FFAppState()
                                                              .APIResponse3,
                                                          ParamType.JSON,
                                                        ),
                                                        'eventsMatches':
                                                            serializeParam(
                                                          FFAppState()
                                                              .APIResponse5,
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: const BoxConstraints(
                                                      maxHeight: 150.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground
                                                        ],
                                                        stops: const [0.0, 1.0],
                                                        begin:
                                                            const AlignmentDirectional(
                                                                -0.03, -1.0),
                                                        end:
                                                            const AlignmentDirectional(
                                                                0.03, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(1.5),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13.0,
                                                                          13.0,
                                                                          13.0,
                                                                          13.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  AutoSizeText(
                                                                    'See all matches',
                                                                    minFontSize:
                                                                        12.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    FFIcons
                                                                        .kchevronRight,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      wrapWithModel(
                                        model: _model.eventsModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const EventsWidget(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (!(valueOrDefault<bool>(
                                  currentUserDocument?.verifiedOnTeam, false) &&
                              FFAppState().verified))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 70.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 20.0, 0.0),
                                        child: Text(
                                          'We can\'t confirm that you\'ve been verified, or the requested page wasn\'t found.',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 15.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'SCHEDULE_PAGE_RETRY_BTN_ON_TAP');
                                            logFirebaseEvent('Button_auth');
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                'entry', context.mounted);
                                          },
                                          text: 'Retry',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Schedule',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Sora',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 10.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 0.0,
                                      buttonSize: 34.0,
                                      fillColor: Colors.transparent,
                                      icon: FaIcon(
                                        FontAwesomeIcons.redoAlt,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 19.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SCHEDULE_PAGE_redoAlt_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Data updated',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 3000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15.0,
                              sigmaY: 15.0,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: const Color(0x6C272E3A),
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            if (widget.from == 1)
                                              wrapWithModel(
                                                model:
                                                    _model.navBarScheduleModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const Hero(
                                                  tag: 'NavBarHighlight',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: NavBarBGWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'navBarBGOnPageLoadAnimation1']!),
                                            if (widget.from == 2)
                                              wrapWithModel(
                                                model:
                                                    _model.navBarMessagesModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const Hero(
                                                  tag: 'NavBarHighlight',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: NavBarBGWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'navBarBGOnPageLoadAnimation2']!),
                                            if (widget.from == 3)
                                              wrapWithModel(
                                                model: _model.navBarHomeModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const Hero(
                                                  tag: 'NavBarHighlight',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: NavBarBGWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'navBarBGOnPageLoadAnimation3']!),
                                            if (widget.from == 4)
                                              wrapWithModel(
                                                model:
                                                    _model.navBarExploreModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const Hero(
                                                  tag: 'NavBarHighlight',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: NavBarBGWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'navBarBGOnPageLoadAnimation4']!),
                                            if (widget.from == 5)
                                              wrapWithModel(
                                                model: _model.navBarMoreModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const Hero(
                                                  tag: 'NavBarHighlight',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: NavBarBGWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'navBarBGOnPageLoadAnimation5']!),
                                            if (widget.from == null)
                                              wrapWithModel(
                                                model: _model.navBarOtherModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const Hero(
                                                  tag: 'NavBarHighlight',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: NavBarBGWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'navBarBGOnPageLoadAnimation6']!),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 2.5, 5.0),
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 2.5, 5.0),
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 5.0, 5.0),
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 5.0, 5.0),
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 2.5, 5.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SCHEDULE_PAGE_Container_h1b4dvkz_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'Schedule',
                                                queryParameters: {
                                                  'from': serializeParam(
                                                    1,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kclock,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 2.5, 5.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SCHEDULE_PAGE_Container_wkzdw5jn_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'Messages',
                                                queryParameters: {
                                                  'from': serializeParam(
                                                    1,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kmessageSquare,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 2.5, 5.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SCHEDULE_PAGE_Container_bz617050_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'HomePage',
                                                queryParameters: {
                                                  'from': serializeParam(
                                                    1,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Icon(
                                                FFIcons.khome,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 2.5, 5.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SCHEDULE_PAGE_Container_th1qb2hy_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'Explore',
                                                queryParameters: {
                                                  'from': serializeParam(
                                                    1,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kcompass,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 5.0, 5.0, 5.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SCHEDULE_PAGE_Container_05wrbtwf_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'More',
                                                queryParameters: {
                                                  'from': serializeParam(
                                                    1,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kmoreVertical,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
