import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'image_component_model.dart';
export 'image_component_model.dart';

class ImageComponentWidget extends StatefulWidget {
  const ImageComponentWidget({
    super.key,
    required this.imagePath,
    int? width,
    int? height,
  })  : this.width = width ?? 200,
        this.height = height ?? 200;

  final String? imagePath;
  final int width;
  final int height;

  @override
  State<ImageComponentWidget> createState() => _ImageComponentWidgetState();
}

class _ImageComponentWidgetState extends State<ImageComponentWidget> {
  late ImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.imagePath != null && widget.imagePath != '') {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.imagePath!,
              width: widget.width.toDouble(),
              height: widget.height.toDouble(),
              fit: BoxFit.cover,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/image-cover.png',
              width: widget.width.toDouble(),
              height: widget.height.toDouble(),
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
