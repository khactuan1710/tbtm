/// Responsive-size hook. Every dimension in the design system is written as
/// `12.s`, `16.s`, … so a real scaling strategy can be plugged in later without
/// touching call sites. For now `.s` is an identity pass-through returning the
/// value as a [double]; it keeps the code visually aligned with the reference
/// architecture and makes future device scaling a one-line change here.
extension AppSizeExtension on num {
  double get s => toDouble();
}
