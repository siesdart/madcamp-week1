import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';

class _FToastHookCreator {
  const _FToastHookCreator();

  FToast call() => use(const _FToastHook());
}

const useFToast = _FToastHookCreator();

class _FToastHook extends Hook<FToast> {
  const _FToastHook();

  @override
  HookState<FToast, Hook<FToast>> createState() => _FToastControllerHookState();
}

class _FToastControllerHookState extends HookState<FToast, _FToastHook> {
  late final _fToast = FToast().init(context);

  @override
  FToast build(BuildContext context) => _fToast;

  @override
  String? get debugLabel => 'useFToast';
}
