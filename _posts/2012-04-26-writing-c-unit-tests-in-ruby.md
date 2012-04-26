---
layout: post
title: "Writing C Unit Tests in Ruby"
description: ""
category: 
tags: []
---
{% include JB/setup %}

Let's say you usually code in Ruby, and your company and its build systems are
built around Rakefiles and the like. Today you've written some C code, and you
want to add unit tests. In this blog post, I present a method of writing those
C unit tests in Ruby using [FFI](http://github.com/ffi/ffi) and
[RSpec](http://rspec.info/).

First, compile your C code as position independent and symbols exported. This allows you to dlopen() the executable:

{% highlight bash %}
gcc -pie -rdynamic -o foo foo.c
{% endhighlight %}


Next, add the 'ffi' gem to your Gemset. Then write your rspec tests:

{% highlight ruby %}
#!/usr/bin/env ruby
$: << File.join(File.dirname(__FILE__))
require 'ffi'

# This module is your bridge from Ruby to C and back
module FOO
  extend FFI::Library

  # Use an absolute path to the executable under test, otherwise ffi will search LD_LIBRARY_PATH.
  ffi_lib File.absolute_path(File.join(File.dirname(__FILE__), "..", "foo"))

  # Function signatures for each function to be tested
  attach_function :foo_count_letters, [:string, :pointer], :int
end

describe "unit tests for foo.c" do
  before(:each) do
  end

  it "should really foo" do
    # This function takes a pointer-to-uint32 out-param
    out = FFI::MemoryPointer.new :uint32

    res = FOO.foo_count_letters("Hello", out)

    # Read back the pointers to Ruby data types, then use rspec's verification functions
    out.get_uint32(0).should == 5
    res.should == 1
  end
end
{% endhighlight %}

I'm excited about this approach because the tests run under 'rspec' along with the rest of your spec tests.
