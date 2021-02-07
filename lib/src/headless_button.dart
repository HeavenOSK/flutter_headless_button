import 'package:flutter/material.dart';

/// A builder for [HeadlessButton] with the states ([enable],
/// [loading], [pressing])
typedef HeadlessButtonBuilder = Widget Function(
  BuildContext context,
  bool enable,
  bool loading,
  bool pressing,
);

/// A component which provides the state to build custom button.
class HeadlessButton extends StatefulWidget {
  const HeadlessButton({
    @required this.builder,
    this.loading = false,
    this.onTap,
    Key key,
  })  : assert(builder != null),
        assert(loading != null),
        super(key: key);

  final bool loading;
  final HeadlessButtonBuilder builder;
  final VoidCallback onTap;

  @override
  _HeadlessButtonState createState() => _HeadlessButtonState();
}

class _HeadlessButtonState extends State<HeadlessButton> {
  bool _pressing = false;
  bool _loading = false;
  bool _enable = false;

  bool get _ignoreTap => _loading || !_enable;

  @override
  void initState() {
    super.initState();
    _loading = widget.loading;
    _enable = widget.onTap != null;
  }

  @override
  void didUpdateWidget(covariant HeadlessButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onTap != widget.onTap) {
      _enable = widget.onTap != null;
    }
    if (oldWidget.loading != widget.loading) {
      _loading = widget.loading;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_ignoreTap) {
          widget.onTap?.call();
        }
      },
      onTapDown: (_) {
        if (!_ignoreTap) {
          setState(() {
            _pressing = true;
          });
        }
      },
      onTapCancel: () {
        setState(() {
          _pressing = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressing = false;
        });
      },
      child: widget.builder(
        context,
        _enable,
        _loading,
        _pressing,
      ),
    );
  }
}
