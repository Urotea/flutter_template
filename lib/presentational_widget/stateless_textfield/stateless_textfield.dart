import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class StatelessTextField extends StatefulWidget {
  final String initialValue;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final bool autofocus;
  final bool readOnly;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final GestureTapCallback onTap;
  final TextInputType keyboardType;
  final Key key;

  const StatelessTextField({
    this.key,
    this.initialValue: "",
    this.focusNode,
    this.decoration: const InputDecoration(),
    this.keyboardType: TextInputType.text,
    this.textInputAction,
    this.textCapitalization: TextCapitalization.none,
    this.style,
    this.readOnly: false,
    this.autofocus: false,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.onTap,
  })  : assert(initialValue != null),
        assert(readOnly != null),
        assert(autofocus != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _StatelessTextFieldState(
        initialValue: initialValue,
        focusNode: focusNode,
        decoration: decoration,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        style: style,
        readOnly: readOnly,
        autofocus: autofocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        inputFormatters: inputFormatters,
        enabled: enabled,
        onTap: onTap,
      );
}

class _StatelessTextFieldState extends State<StatelessTextField> {
  final String initialValue;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final bool autofocus;
  final bool readOnly;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final GestureTapCallback onTap;
  final TextInputType keyboardType;
  final TextEditingController controller = TextEditingController();

  _StatelessTextFieldState({
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType: TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.readOnly,
    this.autofocus,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: decoration,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        style: style,
        readOnly: readOnly,
        autofocus: autofocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        inputFormatters: inputFormatters,
        enabled: enabled,
        onTap: onTap,
      );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.text = initialValue;
  }

  @override
  void didUpdateWidget(StatelessTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.text = widget.initialValue;
  }
}
