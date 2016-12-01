'use strict';

function Game() {
  this.row_one =   ['-', '-', '-'];
  this.row_two =   ['-', '-', '-'];
  this.row_three = ['-', '-', '-'];
  this.turn = ['X', 'O'];
}

Game.prototype.makeMove = function (row, column) {
  this.validColumn(column);
  var rowNum = this.rowSelection(row);
  this.filledSpace(rowNum, column);
  rowNum[column -1] = this.turn[0];
  this.gameOver();
  this.switchTurns();
};

Game.prototype.rowSelection = function (row) {
  if (row == 1) {
    return this.row_one;
  } else if (row == 2) {
    return this.row_two;
  } else if (row == 3) {
    return this.row_three;
  } else {
    throw new Error('This selection is invalid!');
  }
};

Game.prototype.filledSpace = function (row, column) {
  if (row[column -1] !== "-"){
    throw new Error('This space is already taken!');
  }
};

Game.prototype.validColumn = function (column) {
  if (column > 3) {
    throw new Error('This selection is invalid!');
  }
};

Game.prototype.switchTurns = function () {
  this.turn.reverse();
};

Game.prototype.gameOver = function () {
 if (this.row_one.includes("-") && this.row_two.includes("-") && this.row_three.includes("-")){
   return;
 } else {
   throw new Error('Game over!');
 }
};
