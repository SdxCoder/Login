import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen {
  final BuildContext context;
  AppBar _appBar;

  var _width;
  var _height;
  var _oreintation;
  var _blockWidth;
  var _blockHeight;
  var _horizontalPadding;
  var _verticalPadding;
  var _horizontalMargin;
  var _verticalMargin;

  var _fontSize;

  var _heightExcludingAppBar;
  var _paddingExcludingAppBar;
  var _marginExcludingAppBar;
  var _fontsizeExcludingAppBar;

  double _row1;
  var _row2;
  var _row3;
  var _row4;
  var _row5;
  var _row6;
  var _row7;
  var _row8;
  var _row9;
  var _row10;
  var _row11;
  var _row12;

  var _col1;
  var _col2;
  var _col3;
  var _col4;
  var _col5;
  var _col6;
  var _col7;
  var _col8;
  var _col9;
  var _col10;
  var _col11;
  var _col12;

  double get row_1 => _row1;
  get row_2 => _row2;
  get row_3 => _row3;
  get row_4 => _row4;
  get row_5 => _row5;
  get row_6 => _row6;
  get row_7 => _row7;
  get row_8 => _row8;
  get row_9 => _row9;
  get row_10 => _row10;
  get row_11 => _row11;
  get row_12 => _row12;

  get col_1 => _col1;
  get col_2 => _col2;
  get col_3 => _col3;
  get col_4 => _col4;
  get col_5 => _col5;
  get col_6 => _col6;
  get col_7 => _col7;
  get col_8 => _col8;
  get col_9 => _col9;
  get col_10 => _col10;
  get col_11 => _col11;
  get col_12 => _col12;

  get width => _width;

  get height => _height;

  get oreintation => _oreintation;

  get blockWidth => _blockWidth;

  get blockHeight => _blockHeight;

  get horizontalPadding => _horizontalPadding;

  get verticalPadding => _verticalPadding;

  get horizontalMargin => _horizontalMargin;

  get verticalMargin => _verticalMargin;

  get fontsize => _fontSize;

  get heightEx => _heightExcludingAppBar;

  get paddingEx => _paddingExcludingAppBar;

  get marginEx => _marginExcludingAppBar;

  get fontsizeEx => _fontsizeExcludingAppBar;

  Screen(this.context, this._appBar) {
    _width = MediaQuery.of(context).size.width;

    _height = MediaQuery.of(context).size.height - _appBar.preferredSize.height;

    _oreintation = MediaQuery.of(context).orientation;
  
    _calculateFlexibleGrid();

  }

  Screen.withoutAppBar(this.context){
    _width = MediaQuery.of(context).size.width;

    _height = MediaQuery.of(context).size.height;

    _oreintation = MediaQuery.of(context).orientation;

    _calculateFlexibleGrid();

  }

  _calculateFlexibleGrid(){

    _blockHeight = _height/12;
    _blockWidth = _width/12;

    _horizontalPadding = 1/_width;
    _verticalPadding = 1/_height;

    _horizontalMargin = 1/_width;
    _verticalMargin = 1/_height;

    _row1 = blockHeight;
    _row2 = blockHeight * 2;
    _row3 = blockHeight * 3;
    _row4 = blockHeight * 4;
    _row5 = blockHeight * 5;
    _row6 = blockHeight * 6;
    _row7 = blockHeight * 7;
    _row8 = blockHeight * 8;
    _row9 = blockHeight * 9;
    _row10 = blockHeight * 10;
    _row11 = blockHeight * 11;
    _row12 = blockHeight * 12;

    _col1 = blockWidth;
    _col2 = blockWidth * 2;
    _col3 = blockWidth * 3;
    _col4 = blockWidth * 4;
    _col5 = blockWidth * 5;
    _col6 = blockWidth * 6;
    _col7 = blockWidth * 7;
    _col8 = blockWidth * 8;
    _col9 = blockWidth * 9;
    _col10 = blockWidth * 10;
    _col11 = blockWidth * 11;
    _col12 = blockWidth * 12;
    
  }
}
