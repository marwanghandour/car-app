import 'package:car_app/core/utils/contants.dart';
import 'package:car_app/Features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
   const CustomTabBar({super.key, required this.product});
   final CarEntity product;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Features'),
              Tab(text: 'Designs'),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
               Padding(
                 padding: AppConstants.screenPadding,
                 child: OverflowBar(
                  overflowAlignment: OverflowBarAlignment.center,
                  alignment: MainAxisAlignment.center,
                   children: [
                     Text(
                      '${product.bodyStyle} ${product.bodyType} ${product.condition} ${product.displayColor} ${product.state} ${product.trim} ${product.vin}'
                      ),
                      
                   ],
                 ),
               ),
                const Padding(
                  padding: AppConstants.screenPadding,
                  child: Text('Performance Engine: Experience impressive power and acceleration with an engine designed for efficiency and speed, delivering a smooth yet thrilling driving experience Advanced Safety Systems: Equipped with cutting-edge driver-assistance technologies, including adaptive cruise control, lane-keeping assist, automatic emergency braking, and a 360-degree camera system for enhanced safety on the road. Premium Interior Design: A spacious and meticulously crafted cabin that blends comfort with sophistication. Features include high-quality upholstery, ambient lighting, and ergonomic seating for both the driver and passengers. Infotainment System: Stay connected with an intuitive touchscreen display, smartphone integration (via Apple CarPlay and Android Auto), voice recognition, and an advanced sound system for an immersive multimedia experience'),
                ),      

            
                const Center(
                  child: Text('kdjflak'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


