import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'dev_login_model.dart';
export 'dev_login_model.dart';

class DevLoginWidget extends StatefulWidget {
  const DevLoginWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<DevLoginWidget> createState() => _DevLoginWidgetState();
}

class _DevLoginWidgetState extends State<DevLoginWidget> {
  late DevLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevLoginModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: PinCodeTextField(
          autoDisposeControllers: false,
          appContext: context,
          length: 6,
          textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Montserrat',
                letterSpacing: 0.0,
              ),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          enableActiveFill: false,
          autoFocus: true,
          enablePinAutofill: false,
          errorTextSpace: 16.0,
          showCursor: true,
          cursorColor: FlutterFlowTheme.of(context).primary,
          obscureText: false,
          hintCharacter: '●',
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            fieldHeight: 44.0,
            fieldWidth: 44.0,
            borderWidth: 2.0,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            shape: PinCodeFieldShape.box,
            activeColor: FlutterFlowTheme.of(context).primaryText,
            inactiveColor: FlutterFlowTheme.of(context).alternate,
            selectedColor: FlutterFlowTheme.of(context).primary,
          ),
          controller: _model.pinCodeController,
          onChanged: (_) async {
            logFirebaseEvent('DEV_LOGIN_PinCode_h5phy7lu_ON_TEXTFIELD_');
            if (_model.pinCodeController!.text == '358764') {
              logFirebaseEvent('PinCode_navigate_to');

              context.pushNamed('login');
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _model.pinCodeControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
