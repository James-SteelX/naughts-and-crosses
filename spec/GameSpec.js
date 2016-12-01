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
})
