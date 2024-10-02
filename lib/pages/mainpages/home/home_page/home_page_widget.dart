import '/auth/firebase_auth/auth_util.dart';
import '/components/event_details/event_details_widget.dart';
import '/components/events/events_widget.dart';
import '/components/followed_teams_widget.dart';
import '/components/meeting_cards/meeting_cards_widget.dart';
import '/components/nav_bar_b_g_widget.dart';
import '/components/notifications/notifications_widget.dart';
import '/components/world_skills_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/mainpages/home/team_info_widget/team_info_widget_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    this.from,
  });

  final int? from;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      logFirebaseEvent('HomePage_action_block');
      await action_blocks.clearAPIResponses(context);
      safeSetState(() {});
      logFirebaseEvent('HomePage_action_block');
      await action_blocks.checkVerify(
        context,
        redirectToHome: false,
      );
      safeSetState(() {});
    });

    animationsMap.addAll({
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
                    -2.0),
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
                    -1.0),
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
                    0.0),
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
                    1.0),
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
                    2.0),
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
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 130.0.ms,
            begin: 0.0,
            end: 1.0,
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
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Visibility(
              visible: false,
              child: FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('HOME_FloatingActionButton_rjwd29o8_ON_TA');
                  logFirebaseEvent('FloatingActionButton_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const NotificationsWidget(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: badges.Badge(
                  badgeContent: Text(
                    '1',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  showBadge: true,
                  shape: badges.BadgeShape.circle,
                  badgeColor: FlutterFlowTheme.of(context).primary,
                  elevation: 4.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  position: badges.BadgePosition.topEnd(),
                  animationType: badges.BadgeAnimationType.scale,
                  toAnimate: true,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Icon(
                      Icons.notifications_none_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            body: Stack(
              alignment: const AlignmentDirectional(0.0, -1.0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: RefreshIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        strokeWidth: 3.0,
                        onRefresh: () async {
                          logFirebaseEvent(
                              'HOME_Column_nszj8m67_ON_PULL_TO_REFRESH');
                          logFirebaseEvent('Column_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Refreshing...',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.verifiedOnTeam,
                                      false) &&
                                  FFAppState().verified)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 70.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          wrapWithModel(
                                            model: _model.eventDetailsModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: EventDetailsWidget(
                                              eventRequest:
                                                  FFAppState().APIResponse1,
                                            ),
                                          ),
                                        if (!(FFAppState().APIResponse1 == null
                                            ? true
                                            : false))
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (!(FFAppState()
                                                            .APIResponse1 !=
                                                        null
                                                    ? true
                                                    : false))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 15.0),
                                                    child: Text(
                                                      'You\'re not currently participating in an event, so your Team Builder experience is limited.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        if (FFAppState().APIResponse1 != null
                                            ? true
                                            : false)
                                          Divider(
                                            thickness: 2.0,
                                            indent: 20.0,
                                            endIndent: 20.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 12.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_contentView_1_ON_TAP');
                                                logFirebaseEvent(
                                                    'contentView_1_navigate_to');

                                                context.pushNamed('To-DoList');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 5.0,
                                                      color: Color(0x3416202A),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
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
                                                    begin: const AlignmentDirectional(
                                                        -0.02, -1.0),
                                                    end: const AlignmentDirectional(
                                                        0.02, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.5),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: InkWell(
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
                                                          'HOME_PAGE_PAGE_Container_uxxo2g6q_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                          'To-DoList');
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .checklist_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'To-Do List',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.9, 0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
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
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 25.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Meetings',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: BackdropFilter(
                                                          filter:
                                                              ImageFilter.blur(
                                                            sigmaX: 5.0,
                                                            sigmaY: 5.0,
                                                          ),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .meetingCardsModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                const MeetingCardsWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (currentUserEmail !=
                                            'testing@tester.com')
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_TEMP_BUTTON_TESTING_TEAMINFO_PG_BTN');
                                                logFirebaseEvent(
                                                    'Button_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            TeamInfoWidgetWidget(
                                                          teamNum: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.teamNum,
                                                              ''),
                                                          teamID: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.teamID,
                                                              0),
                                                          teamInfo: FFAppState()
                                                              .teamInfoAPI,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text:
                                                  'temp button (testing teaminfo pg)',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
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
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().HomePageAW.isNotEmpty)
                                          Builder(
                                            builder: (context) {
                                              if (FFAppState().HomePageAW[0] ==
                                                  'Upcoming Events') {
                                                return wrapWithModel(
                                                  model: _model
                                                      .upcomingEventsModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: const EventsWidget(),
                                                );
                                              } else if (FFAppState()
                                                      .HomePageAW[0] ==
                                                  'World Skills') {
                                                return Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .worldSkillsModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: const WorldSkillsWidget(),
                                                  ),
                                                );
                                              } else if (FFAppState()
                                                      .HomePageAW[0] ==
                                                  'Followed Teams') {
                                                return Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .followedTeamsModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const FollowedTeamsWidget(),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        if (FFAppState().HomePageAW.length >= 2)
                                          Builder(
                                            builder: (context) {
                                              if (FFAppState().HomePageAW[1] ==
                                                  'Upcoming Events') {
                                                return wrapWithModel(
                                                  model: _model
                                                      .upcomingEventsModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: const EventsWidget(),
                                                );
                                              } else if (FFAppState()
                                                      .HomePageAW[1] ==
                                                  'World Skills') {
                                                return Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .worldSkillsModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: const WorldSkillsWidget(),
                                                  ),
                                                );
                                              } else if (FFAppState()
                                                      .HomePageAW[1] ==
                                                  'Followed Teams') {
                                                return Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .followedTeamsModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const FollowedTeamsWidget(),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        SizedBox(
                                          width: 0.0,
                                          height: 0.0,
                                          child: custom_widgets
                                              .TeamInfoAPIForParams(
                                            width: 0.0,
                                            height: 0.0,
                                            teamID: valueOrDefault(
                                                currentUserDocument?.teamID, 0),
                                            season:
                                                getRemoteConfigInt('V5RCseason')
                                                    .toString(),
                                          ),
                                        ),
                                        if (FFAppState().HomePageAW.length >= 3)
                                          Builder(
                                            builder: (context) {
                                              if (FFAppState().HomePageAW[2] ==
                                                  'Upcoming Events') {
                                                return wrapWithModel(
                                                  model: _model
                                                      .upcomingEventsModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: const EventsWidget(),
                                                );
                                              } else if (FFAppState()
                                                      .HomePageAW[2] ==
                                                  'World Skills') {
                                                return Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .worldSkillsModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: const WorldSkillsWidget(),
                                                  ),
                                                );
                                              } else if (FFAppState()
                                                      .HomePageAW[2] ==
                                                  'Followed Teams') {
                                                return Container(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .followedTeamsModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const FollowedTeamsWidget(),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (!(valueOrDefault<bool>(
                                      currentUserDocument?.verifiedOnTeam,
                                      false) &&
                                  FFAppState().verified))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 70.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 25.0, 20.0, 0.0),
                                            child: Text(
                                              'We can\'t confirm that you\'ve been verified, or the requested page wasn\'t found.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 15.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_RETRY_BTN_ON_TAP');
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
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.teamNum, ''),
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
                                  ),
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.verifiedOnTeam,
                                          false) &&
                                      FFAppState().verified)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          buttonSize: 36.0,
                                          icon: Icon(
                                            FFIcons.kedit3,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_edit3_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_to');

                                            context.pushNamed(
                                              'TeamProfile',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
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
                                            'HOME_PAGE_PAGE_redoAlt_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');

                                        safeSetState(() {});
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
                                                const Duration(milliseconds: 850),
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
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                          child: Stack(
                                            children: [
                                              if (widget.from == 1)
                                                wrapWithModel(
                                                  model: _model
                                                      .navBarScheduleModel,
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
                                                  model: _model
                                                      .navBarMessagesModel,
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
                                                  child: const NavBarBGWidget(),
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
                                                  model:
                                                      _model.navBarOtherModel,
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Container_arbp40pe_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'Schedule',
                                                  queryParameters: {
                                                    'from': serializeParam(
                                                      3,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
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
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.kclock,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Container_fa4jv4q7_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'Messages',
                                                  queryParameters: {
                                                    'from': serializeParam(
                                                      3,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
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
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.kmessageSquare,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Container_mrs4yv09_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'HomePage',
                                                  queryParameters: {
                                                    'from': serializeParam(
                                                      3,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
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
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.khome,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Container_ucgb5nkk_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'Explore',
                                                  queryParameters: {
                                                    'from': serializeParam(
                                                      3,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
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
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.kcompass,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_Container_z9pejvf8_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'More',
                                                  queryParameters: {
                                                    'from': serializeParam(
                                                      3,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
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
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.kmoreVertical,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                ),
              ],
            ),
          ),
        ));
  }
}
