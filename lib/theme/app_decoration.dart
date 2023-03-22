import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';
import '../core/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get outlineCyan600 => BoxDecoration(
        color: ColorConstant.blueGray90001,
        border: Border.all(
          color: ColorConstant.cyan600,
          width: getHorizontalSize(
            3.00,
          ),
        ),
      );
  static BoxDecoration get outlineCyan600011 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.cyan60001,
          width: getHorizontalSize(
            3.00,
          ),
        ),
      );
  static BoxDecoration get fillRedA20033 => BoxDecoration(
        color: ColorConstant.redA20033,
      );
  static BoxDecoration get fillGreen40033 => BoxDecoration(
        color: ColorConstant.green40033,
      );
  static BoxDecoration get fillTeal900 => BoxDecoration(
        color: ColorConstant.teal900,
      );
  static BoxDecoration get txtFillCyan60001 => BoxDecoration(
        color: ColorConstant.cyan60001,
      );
  static BoxDecoration get fillCyan60001 => BoxDecoration(
        color: ColorConstant.cyan60001,
      );
  static BoxDecoration get txtFillCyan600 => BoxDecoration(
        color: ColorConstant.cyan600,
      );
  static BoxDecoration get outlineIndigoA20014 => BoxDecoration(
        color: ColorConstant.teal90001,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.indigoA20014,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
        color: ColorConstant.blueGray90001,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientGray8000001Gray90096 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.gray8000001,
            ColorConstant.blueGray90059,
            ColorConstant.gray90096,
          ],
        ),
      );
  static BoxDecoration get fillBluegray90001 => BoxDecoration(
        color: ColorConstant.blueGray90001,
      );
  static BoxDecoration get fillCyan600 => BoxDecoration(
        color: ColorConstant.cyan600,
      );
  static BoxDecoration get txtFillBluegray90001 => BoxDecoration(
        color: ColorConstant.blueGray90001,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: ColorConstant.gray900,
      );
  static BoxDecoration get fillBlack900b2 => BoxDecoration(
        color: ColorConstant.black900B2,
      );
  static BoxDecoration get fillGray800 => BoxDecoration(
        color: ColorConstant.gray800,
      );
  static BoxDecoration get outlineBlack90014 => BoxDecoration(
        color: ColorConstant.blueGray90001,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90014,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientGray8000001Gray90002 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.78,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.gray8000001,
            ColorConstant.gray90002,
          ],
        ),
      );
  static BoxDecoration get outlineGray8002 => BoxDecoration(
        color: ColorConstant.blueGray90002,
        border: Border.all(
          color: ColorConstant.gray800,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get outlineGray8001 => BoxDecoration(
        color: ColorConstant.gray90001,
        border: Border.all(
          color: ColorConstant.gray800,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineGray800 => BoxDecoration(
        color: ColorConstant.blueGray90001,
        border: Border.all(
          color: ColorConstant.gray800,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtOutlineCyan60001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.cyan60001,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
  static BoxDecoration get outlineCyan60001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.cyan60001,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
  static BoxDecoration get gradientGray80000Bluegray900 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.gray80000,
            ColorConstant.blueGray900,
          ],
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderBL36 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        36.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        36.00,
      ),
    ),
  );

  static BorderRadius customBorderTL40 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        40.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        40.00,
      ),
    ),
  );

  static BorderRadius txtCircleBorder19 = BorderRadius.circular(
    getHorizontalSize(
      19.00,
    ),
  );

  static BorderRadius circleBorder29 = BorderRadius.circular(
    getHorizontalSize(
      29.00,
    ),
  );

  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius roundedBorder49 = BorderRadius.circular(
    getHorizontalSize(
      49.00,
    ),
  );

  static BorderRadius roundedBorder36 = BorderRadius.circular(
    getHorizontalSize(
      36.00,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius circleBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40.00,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );

  static BorderRadius roundedBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );

  static BorderRadius circleBorder70 = BorderRadius.circular(
    getHorizontalSize(
      70.00,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius circleBorder61 = BorderRadius.circular(
    getHorizontalSize(
      61.00,
    ),
  );
}
