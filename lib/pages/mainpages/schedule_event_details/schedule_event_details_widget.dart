import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'schedule_event_details_model.dart';
export 'schedule_event_details_model.dart';

class ScheduleEventDetailsWidget extends StatefulWidget {
  const ScheduleEventDetailsWidget({
    super.key,
    required this.teamsMatches,
    required this.eventsMatches,
  });

  final dynamic teamsMatches;
  final dynamic eventsMatches;

  @override
  State<ScheduleEventDetailsWidget> createState() =>
      _ScheduleEventDetailsWidgetState();
}

class _ScheduleEventDetailsWidgetState extends State<ScheduleEventDetailsWidget>
    with TickerProviderStateMixin {
  late ScheduleEventDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleEventDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Schedule-EventDetails'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        title: 'Schedule-EventDetails',
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
                    child: Visibility(
                      visible: true,
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
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  unselectedLabelStyle: const TextStyle(),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  padding: const EdgeInsets.all(4.0),
                                  tabs: const [
                                    Tab(
                                      text: 'Example 1',
                                    ),
                                    Tab(
                                      text: 'Example 2',
                                    ),
                                    Tab(
                                      text: 'Example 3',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                      () async {},
                                      () async {},
                                      () async {}
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    Text(
                                      'Tab View 1',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Tab View 2',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Tab View 3',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
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
                ),
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 5.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 17.0, 0.0, 10.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.choiceChipsValue == 'Team'
                                                  ? 'Your  Matches'
                                                  : 'All Matches',
                                              'Matches',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Sora',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: FlutterFlowChoiceChips(
                                              options: const [
                                                ChipData('Team', FFIcons.kuser),
                                                ChipData(
                                                    'Event', FFIcons.kusers)
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () =>
                                                      _model.choiceChipsValue =
                                                          val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 15.0,
                                                labelPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(3.0, 0.0,
                                                            10.0, 0.0),
                                                elevation: 4.0,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 15.0,
                                                labelPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(3.0, 0.0,
                                                            10.0, 0.0),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsValue !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                ['Team'],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                        ),
                                        if (_model.choiceChipsValue == 'Team')
                                          Builder(
                                            builder: (context) {
                                              final matchItem = getJsonField(
                                                widget.teamsMatches,
                                                r'''$[:]''',
                                              ).toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: matchItem.length,
                                                itemBuilder:
                                                    (context, matchItemIndex) {
                                                  final matchItemItem =
                                                      matchItem[matchItemIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxHeight: 1000.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 70.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.matchNameConv(getJsonField(
                                                                              matchItemItem,
                                                                              r'''$.name''',
                                                                            ).toString()),
                                                                            'Q--',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Sora',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          "h:mm a",
                                                                          DateTime.fromMillisecondsSinceEpoch(
                                                                              valueOrDefault<int>(
                                                                            functions.calcMatchScheduleStartTime(getJsonField(
                                                                              matchItemItem,
                                                                              r'''$.scheduled''',
                                                                            ).toString()),
                                                                            00,
                                                                          )),
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
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
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => Container(
                                                                                  width: 5.0,
                                                                                  height: (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  matchItemItem,
                                                                                                  r'''$.alliances[1].teams[0].team.name''',
                                                                                                )?.toString(),
                                                                                                '[tm1]',
                                                                                              )) ||
                                                                                          (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  matchItemItem,
                                                                                                  r'''$.alliances[1].teams[1].team.name''',
                                                                                                )?.toString(),
                                                                                                '[tm1]',
                                                                                              ))
                                                                                      ? 40.0
                                                                                      : 10.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[1].teams[0].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm1]',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[1].teams[1].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm2]',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
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
                                                                        if ('false' ==
                                                                            getJsonField(
                                                                              widget.teamsMatches,
                                                                              r'''$.scored''',
                                                                            ).toString())
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  getJsonField(
                                                                                    matchItemItem,
                                                                                    r'''$.field''',
                                                                                  ).toString(),
                                                                                  minFontSize: 8.0,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (false)
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.kclock,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: AutoSizeText(
                                                                                          '2:35',
                                                                                          minFontSize: 8.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                                fontSize: 15.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        if (!((getJsonField(
                                                                                  widget.teamsMatches,
                                                                                  r'''$.alliances[0].score''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  widget.teamsMatches,
                                                                                  r'''$.alliances[1].score''',
                                                                                ) !=
                                                                                null)))
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      matchItemItem,
                                                                                      r'''$.alliances[1].score''',
                                                                                    )?.toString(),
                                                                                    '--',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Sora',
                                                                                        color: const Color(0xFFFF9191),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      matchItemItem,
                                                                                      r'''$.alliances[0].score''',
                                                                                    )?.toString(),
                                                                                    '--',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Sora',
                                                                                        color: const Color(0xFF84AAEC),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[0].teams[0].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm3]',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[0].teams[1].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm4]',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  getJsonField(
                                                                                                    matchItemItem,
                                                                                                    r'''$.alliances[0].teams[0].team.name''',
                                                                                                  ).toString()) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  getJsonField(
                                                                                                    matchItemItem,
                                                                                                    r'''$.alliances[0].teams[0].team.name''',
                                                                                                  ).toString()) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
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
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: 5.0,
                                                                                    height: (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    matchItemItem,
                                                                                                    r'''$.alliances[0].teams[0].team.name''',
                                                                                                  )?.toString(),
                                                                                                  '[tm1]',
                                                                                                )) ||
                                                                                            (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    matchItemItem,
                                                                                                    r'''$.alliances[0].teams[1].team.name''',
                                                                                                  )?.toString(),
                                                                                                  '[tm1]',
                                                                                                ))
                                                                                        ? 40.0
                                                                                        : 10.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      borderRadius: BorderRadius.circular(10.0),
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
                                                                Container(
                                                                  width: 50.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kmoreVertical,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (_model.choiceChipsValue != 'Team')
                                          Builder(
                                            builder: (context) {
                                              final matchItem = widget
                                                  .eventsMatches!
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: matchItem.length,
                                                itemBuilder:
                                                    (context, matchItemIndex) {
                                                  final matchItemItem =
                                                      matchItem[matchItemIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxHeight: 1000.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 70.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.matchNameConv(getJsonField(
                                                                              matchItemItem,
                                                                              r'''$.name''',
                                                                            ).toString()),
                                                                            'Q--',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Sora',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '2:20',
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
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => Container(
                                                                                  width: 5.0,
                                                                                  height: (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  matchItemItem,
                                                                                                  r'''$.alliances[1].teams[0].team.name''',
                                                                                                )?.toString(),
                                                                                                '[tm1]',
                                                                                              )) ||
                                                                                          (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  matchItemItem,
                                                                                                  r'''$.alliances[1].teams[1].team.name''',
                                                                                                )?.toString(),
                                                                                                '[tm1]',
                                                                                              ))
                                                                                      ? 40.0
                                                                                      : 10.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[1].teams[0].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm1]',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[1].teams[1].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm2]',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[1].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
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
                                                                        if ('false' ==
                                                                            getJsonField(
                                                                              widget.eventsMatches,
                                                                              r'''$.scored''',
                                                                            ).toString())
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  getJsonField(
                                                                                    matchItemItem,
                                                                                    r'''$.field''',
                                                                                  ).toString(),
                                                                                  minFontSize: 8.0,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              if (false)
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        FFIcons.kclock,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: AutoSizeText(
                                                                                          '2:35',
                                                                                          minFontSize: 8.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                                fontSize: 15.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        if (!((getJsonField(
                                                                                  widget.teamsMatches,
                                                                                  r'''$.alliances[0].score''',
                                                                                ) !=
                                                                                null) &&
                                                                            (getJsonField(
                                                                                  widget.teamsMatches,
                                                                                  r'''$.alliances[1].score''',
                                                                                ) !=
                                                                                null)))
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      matchItemItem,
                                                                                      r'''$.alliances[1].score''',
                                                                                    )?.toString(),
                                                                                    '--',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Sora',
                                                                                        color: const Color(0xFFFF9191),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      matchItemItem,
                                                                                      r'''$.alliances[0].score''',
                                                                                    )?.toString(),
                                                                                    '--',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Sora',
                                                                                        color: const Color(0xFF84AAEC),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[0].teams[0].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm3]',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          matchItemItem,
                                                                                          r'''$.alliances[0].teams[1].team.name''',
                                                                                        )?.toString(),
                                                                                        '[tm4]',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                              } else {
                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                              }
                                                                                            }(),
                                                                                            fontSize: () {
                                                                                              if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[1].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 17.0;
                                                                                              } else if (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      matchItemItem,
                                                                                                      r'''$.alliances[0].teams[0].team.name''',
                                                                                                    )?.toString(),
                                                                                                    '[tm1]',
                                                                                                  )) {
                                                                                                return 16.0;
                                                                                              } else {
                                                                                                return 15.0;
                                                                                              }
                                                                                            }(),
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
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: 5.0,
                                                                                    height: (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    matchItemItem,
                                                                                                    r'''$.alliances[0].teams[0].team.name''',
                                                                                                  )?.toString(),
                                                                                                  '[tm1]',
                                                                                                )) ||
                                                                                            (valueOrDefault(currentUserDocument?.teamNum, '') ==
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    matchItemItem,
                                                                                                    r'''$.alliances[0].teams[1].team.name''',
                                                                                                  )?.toString(),
                                                                                                  '[tm1]',
                                                                                                ))
                                                                                        ? 40.0
                                                                                        : 10.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      borderRadius: BorderRadius.circular(10.0),
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
                                                                Container(
                                                                  width: 50.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kmoreVertical,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                      ],
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
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            functions.add(1.0, () {
                              if (isiOS) {
                                return 54.0;
                              } else if (isAndroid) {
                                return 20.0;
                              } else if (isWeb) {
                                return 0.0;
                              } else {
                                return 0.0;
                              }
                            }()),
                            0.0,
                          ),
                          0.0,
                          0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 8.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 20.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 10.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 0.0,
                                        buttonSize: 40.0,
                                        fillColor: Colors.transparent,
                                        icon: Icon(
                                          FFIcons.karrowLeft,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 23.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SCHEDULE_EVENT_DETAILS_arrowLeft_ICN_ON_');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                    Text(
                                      'Match Schedule',
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
                                  ],
                                ),
                                if (false)
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
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                              ],
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
