import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FestivalCalendar extends StatefulWidget {
  const FestivalCalendar({Key? key}) : super(key: key);

  @override
  State<FestivalCalendar> createState() => _FestivalCalendarState();
}

class _FestivalCalendarState extends State<FestivalCalendar> {
  int selectedMonth = DateTime.now().month - 1;
  
  final List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final Map<int, List<Map<String, dynamic>>> festivals = {
    2: [
      {'name': 'Maha Shivratri', 'date': 18, 'discount': '15% OFF'},
    ],
    3: [
      {'name': 'Holi', 'date': 25, 'discount': '20% OFF'},
      {'name': 'Ugadi', 'date': 30, 'discount': '25% OFF'},
    ],
    8: [
      {'name': 'Ganesha Chaturthi', 'date': 19, 'discount': '30% OFF'},
    ],
    9: [
      {'name': 'Onam', 'date': 15, 'discount': '25% OFF'},
    ],
    10: [
      {'name': 'Dussehra', 'date': 12, 'discount': '20% OFF'},
      {'name': 'Diwali', 'date': 31, 'discount': '35% OFF'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Month selector
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: months.length,
              itemBuilder: (context, index) {
                final isSelected = selectedMonth == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMonth = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF1565C0) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      months[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          
          // Festival list for selected month
          _buildFestivalList(),
        ],
      ),
    );
  }

  Widget _buildFestivalList() {
    final monthFestivals = festivals[selectedMonth + 1] ?? [];
    
    if (monthFestivals.isEmpty) {
      return Container(
        height: 80.h,
        child: Center(
          child: Text(
            'No festivals this month',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
      );
    }

    return Column(
      children: monthFestivals.map((festival) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange.withOpacity(0.1),
                Colors.red.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.orange.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    festival['date'].toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      festival['name'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Travel on ${festival['date']} ${months[selectedMonth]}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  festival['discount'],
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
