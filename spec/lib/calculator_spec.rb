require 'rspec'
require './lib/calculator'

describe Calculator do
  describe ".total" do
    it "should be 0 on a new calculator" do
      expect(subject.total).to eq(0)
    end
  end

  describe ".add" do
    it "should add a number to the total" do
      subject.add(5)
      expect(subject.total).to eq(5)
    end

    it "should add numbers to the total" do
      subject.add(5).add(2)
      expect(subject.total).to eq(7)
    end

    it "should handle negative numbers" do
      subject.add(-2)
      expect(subject.total).to eq(-2)

      subject.add(5).add(-27).add(10).add(-12)
      expect(subject.total).to eq(-26)
    end

    it "should handle floats" do
      subject.add(2.5)
      expect(subject.total).to eq(2.5)

      subject.add(-3.1).add(4.5).add(-31.257)
      expect(subject.total).to be_within(0.0001).of(-27.357)
    end
  end

  describe ".subtract" do
    it "should subtract a number from the total" do
      subject.subtract(5)
      expect(subject.total).to eq(-5)
    end

    it "should subtract numbers from the total" do
      subject.subtract(5).subtract(2)
      expect(subject.total).to eq(-7)
    end

    it "should handle negative numbers" do
      subject.subtract(-2)
      expect(subject.total).to eq(2)

      subject.subtract(5).subtract(-27).subtract(10).subtract(-12)
      expect(subject.total).to eq(26)
    end

    it "should handle floats" do
      subject.subtract(2.5)
      expect(subject.total).to eq(-2.5)

      subject.subtract(-3.1).subtract(4.5).subtract(-31.257)
      expect(subject.total).to be_within(0.0001).of(27.357)
    end
  end

  describe ".multiply" do
    it "should return zero if the current value is nil" do
      subject.multiply(5)
      expect(subject.total).to eq(0)
    end

    it "should return zero if the current value is multiplied by zero" do
      subject.add(7).multiply(0)
      expect(subject.total).to eq(0)
    end

    it "should multiply numbers against the running total" do
      subject.add(1).multiply(5).multiply(2)
      expect(subject.total).to eq(10)
    end

    it "should handle negative numbers" do
      subject.add(10).multiply(-2)
      expect(subject.total).to eq(-20)

      subject.multiply(-4).multiply(10).multiply(8)
      expect(subject.total).to eq(6400)
    end

    it "should handle floats" do
      subject.add(1).multiply(2.5)
      expect(subject.total).to eq(2.5)

      subject.multiply(4.5).multiply(-31.257)
      expect(subject.total).to be_within(0.0001).of(-351.64125)
    end
  end


  describe ".divide" do
    it "should return zero if the current value is nil" do
      subject.divide(5)
      expect(subject.total).to eq(0)
    end

    it "should return zero if the current value is multiplied by zero" do
      expect {(subject.divide(0)).to}.should raise_error(ZeroDivisionError)
    end

    it "should divide numbers against the running total" do
      subject.add(10).divide(5).divide(2)
      expect(subject.total).to be_within(0.0001).of(1)
    end

    it "should handle negative numbers" do
      subject.add(10).divide(-2)
      expect(subject.total).to eq(-5)

      subject.divide(-4).divide(10).divide(8)
      expect(subject.total).to eq(0)
    end

    it "should handle floats" do
      subject.add(1).divide(2.5)
      expect(subject.total).to eq(0.4)

      subject.divide(4.5).divide(-31.257)
      expect(subject.total).to be_within(0.0001).of(-0.00284380)
    end
  end


  describe ".sqrt" do
    it "should return zero for a sqrt of 0" do
      subject.sqrt(0)
      expect(subject.total).to eq(0)
    end

    it "should return an Error for the square root of any negative number" do
      expect {(subject.sqrt(-5))}.should raise_error(Math::DomainError)
    end

    it "should the square root of an integer number resulting in an integer" do
      subject.sqrt(4)
      expect(subject.total).to eq(2)
    end

    it "should the square root of an integer number resulting in a float" do
      subject.sqrt(5)
      expect(subject.total).to be_within(0.0001).of(2.2360680)
    end

    it "should handle square roots of floats" do
      subject.sqrt(0.75)
      expect(subject.total).to be_within(0.0001).of(0.8660254)

      subject.sqrt(4.25)
      expect(subject.total).to be_within(0.0001).of(2.0615528)
    end
  end

end



