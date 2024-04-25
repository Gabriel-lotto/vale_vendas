import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 230.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300]!,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Container(width: 17.w),
                              SizedBox(
                                width: 143.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 14.0,
                                      color: Colors.grey[300]!,
                                    ),
                                    Container(height: 4.h),
                                    Container(
                                      width: double.infinity,
                                      height: 14.0,
                                      color: Colors.grey[300]!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 12.h),
                      ],
                    ),
                    SizedBox(
                      width: 270.w,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.w,
                                height: 14.0,
                                color: Colors.grey[300]!,
                              ),
                              Container(height: 4.h),
                              Container(
                                width: 100.w,
                                height: 14.0,
                                color: Colors.grey[300]!,
                              ),
                            ],
                          ),
                          Container(width: 30.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 14.0,
                                  color: Colors.grey[300]!,
                                ),
                                Container(height: 4.h),
                                Container(
                                  width: double.infinity,
                                  height: 14.0,
                                  color: Colors.grey[300]!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 10),
                        child: Container(
                          width: 60.w,
                          height: 18.h,
                          color: Colors.grey[300]!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120.w,
                    height: 14.0,
                    color: Colors.grey[300]!,
                  ),
                  Container(width: 4.w),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    color: Colors.grey[300]!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
