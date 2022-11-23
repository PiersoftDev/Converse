import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class LandingPageLatestWidget extends StatefulWidget {
  const LandingPageLatestWidget({Key? key}) : super(key: key);

  @override
  _LandingPageLatestWidgetState createState() =>
      _LandingPageLatestWidgetState();
}

class _LandingPageLatestWidgetState extends State<LandingPageLatestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFADCBD7),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          color: Color(0xFFADCBD7),
                        ),
                        child: Lottie.asset(
                          'assets/lottie_animations/93663-site-prep.json',
                          width: 150,
                          height: 130,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.05),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 400, 250, 0),
                          child: Image.asset(
                            'assets/images/Projects_Logo_-_100X100_Projects_Logo_100X100.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.8, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: SelectionArea(
                          child: Text(
                        'Welcome to,',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF1A374D),
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                      )),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.3, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: SelectionArea(
                          child: GradientText(
                        'Converse',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Dune',
                              color: Color(0xFF1A374D),
                              fontSize: 40,
                              useGoogleFonts: false,
                            ),
                        colors: [Color(0xFF1A374D), Color(0xFF4E4BED)],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      )),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final result = await Amplify.Auth.fetchAuthSession();
                          if (result.isSignedIn) {
                            context.pushNamed(
                              'ProjectPageLatest',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 200),
                                ),
                              },
                            );
                          } else {
                            context.pushNamed(
                              'LoginPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          }
                        },
                        text: 'Explore',
                        icon: FaIcon(
                          FontAwesomeIcons.rocket,
                        ),
                        options: FFButtonOptions(
                          width: 180,
                          height: 40,
                          color: Color(0xFF406882),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
