import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_bar_b_g_model.dart';
export 'nav_bar_b_g_model.dart';

class NavBarBGWidget extends StatefulWidget {
  const NavBarBGWidget({super.key});

  @override
  State<NavBarBGWidget> createState() => _NavBarBGWidgetState();
}

class _NavBarBGWidgetState extends State<NavBarBGWidget> {
  late NavBarBGModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarBGModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(2.5, 5.0, 2.5, 5.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0x5147505C),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
