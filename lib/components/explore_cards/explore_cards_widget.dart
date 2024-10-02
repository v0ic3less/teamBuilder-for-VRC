import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/mainpages/explore/redirect_warning/redirect_warning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'explore_cards_model.dart';
export 'explore_cards_model.dart';

class ExploreCardsWidget extends StatefulWidget {
  const ExploreCardsWidget({super.key});

  @override
  State<ExploreCardsWidget> createState() => _ExploreCardsWidgetState();
}

class _ExploreCardsWidgetState extends State<ExploreCardsWidget> {
  late ExploreCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreCardsModel());

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
      height: 369.0,
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
            child: PagedListView<DocumentSnapshot<Object?>?,
                RevealsRecord>.separated(
              pagingController: _model.setListViewController(
                RevealsRecord.collection.orderBy('posted', descending: true),
              ),
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              reverse: false,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 12.0),
              builderDelegate: PagedChildBuilderDelegate<RevealsRecord>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: SpinKitSquareCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 35.0,
                    ),
                  ),
                ),
                // Customize what your widget looks like when it's loading another page.
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: SpinKitSquareCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 35.0,
                    ),
                  ),
                ),

                itemBuilder: (context, _, listViewIndex) {
                  final listViewRevealsRecord =
                      _model.listViewPagingController!.itemList![listViewIndex];
                  return Container(
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
                                'EXPLORE_CARDS_Container_f7nocvxu_ON_TAP');
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
                                    child: RedirectWarningWidget(
                                      link: listViewRevealsRecord.link,
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
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      listViewRevealsRecord.thumbnailUrl,
                                      width: 350.0,
                                      height: 152.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 7.5, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            listViewRevealsRecord.name
                                                .maybeHandleOverflow(
                                              maxChars: 20,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                  FFIcons.kcopy,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EXPLORE_CARDS_COMP_copy_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_copy_to_clipboard');
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text:
                                                              listViewRevealsRecord
                                                                  .link));
                                                  logFirebaseEvent(
                                                      'IconButton_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Link copied to clipboard',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 32.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  FFIcons.kexternalLink,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EXPLORE_CARDS_externalLink_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_alert_dialog');
                                                  await showDialog(
                                                    barrierColor:
                                                        const Color(0x880F1316),
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
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.95,
                                                          child:
                                                              RedirectWarningWidget(
                                                            link:
                                                                listViewRevealsRecord
                                                                    .link,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
