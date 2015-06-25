require "spec_helper"
require "rcs-common/lazy_open_struct"

describe LazyOpenStruct do

  describe "internal attributes" do

    let(:subject) { described_class.new(foo: 1, bar: "hello") }

    it 'can be accessed with methods' do
      expect(subject.foo).to eq(1)
      expect(subject.bar).to eq("hello")
    end

    it 'can be accessed with [] (with symbols)' do
      expect(subject[:foo]).to eq(1)
      expect(subject[:bar]).to eq("hello")
    end

    it 'can be accessed with [] (with strings)' do
      expect(subject["foo"]).to eq(1)
      expect(subject["bar"]).to eq("hello")
    end
  end

  describe "internal lambda attributes" do

    let(:subject) { described_class.new(foo: lambda { "bar" }) }

    it 'are resolved when accessed with methods' do
      expect(subject.foo).to eq("bar")
    end

    it 'are resolved when accessed with [] (using symbols)' do
      expect(subject[:foo]).to eq("bar")
    end

    it 'are resolved when accessed with [] (using strings)' do
      expect(subject["foo"]).to eq("bar")
    end
  end

  context "when accessing missing attributes with methods" do

    let(:subject) { described_class.new(foo: "bar") }

    it "raises an error" do
      expect { subject.bar }.to raise_error
    end
  end

  describe "question-mark methods" do

    let(:subject) { described_class.new(foo: "bar") }

    context "when used agains an existing attribute" do

      it("returns a truthy value") { expect(subject.foo?).to be_truthy }
    end

    context "when used agains a missing attribute" do

      it("does not return a truthy value") { expect(subject.bar?).not_to be_truthy }
    end
  end
end
