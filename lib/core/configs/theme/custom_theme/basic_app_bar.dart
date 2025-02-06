import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? actions;
  final bool hideBack;

  const BasicAppBar({
    super.key,
    this.title,
    this.actions,
    this.hideBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.amber.shade600,
        title: title,
        centerTitle: true,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [actions ?? const SizedBox()],
        leading: hideBack
            ? null
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Colors.white,
                )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
