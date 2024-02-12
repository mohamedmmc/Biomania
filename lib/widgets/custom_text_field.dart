import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constant/app_fonts.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final bool isTextArea;
  final bool isOptional;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final double? height;
  final double? width;
  final FocusNode? focusNode;
  final bool? readOnly;
  final Widget? suffixIcon;
  final bool enabled;
  final bool autofocus;
  final double? topPadding;
  final double? textFontSize;
  final int? maxLength;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final bool outlinedBorder;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const CustomTextField({
    Key? key,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.textInputType,
    this.isTextArea = false,
    this.isPassword = false,
    this.isOptional = false,
    this.readOnly,
    this.width,
    this.height,
    this.focusNode,
    this.enabled = true,
    this.topPadding,
    this.textFontSize,
    this.maxLength,
    this.textAlign,
    this.autofocus = false,
    this.prefixIcon,
    this.outlinedBorder = true,
    this.onTapOutside,
    this.textCapitalization,
    this.inputFormatters,
    this.textStyle,
    this.hintStyle,
    this.controller,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  CustomTextFieldState createState() => CustomTextFieldState(isPassword);
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  CustomTextFieldState(this._obscureText);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        child: Stack(
          children: <Widget>[
            if (widget.isOptional)
              Positioned(
                top: 10,
                right: 5,
                child: Text(
                  'lbl_optional'.tr,
                  style: const TextStyle(fontSize: 8),
                ),
              ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                padding: EdgeInsets.only(top: widget.topPadding ?? Paddings.extraLarge),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  maxLength: widget.maxLength,
                  onTapOutside: widget.onTapOutside,
                  inputFormatters: widget.inputFormatters,
                  style: widget.textStyle ?? TextStyle(fontSize: widget.textFontSize, color: kGrey),
                  enabled: widget.enabled,
                  textDirection: widget.textInputType == TextInputType.phone ? TextDirection.ltr : null,
                  focusNode: widget.focusNode,
                  textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
                  keyboardType: widget.textInputType,
                  textAlign: widget.textAlign ?? TextAlign.left,
                  autofocus: widget.autofocus,
                  maxLines: widget.isTextArea ? 10 : 1,
                  onTap: widget.onTap,
                  readOnly: widget.readOnly ?? widget.onTap != null,
                  validator: widget.validator,
                  onFieldSubmitted: widget.onSubmitted,
                  onChanged: widget.onChanged,
                  textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: textFieldColor,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: AppFonts.x15Regular.copyWith(color: kGrey),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(RadiusSize.extraLarge)),
                      borderSide: BorderSide(color: kWhite, width: 1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(RadiusSize.extraLarge)),
                      borderSide: BorderSide(color: kWhite, width: 1),
                    ),

                    contentPadding: const EdgeInsets.all(30),
                    labelText: widget.labelText,
                    alignLabelWithHint: true,
                    border: widget.outlinedBorder
                        ? const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(RadiusSize.circular)), borderSide: BorderSide(color: kGrey, width: 2))
                        : null,
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle ?? AppFonts.x14Regular.copyWith(color: kGrey.withAlpha(150)),
                    prefixIcon: widget.prefixIcon,
                    constraints: BoxConstraints(maxHeight: widget.height ?? double.infinity, maxWidth: widget.width ?? double.infinity),
                    suffixIcon: widget.suffixIcon ??
                        (widget.isPassword
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: widget.height != null
                                    ? Icon(
                                        _obscureText ? Icons.visibility_off : Icons.visibility,
                                        size: 30,
                                        color: kBlackColor,
                                      )
                                    : Icon(
                                        _obscureText ? Icons.visibility_off : Icons.visibility,
                                        color: kBlackColor,
                                      ),
                              )
                            : null),
                  ),
                  controller: widget.controller,
                  obscureText: _obscureText,
                ),
              ),
            ),
          ],
        ),
      );
}
