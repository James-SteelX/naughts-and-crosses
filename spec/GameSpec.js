'use strict';

describe('Game', function(){

  var game;

  beforeEach(function(){
    game = new Game();
  });

  it('Starts with a blank board', function(){
    expect(game.row_one).not.toContain('X', 'O');
    expect(game.row_two).not.toContain('X', 'O');
    expect(game.row_three).not.toContain('X', 'O');
  });

  it('Changes the board if its a valid move', function(){
    game.makeMove(1, 1);
    expect(game.row_one[0]).toBe('X')
  })

  it('Doesnt let player select invalid row', function(){
    expect(function() { game.makeMove(5, 1); }).toThrowError('This selection is invalid!');
  });

  it('Doesnt let player select invalid column', function(){
    expect(function() { game.makeMove(2, 5); }).toThrowError('This selection is invalid!');
  });

  it('Swaps turns after play has moved', function(){
    game.makeMove(1, 1);
    game.makeMove(1, 2);
    expect(game.row_one[1]).toBe('O')
  });
  describe('Game over, no winner', function(){

   beforeEach(function(){
     game.row_one =   ['X', 'O', 'X'];
     game.row_two =   ['O', 'X', 'O'];
     game.row_three = ['X', '-', 'O'];
   });

   it('ends the game when no more spaces left', function(){
     expect(function() { game.makeMove(3, 2); }).toThrowError('Game over!');
   });
  });
})
