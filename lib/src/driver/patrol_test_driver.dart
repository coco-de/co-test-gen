import 'package:co_test_gen/src/driver/test_driver.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Patrol-based [TestDriver] implementation.
///
/// Used in BDD Patrol E2E tests to share step functions with widget tests.
///
/// Requires `package:patrol` as a dependency in your project.
/// The `PatrolIntegrationTester` type is not imported here to avoid
/// a hard dependency on patrol; instead, it accepts `dynamic` and
/// uses duck typing for the patrol-specific API.
///
/// ```dart
/// patrolTest('login success', ($) async {
///   final driver = PatrolTestDriver($);
///   await iAmOnTheLoginPage(driver);
///   await iTapTheLoginButton(driver);
/// });
/// ```
///
/// **Note**: patrol API는 `Future<void>` 대신 `Future<PatrolFinder>` 등
/// 구체 타입을 반환합니다. `as Future<void>` 직접 캐스트는 런타임
/// `_TypeError: type 'Null' is not a subtype of type 'Future<void>'`를
/// 유발하므로, 반환값은 `Object?`로 받아 `await`만 수행합니다.
// ignore_for_file: avoid-dynamic
class PatrolTestDriver extends TestDriver {
  /// Creates a driver wrapping the Patrol tester [$].
  PatrolTestDriver(this.$);

  /// The underlying `PatrolIntegrationTester` instance.
  final dynamic $;

  @override
  Future<void> tap(Key key) async {
    final Object? future = ($ as dynamic).call(find.byKey(key)).tap();
    if (future is Future) await future;
  }

  @override
  Future<void> tapText(String text) async {
    final Object? future = ($ as dynamic).call(text).tap();
    if (future is Future) await future;
  }

  @override
  Future<void> enterText(Key key, String text) async {
    final descendant = find.descendant(
      of: find.byKey(key),
      matching: find.byType(EditableText),
    );
    final Object? future = descendant.evaluate().isNotEmpty
        ? ($ as dynamic).call(descendant.first).enterText(text)
        : ($ as dynamic).call(find.byKey(key)).enterText(text);
    if (future is Future) await future;
  }

  @override
  Future<void> expectVisible(Key key) async {
    expect(($ as dynamic).call(find.byKey(key)), findsOneWidget);
  }

  @override
  Future<void> expectTextVisible(String text) async {
    expect(($ as dynamic).call(text), findsWidgets);
  }

  @override
  Future<void> pumpWidget(Widget widget) async {
    final Object? future = ($ as dynamic).pumpWidgetAndSettle(widget);
    if (future is Future) await future;
  }

  @override
  Future<void> settle({Duration? timeout}) async {
    final Object? future = ($ as dynamic).pump(
      timeout ?? const Duration(seconds: 5),
    );
    if (future is Future) await future;
  }

  @override
  Future<void> wait(Duration duration) async {
    final Object? future = ($ as dynamic).pump(duration);
    if (future is Future) await future;
  }

  @override
  Future<void> pressHome() async {
    final Object? future = ($ as dynamic).native.pressHome();
    if (future is Future) await future;
  }

  @override
  Future<void> openNotifications() async {
    final Object? future = ($ as dynamic).native.openQuickSettings();
    if (future is Future) await future;
  }

  @override
  Future<void> pressBack() async {
    final Object? future = ($ as dynamic).native.pressBack();
    if (future is Future) await future;
  }
}
