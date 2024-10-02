import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tap_to_create/tap_to_create_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/new_checklist_item/new_checklist_item_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'match_checklist_model.dart';
export 'match_checklist_model.dart';

class MatchChecklistWidget extends StatefulWidget {
  const MatchChecklistWidget({super.key});

  @override
  State<MatchChecklistWidget> createState() => _MatchChecklistWidgetState();
}

class _MatchChecklistWidgetState extends State<MatchChecklistWidget>
    with TickerProviderStateMixin {
  late MatchChecklistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchChecklistModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MatchChecklist'});
    animationsMap.addAll({
      'floatingActionButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
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
    return Title(
        title: 'MatchChecklist',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                logFirebaseEvent('MATCH_CHECKLIST_FloatingActionButton_07l');
                logFirebaseEvent('FloatingActionButton_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: const Color(0x5D151923),
                  enableDrag: false,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: const SizedBox(
                          height: double.infinity,
                          child: NewChecklistItemWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.add_task,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
            ).animateOnActionTrigger(
              animationsMap['floatingActionButtonOnActionTriggerAnimation']!,
            ),
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
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 76.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'MATCH_CHECKLIST_UNCHECK_ALL_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_firestore_query');
                                        _model.matchListQuery =
                                            await queryMatchListItemsRecordOnce(
                                          queryBuilder:
                                              (matchListItemsRecord) =>
                                                  matchListItemsRecord.where(
                                            'teamID',
                                            isEqualTo: valueOrDefault(
                                                currentUserDocument?.teamID, 0),
                                          ),
                                        );
                                        while (_model.matchListQuery!.length >=
                                            _model.checkI) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await _model
                                              .matchListQuery![_model.checkI]
                                              .reference
                                              .update(
                                                  createMatchListItemsRecordData(
                                            checked: false,
                                          ));
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.checkI = _model.checkI + 1;
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Uncheck All',
                                      icon: const FaIcon(
                                        FontAwesomeIcons.undo,
                                        size: 12.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 141.0,
                                        height: 36.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.transparent,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.checklistNotifs,
                                          false) ==
                                      true)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 10.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MATCH_CHECKLIST_DISABLE_NOTIFICATIONS_BT');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              checklistNotifs: false,
                                            ));
                                            logFirebaseEvent(
                                                'Button_update_page_state');

                                            safeSetState(() {});
                                          },
                                          text: 'Disable Notifications',
                                          icon: const Icon(
                                            FFIcons.kbellOff,
                                            size: 12.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 182.0,
                                            height: 36.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.transparent,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.checklistNotifs,
                                          false) ==
                                      false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 10.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MATCH_CHECKLIST_ENABLE_NOTIFICATIONS_BTN');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              checklistNotifs: true,
                                            ));
                                            logFirebaseEvent(
                                                'Button_update_page_state');

                                            safeSetState(() {});
                                          },
                                          text: 'Enable Notifications',
                                          icon: const Icon(
                                            FFIcons.kbell,
                                            size: 12.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 182.0,
                                            height: 36.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.transparent,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<MatchListItemsRecord>>(
                                  stream: queryMatchListItemsRecord(
                                    queryBuilder: (matchListItemsRecord) =>
                                        matchListItemsRecord
                                            .where(
                                              'teamID',
                                              isEqualTo: valueOrDefault(
                                                  currentUserDocument?.teamID,
                                                  0),
                                            )
                                            .orderBy('checked'),
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
                                    List<MatchListItemsRecord>
                                        listViewMatchListItemsRecordList =
                                        snapshot.data!;
                                    if (listViewMatchListItemsRecordList
                                        .isEmpty) {
                                      return const TapToCreateWidget();
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewMatchListItemsRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMatchListItemsRecord =
                                            listViewMatchListItemsRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MATCH_CHECKLIST_ListTile_61g1ztlg_ON_TAP');
                                            if (listViewMatchListItemsRecord
                                                .checked) {
                                              logFirebaseEvent(
                                                  'ListTile_backend_call');

                                              await listViewMatchListItemsRecord
                                                  .reference
                                                  .update(
                                                      createMatchListItemsRecordData(
                                                checked: false,
                                              ));
                                            } else {
                                              logFirebaseEvent(
                                                  'ListTile_backend_call');

                                              await listViewMatchListItemsRecord
                                                  .reference
                                                  .update(
                                                      createMatchListItemsRecordData(
                                                checked: true,
                                              ));
                                            }
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: '',
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  icon: FFIcons.ktrash2,
                                                  onPressed: (_) async {
                                                    logFirebaseEvent(
                                                        'MATCH_CHECKLIST_SlidableActionWidget_1f3');
                                                    logFirebaseEvent(
                                                        'SlidableActionWidget_backend_call');
                                                    await listViewMatchListItemsRecord
                                                        .reference
                                                        .delete();
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.check_box,
                                                color: valueOrDefault<Color>(
                                                  listViewMatchListItemsRecord
                                                          .checked
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                                ),
                                              ),
                                              title: Text(
                                                listViewMatchListItemsRecord
                                                    .itemName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: true,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                            ),
                                          ),
                                        );
                                      },
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
                ),
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 8.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 20.0, 20.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
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
                                                'MATCH_CHECKLIST_arrowLeft_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_back');
                                            context.safePop();
                                          },
                                        ),
                                      ),
                                      Text(
                                        'Match Checklist',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Sora',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
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
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
