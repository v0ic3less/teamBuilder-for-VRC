import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customize_homepage_model.dart';
export 'customize_homepage_model.dart';

class CustomizeHomepageWidget extends StatefulWidget {
  const CustomizeHomepageWidget({super.key});

  @override
  State<CustomizeHomepageWidget> createState() =>
      _CustomizeHomepageWidgetState();
}

class _CustomizeHomepageWidgetState extends State<CustomizeHomepageWidget> {
  late CustomizeHomepageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomizeHomepageModel());

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

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6.0,
          sigmaY: 8.0,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 7.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    -2.0,
                  ),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 3.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customize',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Sora',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kcheck,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CUSTOMIZE_HOMEPAGE_COMP_check_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              Navigator.pop(context);
                              logFirebaseEvent('IconButton_update_app_state');

                              _model.updatePage(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'At Competition',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final addedWidgetsAC =
                              FFAppState().HomePageACAW.toList();

                          return ReorderableListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: addedWidgetsAC.length,
                            itemBuilder: (context, addedWidgetsACIndex) {
                              final addedWidgetsACItem =
                                  addedWidgetsAC[addedWidgetsACIndex];
                              return Container(
                                key: ValueKey("ListView_a006ja7n" '_' +
                                    addedWidgetsACIndex.toString()),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        buttonSize: 34.0,
                                        fillColor:
                                            FlutterFlowTheme.of(context).error,
                                        icon: Icon(
                                          FFIcons.kminusCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 18.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CUSTOMIZE_HOMEminusCircle_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState().removeFromHomePageACAW(
                                              addedWidgetsACItem);
                                          safeSetState(() {});
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          addedWidgetsACItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            onReorder: (int reorderableOldIndex,
                                int reorderableNewIndex) async {
                              logFirebaseEvent(
                                  'CUSTOMIZE_HOMEListView_a006ja7n_ON_REORD');
                              logFirebaseEvent('ListView_update_app_state');
                              FFAppState().removeAtIndexFromHomePageACAW(
                                  reorderableOldIndex);
                              safeSetState(() {});
                              if (reorderableNewIndex > reorderableOldIndex) {
                                logFirebaseEvent('ListView_update_app_state');
                                FFAppState().insertAtIndexInHomePageACAW(
                                    functions.subtractInt(
                                        reorderableNewIndex, 1),
                                    addedWidgetsAC[reorderableOldIndex]);
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('ListView_update_app_state');
                                FFAppState().insertAtIndexInHomePageACAW(
                                    reorderableNewIndex,
                                    addedWidgetsAC[reorderableOldIndex]);
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final allWidgetsAC =
                              FFAppConstants.HomePageACPW.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: allWidgetsAC.length,
                            itemBuilder: (context, allWidgetsACIndex) {
                              final allWidgetsACItem =
                                  allWidgetsAC[allWidgetsACIndex];
                              return Visibility(
                                visible: !FFAppState()
                                    .HomePageACAW
                                    .contains(allWidgetsACItem),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        buttonSize: 34.0,
                                        fillColor: const Color(0xFF3BA14C),
                                        icon: Icon(
                                          FFIcons.kplusCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 18.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CUSTOMIZE_HOMEplusCircle_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState().addToHomePageACAW(
                                              allWidgetsACItem);
                                          safeSetState(() {});
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 5.0, 0.0, 5.0),
                                        child: Text(
                                          allWidgetsACItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Not At Competition',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final addedWidgets = FFAppState().HomePageAW.toList();

                          return ReorderableListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: addedWidgets.length,
                            itemBuilder: (context, addedWidgetsIndex) {
                              final addedWidgetsItem =
                                  addedWidgets[addedWidgetsIndex];
                              return Container(
                                key: ValueKey("ListView_f09k1js2" '_' +
                                    addedWidgetsIndex.toString()),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        buttonSize: 34.0,
                                        fillColor:
                                            FlutterFlowTheme.of(context).error,
                                        icon: Icon(
                                          FFIcons.kminusCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 18.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CUSTOMIZE_HOMEminusCircle_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState().removeFromHomePageAW(
                                              addedWidgetsItem);
                                          safeSetState(() {});
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          addedWidgetsItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            onReorder: (int reorderableOldIndex,
                                int reorderableNewIndex) async {
                              logFirebaseEvent(
                                  'CUSTOMIZE_HOMEListView_f09k1js2_ON_REORD');
                              logFirebaseEvent('ListView_update_app_state');
                              FFAppState().removeAtIndexFromHomePageAW(
                                  reorderableOldIndex);
                              safeSetState(() {});
                              if (reorderableNewIndex > reorderableOldIndex) {
                                logFirebaseEvent('ListView_update_app_state');
                                FFAppState().insertAtIndexInHomePageAW(
                                    functions.subtractInt(
                                        reorderableNewIndex, 1),
                                    addedWidgets[reorderableOldIndex]);
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('ListView_update_app_state');
                                FFAppState().insertAtIndexInHomePageAW(
                                    reorderableNewIndex,
                                    addedWidgets[reorderableOldIndex]);
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final allWidgets = FFAppConstants.HomePagePW.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: allWidgets.length,
                            itemBuilder: (context, allWidgetsIndex) {
                              final allWidgetsItem =
                                  allWidgets[allWidgetsIndex];
                              return Visibility(
                                visible: !FFAppState()
                                    .HomePageAW
                                    .contains(allWidgetsItem),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        buttonSize: 34.0,
                                        fillColor: const Color(0xFF3BA14C),
                                        icon: Icon(
                                          FFIcons.kplusCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 18.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CUSTOMIZE_HOMEplusCircle_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState()
                                              .addToHomePageAW(allWidgetsItem);
                                          safeSetState(() {});
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 5.0, 0.0, 5.0),
                                        child: Text(
                                          allWidgetsItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
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
    );
  }
}
