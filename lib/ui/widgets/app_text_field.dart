import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

@immutable
class AppTextField extends StatefulWidget {

  final String? hint;
  final int maxLength;
  final TextInputType keyboardType;
  final bool isPhone;
  final bool isPassword;
  final TextEditingController? controller;
  final bool readonly;
  final int minLines;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final int index;
  final bool enabled;
  final double borderRadius;

  const AppTextField({Key? key,
    this.hint,
    this.controller,
    this.maxLength = -1,
    this.minLines = 1,
    this.maxLines = 1,
    this.isPhone = false,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.index = 0,
    this.keyboardType = TextInputType.text,
    this.readonly = false,
    this.enabled = true,
    this.borderRadius = AppDimensions.inputBorderRadius,
    this.onTap
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  final _focus = FocusNode();
  final _hintStyle = const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.normal);
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focus.addListener(_onFocusChange);

    if (widget.controller is TextController) {
      (widget.controller as TextController)._onFocus = () {
        _focus.requestFocus();
      };
    }
  }

  void _onFocusChange() {
    setState(() {

    });
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  _getPasswordToggle() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(onPressed: () {
        _obscureText = !_obscureText;
        setState(() {

        });
      }, icon: Icon(_obscureText ? Ionicons.eye_outline : Ionicons.eye_off_outline)),
    );
  }

  _getSuffix() {
    if (widget.isPassword) return _getPasswordToggle();

    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    if (widget.onTap != null) {
      return const Icon(Icons.arrow_drop_down);
    }

    return widget.suffixIcon;
  }

  _getMaxLength() {
    if (widget.isPhone) return 9;
    return widget.maxLength;
  }

  @override
  Widget build(BuildContext context) {

    const style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

    var txt = TextField(
      controller: widget.controller,
      style: style,
      focusNode: _focus,
      enabled: widget.enabled,
      obscureText: _obscureText,
      autofocus: false,
      autocorrect: false,
      minLines: widget.minLines,
      maxLines: widget.minLines > widget.maxLines ? widget.minLines : widget.maxLines,
      textCapitalization: widget.keyboardType == TextInputType.text ? TextCapitalization.sentences : TextCapitalization.none,
      textAlignVertical: TextAlignVertical.center,
      readOnly: widget.readonly || widget.onTap != null,
      onTap: widget.onTap,
      keyboardType: widget.isPhone ? TextInputType.phone : widget.keyboardType,
      maxLength: _getMaxLength(),
      decoration: InputDecoration(
        counter: const Offstage(),
        fillColor: widget.readonly ? const Color(0xFFE3E6FA) : const Color(0xFFFBFBFB),
        filled: true,
        focusColor: AppColors.appBlue,
        contentPadding: widget.minLines > 1 ? null : const EdgeInsets.only(left: 20, bottom: 0, top: 0),
        isDense: false,
        alignLabelWithHint: true,
        hintStyle: const TextStyle(color: AppColors.colorHintOnWhite, fontWeight: FontWeight.normal),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius), borderSide: const BorderSide(color: Color(0xFFE6E6E6), width: 1.0)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius), borderSide: const BorderSide(color: AppColors.appBlue, width: 1.0)),
        errorBorder: InputBorder.none,
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius), borderSide: const BorderSide(color: AppColors.colorError, width: 1.0)),
        labelText: widget.isPhone ? null : widget.hint,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _getSuffix(),
        labelStyle: _hintStyle,
      ),
    );

    return txt;
  }
}

class TextController extends TextEditingController {
  Function()? _onFocus;

  void setFocus() {
    _onFocus?.call();
  }
}

class ValueEditingController<T> extends TextEditingController {
  T? _editValue;

  T? get editValue => _editValue;
  set editValue(T? c) {
    _editValue = c;
    if (c == null) clear();
  }
}