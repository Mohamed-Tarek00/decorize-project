import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/shared/log/domain/entities/user_entity.dart';
import 'package:decorize_project/features/shared/log/presentation/views/widgets/send_orp_view_body.dart';
import 'package:flutter/material.dart';

class SendOtpView extends StatelessWidget {
  const SendOtpView({
    super.key,
    required this.user,
    required this.verficationCode,
  });
  final UserEntity user;
  final String verficationCode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kScaffoldColor,
        body: SendOrpViewBody(user: user, verficationCode: verficationCode),
      ),
    );
  }
}
