require "rspec"
require "tdd"

describe Array do

  describe "#my_uniq" do
    let(:array1) { Array.new([1,2,1,3,3]) }
    let(:array2) { Array.new([3, 3, 1, 1, 2, 2]) }

    it "returns array with no dups" do
      expect(array1.my_uniq).to eq([1,2,3])
    end

    it "returns non-dups in same order" do
      expect(array2.my_uniq).to eq([3, 1, 2])
    end

    it "returns a new array i.e. different object" do
      expect(array1.my_uniq).not_to be(:array)
    end
  end

  describe "#two_sum" do
    let(:array1) { Array.new([-1, 0, 2, -2, 1]) }
    let(:array2) { Array.new([-1, 0, 1, 1]) }

    it "returns index pairs for all elements that sum to zero" do
      expect(array1.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns index pairs in order where smaller x coordinate comes first" do
      expect(array1.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "assuming two pairs have same x coordinates, returns pair with smaller y coordinate first" do
      expect(array2.two_sum).to eq([[0, 2], [0, 3]])
    end

  end

  describe "#my_transpose" do
    let(:array1) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    let(:array2) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }

    it "transposes arrays of rows into arrays of columns" do
      expect(array1.my_transpose).to eq(array2)
    end

    it "returns same number of column arrays as row arrays" do
      expect(array1.my_transpose.count).to eq(array1.count)
    end
  end

end # describe Array end

describe StockPicker do

  describe "#pick_stock" do
    let(:stock_picker) { StockPicker.new([100, 1, 15, 99, 60])}
    let(:best_day_pair) { [1,3] }

    it "returns most profitable pair" do
      expect(stock_picker.pick_stock).to eq(best_day_pair)
    end

    it "buy low sell high, not buy high sell low (best day pair must be in ascending order)" do
      expect(stock_picker.pick_stock).to eq(best_day_pair)
    end
  end

end

describe Towers do
  subject(:game) {Towers.new}

  describe "#initialize" do
    it "initializes with an array with 3 arrays, the first containing 3,2,1" do
      expect(game.towers).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    let(:game_in_progress) { Towers.new([[3], [1], [2]]) }

    context "invalid move" do
      it "game will not allow you to move a large disk onto small disk" do
        expect { game_in_progress.move(0, 2) }.to raise_error("invalid move!")
      end

      it "raises an error if arguments are not 0 through 2" do
        start_tower = "a"
        end_tower = 1
        expect { game_in_progress.move(start_tower, end_tower) }.to raise_error(ArgumentError)
      end
    end

    context "valid move" do
      it "allowed to move piece into empty array" do
        game.move(0, 1)
        expect(game.towers).to eq([[3, 2], [1], []])
      end

      it "allowed to move smaller piece onto a larger piece" do
        game_in_progress.move(1, 2)
        expect(game_in_progress.towers).to eq([[3], [], [2, 1]])
      end
    end
  end

  describe "#won?" do
    let(:won_game1) { Towers.new([[], [], [3, 2, 1]]) }
    let(:won_game2) { Towers.new([[], [3, 2, 1], []]) }

    context "winning conditions" do
      it "it returns true if all three pieces are in array two" do
        expect(won_game1.won?).to be(true)
      end

      it "it returns true if all three pieces are in array three" do
        expect(won_game2.won?).to be(true)
      end

    end

    context "not winning conditions" do

      it "it returns false if all three pieces are not in array two or in array three" do
        expect(game.won?).to be(false)
      end

    end

  end


end
