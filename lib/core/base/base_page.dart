import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlymaygiat/core/base/base_cubit.dart';
import 'package:quanlymaygiat/core/base/effect_listener.dart';

/// Base for every screen. Generic on cubit [C] and state [S].
///
/// - [providers]: bloc providers to inject (usually the screen's own cubit).
/// - [buildContent]: the actual page content.
///
/// Wraps content with the [providers], an [EffectListener] for loading/error
/// UI, and a tap-outside-to-dismiss-keyboard gesture. Implements
/// [AutoRouteWrapper] so AutoRoute uses this wrapping automatically.
abstract class BasePage<C extends BaseCubit<S>, S> extends StatelessWidget
    implements AutoRouteWrapper {
  const BasePage({super.key});

  List<BlocProvider> get providers => const [];

  Widget buildContent(BuildContext context);

  @override
  Widget wrappedRoute(BuildContext context) => this;

  @override
  Widget build(BuildContext context) {
    final content = _TapOutsideUnfocus(child: Builder(builder: buildContent));

    final stack = Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [content, EffectListener<C>()],
    );

    if (providers.isEmpty) return stack;
    return MultiBlocProvider(providers: providers, child: stack);
  }
}

class _TapOutsideUnfocus extends StatelessWidget {
  const _TapOutsideUnfocus({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
          focus.unfocus();
        }
      },
      child: child,
    );
  }
}
