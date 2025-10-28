import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'image_with_badge_model.dart';
export 'image_with_badge_model.dart';

class ImageWithBadgeWidget extends StatefulWidget {
  const ImageWithBadgeWidget({
    super.key,
    required this.imagePath,
    required this.badgePath,
  });

  final String? imagePath;
  final String? badgePath;

  @override
  State<ImageWithBadgeWidget> createState() => _ImageWithBadgeWidgetState();
}

class _ImageWithBadgeWidgetState extends State<ImageWithBadgeWidget> {
  late ImageWithBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageWithBadgeModel());

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
      width: 45.0,
      height: 45.0,
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              if (widget.imagePath != null && widget.imagePath != '') {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: OctoImage(
                    placeholderBuilder: (_) => SizedBox.expand(
                      child: Image(
                        image: BlurHashImage('BlurHashString'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    image: NetworkImage(
                      functions.getImagePath(widget.imagePath)!,
                    ),
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                    'assets/images/image-profile.png',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                );
              }
            },
          ),
          Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Builder(
              builder: (context) {
                if (widget.badgePath != null && widget.badgePath != '') {
                  return Container(
                    width: 20.0,
                    height: 20.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      functions.getImagePath(widget.badgePath)!,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
