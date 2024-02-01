// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound_player/themes/theme_provider.dart';

class NewBox extends StatelessWidget {
  const NewBox({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black : Colors.grey.shade500,
            offset: Offset(4, 4),
            blurRadius: 15,
          ),
          BoxShadow(
            color: isDarkMode ? Colors.grey : Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
          )
        ],
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
