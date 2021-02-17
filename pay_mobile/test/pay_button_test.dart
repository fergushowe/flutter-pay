import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_mobile/pay_mobile.dart';

const _defaultButtonHeight = 43;

void main() {
  setUp(() async {});

  group('Button style:', () {
    testWidgets('defaults to type black and long', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
          textDirection: TextDirection.ltr,
          child: GooglePayButton(onPressed: () => null)));

      expect(
          find.byWidgetPredicate((widget) =>
              widget is RawMaterialButton && widget.fillColor == Colors.black),
          findsOneWidget);

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('height defaults to 43 as specified in the brand guidelines',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
          textDirection: TextDirection.ltr,
          child: Center(child: GooglePayButton(onPressed: () => null))));

      final Size buttonSize = tester.getSize(find.byType(RawMaterialButton));
      expect(buttonSize.height, _defaultButtonHeight);
    });
  });
}
