# Changelog

## [0.2.0](https://github.com/coco-de/co-test-gen/compare/v0.1.2...v0.2.0) (2026-07-28)


### 기능

* ✨ defaultTarget 옵션 — 실행할 수 없는 산출물 생성 차단 ([#10](https://github.com/coco-de/co-test-gen/issues/10)) ([c02f69d](https://github.com/coco-de/co-test-gen/commit/c02f69d78070d227763be2b0d3617136fcd67baa))

## [0.1.2](https://github.com/coco-de/co-test-gen/compare/v0.1.1...v0.1.2) (2026-07-21)


### 버그 수정

* **barrel:** 🐛 런타임 배럴에서 build-time generator export 제거 ([#4](https://github.com/coco-de/co-test-gen/issues/4)) ([9025090](https://github.com/coco-de/co-test-gen/commit/9025090de2d702d79fbb3f36bf563dc6186f48f3))

## 0.1.0

- Initial release
- Gherkin `.feature` parser with `@widget-only`, `@patrol-only`, `@both` tags
- `DualTestBuilder` — generates `.widget_test.dart` + `.patrol_test.dart` from `.feature`
- `TestDriver` — abstract interface for shared BDD step functions
- `WidgetTestDriver` — `WidgetTester` adapter
- `PatrolTestDriver` — `PatrolIntegrationTester` adapter (no hard dependency on patrol)
