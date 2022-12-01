import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OTPverificationPageWidget extends StatefulWidget {
  const OTPverificationPageWidget({Key? key}) : super(key: key);

  @override
  _OTPverificationPageWidgetState createState() =>
      _OTPverificationPageWidgetState();
}

class _OTPverificationPageWidgetState extends State<OTPverificationPageWidget> {
  TextEditingController? pinCodeController;
  bool? signInConfirmed;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Text(
                  'You\'re almost there !!\nEnter the OTP sent to the registered email',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        fontSize: 18,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  enableActiveFill: false,
                  autoFocus: true,
                  showCursor: true,
                  cursorColor: FlutterFlowTheme.of(context).primaryBtnText,
                  obscureText: false,
                  hintCharacter: '-',
                  pinTheme: PinTheme(
                    fieldHeight: 40,
                    fieldWidth: 40,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(12),
                    shape: PinCodeFieldShape.box,
                    activeColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    inactiveColor: FlutterFlowTheme.of(context).primaryBtnText,
                    selectedColor: FlutterFlowTheme.of(context).secondaryText,
                    activeFillColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    inactiveFillColor:
                        FlutterFlowTheme.of(context).primaryBtnText,
                    selectedFillColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  controller: pinCodeController,
                  onChanged: (_) => {},
                  onCompleted: (_) async {
                    signInConfirmed = await actions.confirmSignUp(
                      context,
                      FFAppState().userEmail,
                      pinCodeController!.text,
                    );
                    if (signInConfirmed == true) {
                      context.pushNamed('ProjectPage');
                    } else {
                      setState(() => FFAppState().invalidOtpRetry = true);
                    }

                    setState(() {});
                  },
                ),
              ),
              if (FFAppState().invalidOtpRetry)
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Lottie.asset(
                          'assets/lottie_animations/otp_failure.json',
                          width: 75,
                          height: 65,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Invalid OTP, retry !!',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
