import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectPageSliderWidget extends StatefulWidget {
  const ProjectPageSliderWidget({Key? key}) : super(key: key);

  @override
  _ProjectPageSliderWidgetState createState() =>
      _ProjectPageSliderWidgetState();
}

class _ProjectPageSliderWidgetState extends State<ProjectPageSliderWidget> {
  String? choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FlutterFlowChoiceChips(
            options: [ChipData('Option 1', Icons.done_all)],
            onChanged: (val) => setState(() => choiceChipsValue = val?.first),
            selectedChipStyle: ChipStyle(
              backgroundColor: Color(0xFF323B45),
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                  ),
              iconColor: Colors.white,
              iconSize: 18,
              elevation: 4,
            ),
            unselectedChipStyle: ChipStyle(
              backgroundColor: Colors.white,
              textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF323B45),
                  ),
              iconColor: Color(0xFF323B45),
              iconSize: 18,
              elevation: 4,
            ),
            chipSpacing: 20,
            multiselect: false,
            alignment: WrapAlignment.start,
          ),
        ),
      ),
    );
  }
}
