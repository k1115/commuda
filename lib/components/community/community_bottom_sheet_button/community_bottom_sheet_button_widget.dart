import '/backend/supabase/supabase.dart';
import '/components/community/bottom_sheets/community_bottom_sheet/community_bottom_sheet_widget.dart';
import '/components/community/bottom_sheets/community_owner_bottom_sheet/community_owner_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'community_bottom_sheet_button_model.dart';
export 'community_bottom_sheet_button_model.dart';

class CommunityBottomSheetButtonWidget extends StatefulWidget {
  const CommunityBottomSheetButtonWidget({
    super.key,
    required this.community,
    required this.userId,
  });

  final int? community;
  final int? userId;

  @override
  State<CommunityBottomSheetButtonWidget> createState() =>
      _CommunityBottomSheetButtonWidgetState();
}

class _CommunityBottomSheetButtonWidgetState
    extends State<CommunityBottomSheetButtonWidget> {
  late CommunityBottomSheetButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityBottomSheetButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (!_model.disableButton) {
          _model.disableButton = true;
          safeSetState(() {});
          _model.communityOutput = await CommunityWithImageTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.community,
            ),
          );
          if (_model.communityOutput?.firstOrNull?.creatorId ==
              widget.userId) {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: CommunityOwnerBottomSheetWidget(
                    community: _model.communityOutput!.firstOrNull!,
                    currentUserId: widget.userId!,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          } else {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: CommunityBottomSheetWidget(
                    community: _model.communityOutput!.firstOrNull!,
                    userId: widget.userId!,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }

          _model.disableButton = false;
          safeSetState(() {});
        }

        safeSetState(() {});
      },
      child: Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          color: Color(0x65292929),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: SvgPicture.asset(
              'assets/images/ic-more_vert.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
