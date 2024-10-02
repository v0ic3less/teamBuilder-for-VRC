import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tap_to_create/tap_to_create_widget.dart';
import '/components/tap_to_create_copy/tap_to_create_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/mainpages/home/new_to_do_item/new_to_do_item_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'to_do_list_model.dart';
export 'to_do_list_model.dart';

class ToDoListWidget extends StatefulWidget {
  const ToDoListWidget({super.key});

  @override
  State<ToDoListWidget> createState() => _ToDoListWidgetState();
}

class _ToDoListWidgetState extends State<ToDoListWidget>
    with TickerProviderStateMixin {
  late ToDoListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToDoListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'To-DoList'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        title: 'To-DoList',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                logFirebaseEvent('TO_DO_LIST_FloatingActionButton_y14hl4hv');
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
                        child: SizedBox(
                          height: 150.0,
                          child: NewToDoItemWidget(
                            navigateNecessary:
                                _model.tabBarCurrentIndex == 2 ? true : false,
                          ),
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
                            Container(
                              height: 640.0,
                              decoration: const BoxDecoration(),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                                          FlutterFlowTheme.of(context).accent1,
                                      tabs: const [
                                        Tab(
                                          text: 'Unfinished Tasks',
                                        ),
                                        Tab(
                                          text: 'Completed Tasks',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 10.0, 0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      StreamBuilder<
                                                          List<
                                                              ToDoListItemsRecord>>(
                                                    stream:
                                                        queryToDoListItemsRecord(
                                                      queryBuilder:
                                                          (toDoListItemsRecord) =>
                                                              toDoListItemsRecord
                                                                  .where(
                                                                    'teamID',
                                                                    isEqualTo: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.teamID,
                                                                        0),
                                                                  )
                                                                  .where(
                                                                    'checked',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'timeFinishGoal'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            child:
                                                                SpinKitSquareCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ToDoListItemsRecord>
                                                          listViewToDoListItemsRecordList =
                                                          snapshot.data!;
                                                      if (listViewToDoListItemsRecordList
                                                          .isEmpty) {
                                                        return const TapToCreateWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewToDoListItemsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewToDoListItemsRecord =
                                                              listViewToDoListItemsRecordList[
                                                                  listViewIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'TO_DO_LIST_PAGE_ListTile_u2p0k60y_ON_TAP');
                                                              if (!listViewToDoListItemsRecord
                                                                  .checked) {
                                                                logFirebaseEvent(
                                                                    'ListTile_backend_call');

                                                                await listViewToDoListItemsRecord
                                                                    .reference
                                                                    .update(
                                                                        createToDoListItemsRecordData(
                                                                  checked: true,
                                                                ));
                                                              }
                                                            },
                                                            child: Slidable(
                                                              endActionPane:
                                                                  ActionPane(
                                                                motion:
                                                                    const ScrollMotion(),
                                                                extentRatio:
                                                                    0.25,
                                                                children: [
                                                                  SlidableAction(
                                                                    label: '',
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    icon: FFIcons
                                                                        .ktrash2,
                                                                    onPressed:
                                                                        (_) async {
                                                                      logFirebaseEvent(
                                                                          'TO_DO_LIST_SlidableActionWidget_652bzu5v');
                                                                      logFirebaseEvent(
                                                                          'SlidableActionWidget_backend_call');
                                                                      await listViewToDoListItemsRecord
                                                                          .reference
                                                                          .delete();
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ListTile(
                                                                leading: Icon(
                                                                  Icons
                                                                      .check_box,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    listViewToDoListItemsRecord.checked
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                title: Text(
                                                                  listViewToDoListItemsRecord
                                                                      .itemName,
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
                                                                subtitle: Text(
                                                                  'Complete By: ${dateTimeFormat(
                                                                    "MMMEd",
                                                                    listViewToDoListItemsRecord
                                                                        .timeFinishGoal,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                tileColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                dense: true,
                                                                contentPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 10.0, 0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      StreamBuilder<
                                                          List<
                                                              ToDoListItemsRecord>>(
                                                    stream:
                                                        queryToDoListItemsRecord(
                                                      queryBuilder:
                                                          (toDoListItemsRecord) =>
                                                              toDoListItemsRecord
                                                                  .where(
                                                                    'teamID',
                                                                    isEqualTo: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.teamID,
                                                                        0),
                                                                  )
                                                                  .where(
                                                                    'checked',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .orderBy(
                                                                      'timeFinishGoal'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            child:
                                                                SpinKitSquareCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ToDoListItemsRecord>
                                                          listViewToDoListItemsRecordList =
                                                          snapshot.data!;
                                                      if (listViewToDoListItemsRecordList
                                                          .isEmpty) {
                                                        return const TapToCreateCopyWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewToDoListItemsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewToDoListItemsRecord =
                                                              listViewToDoListItemsRecordList[
                                                                  listViewIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'TO_DO_LIST_PAGE_ListTile_o9ooeuih_ON_TAP');
                                                              if (listViewToDoListItemsRecord
                                                                  .checked) {
                                                                logFirebaseEvent(
                                                                    'ListTile_backend_call');

                                                                await listViewToDoListItemsRecord
                                                                    .reference
                                                                    .update(
                                                                        createToDoListItemsRecordData(
                                                                  checked:
                                                                      false,
                                                                ));
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'ListTile_backend_call');

                                                                await listViewToDoListItemsRecord
                                                                    .reference
                                                                    .update(
                                                                        createToDoListItemsRecordData(
                                                                  checked: true,
                                                                ));
                                                              }
                                                            },
                                                            child: ListTile(
                                                              leading: Icon(
                                                                Icons.check_box,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  listViewToDoListItemsRecord.checked
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              title: Text(
                                                                listViewToDoListItemsRecord
                                                                    .itemName,
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
                                                              subtitle: Text(
                                                                'Complete By: ${dateTimeFormat(
                                                                  "MMMEd",
                                                                  listViewToDoListItemsRecord
                                                                      .timeFinishGoal,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                'TO_DO_LIST_PAGE_arrowLeft_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_back');
                                            context.safePop();
                                          },
                                        ),
                                      ),
                                      Text(
                                        'To-Do List',
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
