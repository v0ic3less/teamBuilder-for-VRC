import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'confirm_delete_account_model.dart';
export 'confirm_delete_account_model.dart';

class ConfirmDeleteAccountWidget extends StatefulWidget {
  const ConfirmDeleteAccountWidget({super.key});

  @override
  State<ConfirmDeleteAccountWidget> createState() =>
      _ConfirmDeleteAccountWidgetState();
}

class _ConfirmDeleteAccountWidgetState
    extends State<ConfirmDeleteAccountWidget> {
  late ConfirmDeleteAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmDeleteAccountModel());

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
      width: 300.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Text(
              'Are you sure you want to delete your account? You will have to redo the verification process.',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).error,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 8.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CONFIRM_DELETE_ACCOUNT_CANCEL_BTN_ON_TAP');
                      logFirebaseEvent('Button_dismiss_dialog');
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Montserrat',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CONFIRM_DELETE_ACCOUNT_DELETE_ACCOUNT_BT');
                      logFirebaseEvent('Button_auth');
                      await authManager.deleteUser(context);
                      logFirebaseEvent('Button_firestore_query');
                      _model.team = await queryTeamsRecordOnce(
                        queryBuilder: (teamsRecord) => teamsRecord.where(
                          'teamID',
                          isEqualTo:
                              valueOrDefault(currentUserDocument?.teamID, 0),
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.team?.teamMembers.length == 1
                          ? true
                          : false) {
                        logFirebaseEvent('Button_backend_call');
                        await _model.team!.reference.delete();
                      } else {
                        if (_model.team?.captainUID == currentUserUid
                            ? true
                            : false) {
                          logFirebaseEvent('Button_firestore_query');
                          _model.newTeamCap = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'uid',
                              isEqualTo: _model.team?.teamMembers.first.id,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          logFirebaseEvent('Button_backend_call');

                          await _model.team!.reference
                              .update(createTeamsRecordData(
                            captainUID: _model.newTeamCap?.uid,
                            captainDisplayName: _model.newTeamCap?.displayName,
                          ));
                        }
                      }

                      logFirebaseEvent('Button_backend_call');
                      await currentUserReference!.delete();
                      logFirebaseEvent('Button_navigate_to');

                      context.goNamed('login');

                      safeSetState(() {});
                    },
                    text: 'Delete Account',
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).error,
                      textStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
