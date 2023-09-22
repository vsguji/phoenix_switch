/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-08-31 14:41:55
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-22 13:14:06
 * @FilePath: /phoenix_switch/lib/brn_switch_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import 'switch_button_base.dart';

/// 描述: 开关按钮
class SwitchButton extends StatefulWidget {
  final Size size;

  ///选中的状态
  final bool value;

  ///是否可以交互
  final bool enabled;

  ///点击事件
  final ValueChanged<bool> onChanged;

  ///未选中时边框的颜色
  final Color? borderColor;

  SwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.size = const Size(42, 26),
    this.borderColor,
  }) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return BaseSwitchButton(
      borderColor: widget.borderColor ?? _getBorderColor(),
      value: widget.value,
      enabled: widget.enabled,
      size: widget.size,
      trackColor: _getTrackColor(),
      thumbColor: widget.enabled ? Colors.white : const Color(0xFFFDFDFD),
      onChanged: widget.enabled ? widget.onChanged : null,
    );
  }

  Color _getTrackColor() {
    if (widget.value) {
      return widget.enabled
          ? BaseThemeConfig.instance.getConfig().commonConfig.brandPrimary
          : BaseThemeConfig.instance
              .getConfig()
              .commonConfig
              .brandPrimary
              .withAlpha(20);
    } else {
      return widget.enabled ? const Color(0xFFFAFAFA) : const Color(0xFFeeeeee);
    }
  }

  Color _getBorderColor() {
    if (widget.value) {
      return _getTrackColor();
    } else {
      if (widget.enabled) {
        return const Color(0xffeeeeee);
      } else {
        return const Color(0xffeeeeee);
      }
    }
  }
}
