import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Style/strings.dart';
import 'package:task_manager_app/Widgets/HomePage/AddTask/add_task_controller.dart';

void main() {
  group('AddTaskController Input Validation', () {
    late AddTaskController controller;

    setUp(() {
      controller = Get.put(AddTaskController());
    });

    tearDown(() {
      Get.delete<AddTaskController>();
    });

    testWidgets('Empty input should return validation error',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: controller.formstate,
              child: Column(
                children: [
                  TextFormField(
                      onSaved: (value) => controller.todo = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return validationError;
                        }
                        return null;
                      }),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.formstate.currentState!.validate()) {
                      }
                    },
                    child: Text('Validate'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Validate'));
      await tester.pump();

      expect(find.text('This field is required'), findsOneWidget);
    });

    testWidgets('Non-empty input should pass validation',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: controller.formstate,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) => controller.todo = value ?? 'Hello',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return validationError;
                        }
                        return null;
                      }
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.formstate.currentState!.validate()) {
                        //controller.onClickAdd();
                      }
                    },
                    child: Text('Validate'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'New Task');
      await tester.tap(find.text('Validate'));
      await tester.pump();

      expect(find.text('This field is required'), findsNothing);
    });
  });
}
