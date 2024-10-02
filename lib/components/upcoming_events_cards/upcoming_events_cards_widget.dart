import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/mainpages/explore/redirect_warning/redirect_warning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'upcoming_events_cards_model.dart';
export 'upcoming_events_cards_model.dart';

class UpcomingEventsCardsWidget extends StatefulWidget {
  const UpcomingEventsCardsWidget({super.key});

  @override
  State<UpcomingEventsCardsWidget> createState() =>
      _UpcomingEventsCardsWidgetState();
}

class _UpcomingEventsCardsWidgetState extends State<UpcomingEventsCardsWidget> {
  late UpcomingEventsCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingEventsCardsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      constraints: const BoxConstraints(
        maxHeight: 220.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).accent4,
                        FlutterFlowTheme.of(context).primaryBackground
                      ],
                      stops: const [0.0, 1.0],
                      begin: const AlignmentDirectional(0.0, -1.0),
                      end: const AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(11.5),
                  ),
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'UPCOMING_EVENTS_CARDS_Container_o03gsyni');
                          logFirebaseEvent('Container_alert_dialog');
                          await showDialog(
                            barrierColor: const Color(0x880F1316),
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.95,
                                  child: const RedirectWarningWidget(
                                    link:
                                        'https://www.robotevents.com/robot-competitions/vex-robotics-competition/sku.html',
                                    websiteName: 'www.youtube.com',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 316.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'June 10th',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 13.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 32.0,
                                            fillColor: Colors.transparent,
                                            icon: Icon(
                                              Icons.content_copy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'UPCOMING_EVENTS_CARDS_content_copy_ICN_O');
                                              logFirebaseEvent(
                                                  'IconButton_copy_to_clipboard');
                                              await Clipboard.setData(const ClipboardData(
                                                  text:
                                                      'https://www.robotevents.com/robot-competitions/vex-robotics-competition/abc.html'));
                                              logFirebaseEvent(
                                                  'IconButton_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Link copied to clipboard',
                                                    style: GoogleFonts.getFont(
                                                      'Sora',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 32.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.open_in_new_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'UPCOMING_EVENTS_CARDS_open_in_new_rounde');
                                              logFirebaseEvent(
                                                  'IconButton_alert_dialog');
                                              await showDialog(
                                                barrierColor: const Color(0x880F1316),
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: SizedBox(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.95,
                                                      child:
                                                          const RedirectWarningWidget(
                                                        link:
                                                            'https://www.robotevents.com/robot-competitions/vex-robotics-competition/abc.html',
                                                        websiteName:
                                                            'www.youtube.com',
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
              ].divide(const SizedBox(width: 12.0)),
            ),
          ),
        ],
      ),
    );
  }
}
