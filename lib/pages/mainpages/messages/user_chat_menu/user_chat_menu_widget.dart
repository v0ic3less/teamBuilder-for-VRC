import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_report/user_report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_chat_menu_model.dart';
export 'user_chat_menu_model.dart';

class UserChatMenuWidget extends StatefulWidget {
  const UserChatMenuWidget({
    super.key,
    required this.userReference,
  });

  final UsersRecord? userReference;

  @override
  State<UserChatMenuWidget> createState() => _UserChatMenuWidgetState();
}

class _UserChatMenuWidgetState extends State<UserChatMenuWidget> {
  late UserChatMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserChatMenuModel());

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
      width: 125.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.userReference?.teamID ==
                  valueOrDefault(currentUserDocument?.teamID, 0)
              ? false
              : true)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('USER_CHAT_MENU_COMP_Row_vkw8mcjk_ON_TAP');
                    if ((currentUserDocument?.blockedUsers.toList() ?? [])
                        .contains(widget.userReference?.reference)) {
                      logFirebaseEvent('Row_alert_dialog');
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Unblock User?'),
                                content: const Text(
                                    'Are you sure you want to unblock this user?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('Row_backend_call');

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'blockedUsers': FieldValue.arrayRemove(
                                  [widget.userReference?.reference]),
                            },
                          ),
                        });
                      }
                    } else {
                      logFirebaseEvent('Row_alert_dialog');
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Block User?'),
                                content: const Text(
                                    'Are you sure you want to block this user? You will no longer recieve messages from them.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('Row_backend_call');

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'blockedUsers': FieldValue.arrayUnion(
                                  [widget.userReference?.reference]),
                            },
                          ),
                        });
                      }
                    }

                    logFirebaseEvent('Row_bottom_sheet');
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
                        child: Icon(
                          Icons.block_rounded,
                          color: FlutterFlowTheme.of(context).error,
                          size: 23.0,
                        ),
                      ),
                      Text(
                        (currentUserDocument?.blockedUsers.toList() ?? [])
                                .contains(widget.userReference?.reference)
                            ? 'Unblock'
                            : 'Block',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('USER_CHAT_MENU_COMP_Row_lejjkd7w_ON_TAP');
                  logFirebaseEvent('Row_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: const AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: SizedBox(
                          height: 430.0,
                          width: 300.0,
                          child: UserReportWidget(
                            reportedUserRef: widget.userReference!.reference,
                            name: widget.userReference?.displayName,
                            reporterUserRef: currentUserReference!,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
                      child: Icon(
                        Icons.flag_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 23.0,
                      ),
                    ),
                    Text(
                      'Report',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
