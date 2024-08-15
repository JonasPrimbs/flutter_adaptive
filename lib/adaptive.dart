import 'dart:io';

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveAndroidMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) =>
    material;

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveIOSMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) =>
    cupertino ?? material;

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveMacOSMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) =>
    macos ?? cupertino ?? material;

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveWindowsMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) =>
    fluent ?? material;

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveLinuxMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) =>
    linux ?? material;

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveFuchsiaMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) =>
    material;

Function() Function({
  required Function() material,
  Function()? cupertino,
  Function()? fluent,
  Function()? macos,
  Function()? linux,
}) adaptiveMapper = ({
  required material,
  cupertino,
  fluent,
  macos,
  linux,
}) {
  if (Platform.isIOS) {
    return adaptiveIOSMapper(
      material: material,
      cupertino: cupertino,
      fluent: fluent,
      macos: macos,
      linux: linux,
    );
  } else if (Platform.isAndroid) {
    return adaptiveAndroidMapper(
      material: material,
      cupertino: cupertino,
      fluent: fluent,
      macos: macos,
      linux: linux,
    );
  } else if (Platform.isMacOS) {
    return adaptiveMacOSMapper(
      material: material,
      cupertino: cupertino,
      fluent: fluent,
      macos: macos,
      linux: linux,
    );
  } else if (Platform.isWindows) {
    return adaptiveWindowsMapper(
      material: material,
      cupertino: cupertino,
      fluent: fluent,
      macos: macos,
      linux: linux,
    );
  } else if (Platform.isLinux) {
    return adaptiveLinuxMapper(
      material: material,
      cupertino: cupertino,
      fluent: fluent,
      macos: macos,
      linux: linux,
    );
  } else if (Platform.isFuchsia) {
    return adaptiveFuchsiaMapper(
      material: material,
      cupertino: cupertino,
      fluent: fluent,
      macos: macos,
      linux: linux,
    );
  } else {
    return material;
  }
};

/// Gets a design based on the current platform.
///
/// Mapping from platform to design can be adjusted by replacing the
/// [adaptiveMapper] function.
T adaptive<T>({
  required T Function() material,
  T Function()? cupertino,
  T Function()? fluent,
  T Function()? macos,
  T Function()? linux,
}) {
  return adaptiveMapper(
    material: material,
    cupertino: cupertino,
    fluent: fluent,
    macos: macos,
    linux: linux,
  )();
}
