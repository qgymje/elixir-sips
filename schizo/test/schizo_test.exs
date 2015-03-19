defmodule SchizoTest do
  use ExUnit.Case
  test "uppercase don't change the first word" do
    assert Schizo.uppercase("foo") == "foo"
  end

  test "uppercase change the second word" do
    assert Schizo.uppercase("foo bar") == "foo BAR"
  end

  test "uppercase change the rest words" do
     assert Schizo.uppercase("foo bar foo bar") == "foo BAR foo BAR"
    #assert 1 == 1
  end

  test "unvowel don't change the first word" do
    assert Schizo.unvowel("foo") == "foo"
  end

  test "unvowel change the second word" do
    assert Schizo.unvowel("foo bar") == "foo br"
  end

  test "unvowel change the rest words" do
     assert Schizo.unvowel("foo bar some hello") == "foo br some hll"
    #assert 1 == 1
  end


end
