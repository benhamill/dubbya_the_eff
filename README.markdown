# The Test
It looks like bundler is doing something funky with Object when doing `bundle exec rspec` compared to just `rspec`. Behold:

    $ rvm info

    ruby-1.9.2-p136@dubbya_the_eff:

      system:
        uname:       "Linux Hermes 2.6.35-25-generic #44-Ubuntu SMP Fri Jan 21 17:40:48 UTC 2011 i686 GNU/Linux"
        bash:        "/bin/bash => GNU bash, version 4.1.5(1)-release (i686-pc-linux-gnu)"
        zsh:         " => not installed"

      rvm:
        version:      "rvm 1.2.5 by Wayne E. Seguin (wayneeseguin@gmail.com) [http://rvm.beginrescueend.com/]"

      ruby:
        interpreter:  "ruby"
        version:      "1.9.2p136"
        date:         "2010-12-25"
        platform:     "i686-linux"
        patchlevel:   "2010-12-25 revision 30365"
        full_version: "ruby 1.9.2p136 (2010-12-25 revision 30365) [i686-linux]"

      homes:
        gem:          "/home/ben/.rvm/gems/ruby-1.9.2-p136@dubbya_the_eff"
        ruby:         "/home/ben/.rvm/rubies/ruby-1.9.2-p136"

      binaries:
        ruby:         "/home/ben/.rvm/rubies/ruby-1.9.2-p136/bin/ruby"
        irb:          "/home/ben/.rvm/rubies/ruby-1.9.2-p136/bin/irb"
        gem:          "/home/ben/.rvm/rubies/ruby-1.9.2-p136/bin/gem"
        rake:         "/home/ben/.rvm/gems/ruby-1.9.2-p136@global/bin/rake"

      environment:
        PATH:         "/home/ben/.rvm/gems/ruby-1.9.2-p136@dubbya_the_eff/bin:/home/ben/.rvm/gems/ruby-1.9.2-p136@global/bin:/home/ben/.rvm/rubies/ruby-1.9.2-p136/bin:/home/ben/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
        GEM_HOME:     "/home/ben/.rvm/gems/ruby-1.9.2-p136@dubbya_the_eff"
        GEM_PATH:     "/home/ben/.rvm/gems/ruby-1.9.2-p136@dubbya_the_eff:/home/ben/.rvm/gems/ruby-1.9.2-p136@global"
        MY_RUBY_HOME: "/home/ben/.rvm/rubies/ruby-1.9.2-p136"
        IRBRC:        "/home/ben/.rvm/rubies/ruby-1.9.2-p136/.irbrc"
        RUBYOPT:      "rubygems"
        gemset:       "dubbya_the_eff"


    $ gem list

    *** LOCAL GEMS ***

    bundler (1.0.10)
    interactive_editor (0.0.6)
    rake (0.8.7)
    spoon (0.0.1)

    $ bundle install
    Fetching source index for http://rubygems.org/
    Installing diff-lcs (1.1.2)
    Installing rspec-core (2.5.1)
    Installing rspec-expectations (2.5.0)
    Installing rspec-mocks (2.5.0)
    Installing rspec (2.5.0)
    Using bundler (1.0.10)
    Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

    $ gem list

    *** LOCAL GEMS ***

    bundler (1.0.10)
    diff-lcs (1.1.2)
    interactive_editor (0.0.6)
    rake (0.8.7)
    rspec (2.5.0)
    rspec-core (2.5.1)
    rspec-expectations (2.5.0)
    rspec-mocks (2.5.0)
    spoon (0.0.1)

    $ bundle exec rspec --color example_spec.rb
    [:!, :!=, :!~, :<, :<=, :<=>, :==, :===, :=~, :>, :>=, :__id__, :__send__, :allocate,
    :ancestors, :as_null_object, :autoload, :autoload?, :class, :class_eval, :class_exec,
    :class_variable_defined?, :class_variable_get, :class_variable_set, :class_variables, :clone,
    :const_defined?, :const_get, :const_missing, :const_set, :constants, :debugger,
    :define_singleton_method, :describe, :display, :dup, :enum_for, :eql?, :equal?, :extend,
    :freeze, :frozen?, :gem, :hash, :include?, :included_modules, :initialize_clone,
    :initialize_dup, :inspect, :instance_eval, :instance_exec, :instance_method, :instance_methods,
    :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set,
    :instance_variables, :is_a?, :kind_of?, :method, :method_defined?, :methods, :module_eval,
    :module_exec, :name, :new, :nil?, :null_object?, :object_id, :pretty_inspect, :pretty_print,
    :pretty_print_cycle, :pretty_print_inspect, :pretty_print_instance_variables,
    :private_class_method, :private_instance_methods, :private_method_defined?, :private_methods,
    :protected_instance_methods, :protected_method_defined?, :protected_methods,
    :public_class_method, :public_instance_method, :public_instance_methods, :public_method,
    :public_method_defined?, :public_methods, :public_send, :received_message?,
    :remove_class_variable, :respond_to?, :respond_to_missing?, :rspec_reset, :rspec_verify, :send,
    :share_as, :share_examples_for, :shared_examples_for, :should, :should_not, :should_not_receive,
    :should_receive, :singleton_class, :singleton_methods, :stub, :stub!, :stub_chain, :superclass,
    :syck_to_yaml, :syck_yaml_as, :taguri, :taguri=, :taint, :tainted?, :tap, :to_enum, :to_s,
    :to_yaml, :to_yaml_properties, :to_yaml_style, :trust, :unstub, :unstub!, :untaint, :untrust,
    :untrusted?, :yaml_as, :yaml_tag_class_name, :yaml_tag_read_class, :yaml_tag_subclasses?]
    [:already_tested]
    F

    Failures:

      1) Example should write to a given file
         Failure/Error: already_tested
         NoMethodError:
           undefined method `already_tested' for #<ExampleHolder:0x8e0e5e0>
         # ./example_spec.rb:3:in `to_yaml'
         # ./example_spec.rb:20:in `block (2 levels) in <top (required)>'

    Finished in 0.01001 seconds
    1 example, 1 failure

    $ rspec --color example_spec.rb
    [:!, :!=, :!~, :<, :<=, :<=>, :==, :===, :=~, :>, :>=, :__id__, :__send__, :allocate,
    :ancestors, :as_null_object, :autoload, :autoload?, :class, :class_eval, :class_exec,
    :class_variable_defined?, :class_variable_get, :class_variable_set, :class_variables, :clone,
    :const_defined?, :const_get, :const_missing, :const_set, :constants, :debugger,
    :define_singleton_method, :describe, :display, :dup, :enum_for, :eql?, :equal?, :extend,
    :freeze, :frozen?, :hash, :include?, :included_modules, :initialize_clone, :initialize_dup,
    :inspect, :instance_eval, :instance_exec, :instance_method, :instance_methods, :instance_of?,
    :instance_variable_defined?, :instance_variable_get, :instance_variable_set,
    :instance_variables, :is_a?, :kind_of?, :method, :method_defined?, :methods, :module_eval,
    :module_exec, :name, :new, :nil?, :null_object?, :object_id, :pretty_inspect, :pretty_print,
    :pretty_print_cycle, :pretty_print_inspect, :pretty_print_instance_variables,
    :private_class_method, :private_instance_methods, :private_method_defined?, :private_methods,
    :protected_instance_methods, :protected_method_defined?, :protected_methods,
    :public_class_method, :public_instance_method, :public_instance_methods, :public_method,
    :public_method_defined?, :public_methods, :public_send, :received_message?,
    :remove_class_variable, :respond_to?, :respond_to_missing?, :rspec_reset, :rspec_verify, :send,
    :share_as, :share_examples_for, :shared_examples_for, :should, :should_not, :should_not_receive,
    :should_receive, :singleton_class, :singleton_methods, :stub, :stub!, :stub_chain, :superclass,
    :taint, :tainted?, :tap, :to_enum, :to_s, :trust, :unstub, :unstub!, :untaint, :untrust,
    :untrusted?]
    [:already_tested, :to_yaml]
    .

    Finished in 0.00211 seconds
    1 example, 0 failures

lolwut
