

import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/text_head_widget.dart';


Widget buildTextHead(ref) {
    final user = ref.watch(sessionProvider).user!;
    return TextHead(
      name: user.displayName!,
      text: 'Welcome to ',
    );
  }