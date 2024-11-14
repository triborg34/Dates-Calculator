import 'package:flutter_test/flutter_test.dart';

void main() {
  // Function to calculate date differences
  Map<String, dynamic> calculateDateDifference(DateTime startDate, DateTime endDate) {
    int totalDays = endDate.difference(startDate).inDays;

    int years = endDate.year - startDate.year;
    int months = endDate.month - startDate.month;
    int days = endDate.day - startDate.day;

    if (days < 0) {
      months -= 1;
      days += DateTime(endDate.year, endDate.month, 0).day;
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    int totalMonths = years * 12 + months;
    int weeks = totalDays ~/ 7;
    int remainingDays = totalDays % 7;

    return {
      'totalDays': totalDays,
      'years': years,
      'months': months,
      'days': days,
      'totalMonths': totalMonths,
      'weeks': weeks,
      'remainingDays': remainingDays,
    };
  }

  test('Date difference calculation works correctly', () {
    // Define test inputs
    DateTime startDate = DateTime(2000, 3, 12);
    DateTime endDate = DateTime(2024, 11, 14);

    // Expected outputs
    const expected = {
      'totalDays': 9013,
      'years': 24,
      'months': 8,
      'days': 2,
      'totalMonths': 296,
      'weeks': 1287,
      'remainingDays': 4,
    };

    // Call the function
    final result = calculateDateDifference(startDate, endDate);

    // Assertions
    expect(result['totalDays'], expected['totalDays']);
    expect(result['years'], expected['years']);
    expect(result['months'], expected['months']);
    expect(result['days'], expected['days']);
    expect(result['totalMonths'], expected['totalMonths']);
    expect(result['weeks'], expected['weeks']);
    expect(result['remainingDays'], expected['remainingDays']);
  });
}
