import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_progress_indicator/gradient_progress_indicator.dart';

void main() {
  testWidgets('should build without exploding', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const GradientProgressIndicator(
            gradientColors: [
              Colors.black,
              Colors.white,
            ],
            gradientStops: [
              0.25,
              0.75,
            ],
            radius: 40,
            strokeWidth: 4,
            child: Text('Loading...'),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 4));

    expect(find.byType(GradientProgressIndicator), findsOneWidget);
  });

  testWidgets('should build without exploding without gradient colors',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const GradientProgressIndicator(
            gradientColors: [],
            gradientStops: [],
            radius: 40,
            strokeWidth: 4,
            child: Text('Loading...'),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 4));

    // assert
    expect(find.byType(GradientProgressIndicator), findsOneWidget);
  });

  testWidgets('should build without exploding with background color',
      (tester) async {
    // arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const GradientProgressIndicator(
            gradientColors: [],
            gradientStops: [],
            radius: 40,
            strokeWidth: 4,
            backgroundColor: Colors.red,
            child: Text('Loading...'),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 4));

    expect(find.byType(GradientProgressIndicator), findsOneWidget);
  });
}
