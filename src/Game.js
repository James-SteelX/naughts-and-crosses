'use strict';

function Game() {
  this.row_one =   ['-', '-', '-'];
  this.row_two =   ['-', '-', '-'];
  this.row_three = ['-', '-', '-'];
  this.turn = ['X', 'O'];
}

Game.prototype.makeMove = function (row, column) {
  var rowNum = this.rowSelection(row);
  rowNum[column -1] = this.turn[0];
};

Game.prototype.rowSelection = function (row) {
  if (row == 1) {
    return this.row_one;
  } else if (row == 2) {
    this.row_two;
  } else if (row == 3) {
    this.row_three;
  } else {
    throw new Error('This selection is invalid!');
  }
};
