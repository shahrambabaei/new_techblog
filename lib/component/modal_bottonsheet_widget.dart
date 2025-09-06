import 'package:flutter/material.dart';

class SowModalBottomSheetWidget extends StatefulWidget {
  final String title;

  final String hintText;

  final String? initialEmail;

  final Future<bool> Function(String email)? onSubmit;

  const SowModalBottomSheetWidget({
    super.key,
    required this.title,
    this.hintText = "example@gmail.com",
    this.initialEmail,
    this.onSubmit,
  });

  // static Future<String?> show(
  //     BuildContext context, {
  //       Key? key,
  //       required String title,
  //       String hintText = "example@gmail.com",
  //       String? initialEmail,
  //       Future<bool> Function(String email)? onSubmit,
  //     }) {
  //   return showModalBottomSheet<String?>(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (ctx) {
  //       // Padding for keyboard (viewInsets)
  //       final bottomInset = MediaQuery.of(ctx).viewInsets.bottom;
  //       return Padding(
  //         padding: EdgeInsets.only(bottom: bottomInset),
  //         child: SowModalBottomSheetWidget(
  //           key: key,
  //           title: title,
  //           hintText: hintText,
  //           initialEmail: initialEmail,
  //           onSubmit: onSubmit,
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  State<SowModalBottomSheetWidget> createState() => _SowModalBottomSheetWidgetState();
}

class _SowModalBottomSheetWidgetState extends State<SowModalBottomSheetWidget> {
  // late final TextEditingController _controller;
  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // _controller = TextEditingController(text: widget.initialEmail ?? "");
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  // bool _isEmail(String value) {
  //   // ساده و کافی برای بیشتر سناریوها
  //   final emailReg = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  //   return emailReg.hasMatch(value);
  // }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height / 2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title, style: textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Form(
              // key: _formKey,
              child: TextFormField(
                // controller: _controller,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: textTheme.headlineSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                },
                // validator: (value) {
                //   final v = (value ?? "").trim();
                //   if (v.isEmpty) return "ایمیل را وارد کنید";
                //   if (!_isEmail(v)) return "ایمیل نامعتبر است";
                //   return null;
                // },
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              // if (!(_formKey.currentState?.validate() ?? false)) return;
              //
              // final email = _controller.text.trim();

              // اگر onSubmit داری، تصمیم بگیر که sheet بسته شود یا نه
              // if (widget.onSubmit != null) {
              //   final shouldClose = await widget.onSubmit!(email);
              //   if (shouldClose) Navigator.of(context).pop(email);
              // } else {
              //   // رفتار پیش‌فرض: بستن و برگرداندن ایمیل
              //   Navigator.of(context).pop(email);
              // }
            },
            child: const Text("ادامه"),
          ),
        ],
      ),
    );
  }
}
