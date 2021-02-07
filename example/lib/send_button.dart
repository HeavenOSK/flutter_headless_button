import 'package:flutter/material.dart';
import 'package:headless_button/headless_button.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key key,
    this.loading,
    this.onTap,
  }) : super(key: key);

  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeadlessButton(
      loading: loading,
      onTap: onTap,
      builder: (context, enable, loading, pressing) {
        return AnimatedOpacity(
          opacity: pressing || !enable ? 0.55 : 1,
          duration: Duration(milliseconds: 160),
          child: Center(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black.withOpacity(0.7),
                ),
                borderRadius: BorderRadius.circular(160),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              duration: Duration(milliseconds: 160),
              child: loading
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    )
                  : Text('Send'),
            ),
          ),
        );
      },
    );
  }
}
