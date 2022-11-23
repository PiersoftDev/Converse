import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../custom_code/actions/email_confirmation.dart' as actions;

class EmailVerificationCodePageWidget extends StatefulWidget {
  const EmailVerificationCodePageWidget({Key? key}) : super(key: key);

  @override
  _EmailVerificationCodePageWidgetState createState() =>
      _EmailVerificationCodePageWidgetState();
}

class _EmailVerificationCodePageWidgetState
    extends State<EmailVerificationCodePageWidget> {
  TextEditingController? pinCodeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showUserConfirmation = false;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
    _showUserConfirmation = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFADCBD7),
      appBar: AppBar(
        backgroundColor: Color(0xFFADCBD7),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Confirm your Code',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF1A374D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                        child: Text(
                          'Please enter the code that is sent to the registered email id.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF1A374D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF4B39EF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: false,
                          autoFocus: true,
                          showCursor: true,
                          cursorColor: Color(0xFF4B39EF),
                          obscureText: false,
                          hintCharacter: '-',
                          pinTheme: PinTheme(
                            fieldHeight: 50,
                            fieldWidth: 50,
                            borderWidth: 2,
                            borderRadius: BorderRadius.circular(5),
                            shape: PinCodeFieldShape.box,
                            activeColor: Color(0xFF4B39EF),
                            inactiveColor: Color(0xFFF1F4F8),
                            selectedColor: Color(0xFF57636C),
                            activeFillColor: Color(0xFF4B39EF),
                            inactiveFillColor: Color(0xFFF1F4F8),
                            selectedFillColor: Color(0xFF57636C),
                          ),
                          controller: pinCodeController,
                          onChanged: (_) => {},
                          onCompleted: (_) async {
                            final userConfirmed = await actions
                                .confirmSignUp(pinCodeController!.text);
                            if (userConfirmed) {
                              setState(() {
                                _showUserConfirmation = true;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  )),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 250),
                    child: Container(
                        width: double.infinity,
                        //height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                        child: Visibility(
                          visible: _showUserConfirmation,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Lottie.asset(
                                  'assets/lottie_animations/8603-profile.json',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  repeat: false,
                                  animate: true,
                                ),
                                Text(
                                  'Profile Created Successfully',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 22,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ))),
              ],
            ),
          )),
    );
  }
}
