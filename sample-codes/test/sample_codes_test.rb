# サンプルコードの構文チェックおよび実行チェックを行うテストコードです。

require 'pathname'
require 'minitest/autorun'

class SampleCodesTest < Minitest::Test
  CUSTOM_CONSTANTS = %i(UNITS DEFAULT_PRICE SOME_NAMES CURRENCIES COUNTRIES User Product DVD Loggable Second Clock)

  CONFIG = {
    'code_1.06.01.rb' => { run_ignore: [6] },

    'code_2.01.02.rb' => { run_ignore: :all },
    'code_2.02.08.rb' => { syntax_ignore: [29], run_ignore: [7] },
    'code_2.05.01.rb' => { run_ignore: [16..31] },
    'code_2.06.00.rb' => { syntax_ignore: [29..31] },
    'code_2.07.03.rb' => { run_ignore: [1..7] },
    'code_2.10.01.rb' => { run_ignore: [12..15] },
    'code_2.10.02.rb' => { syntax_ignore: [39, 46], run_ignore: [39..58] },
    'code_2.11.01.rb' => { run_ignore: [10, 17] },
    'code_2.11.03.rb' => { syntax_ignore: [22, 27] },
    'code_2.12.04.rb' => { syntax_ignore: [1] },
    'code_2.12.07.rb' => { run_ignore: [2, 10, 14] },
    'code_2.12.08.rb' => { run_ignore: :all },
    'code_2.12.09.rb' => { run_ignore: :all },
    'column_2.02.rb' => { run_ignore: [4, 18] },

    'code_3.02.02.rb' => { run_ignore: :all },
    'code_3.02.04.rb' => { run_ignore: :all },
    'code_3.02.05.rb' => { run_ignore: :all },
    'code_3.03.01.rb' => { run_ignore: [100..105] },
    'code_3.03.02.rb' => { syntax_ignore: [34], run_ignore: [32] },
    'column_3.01.rb' => { run_ignore: :all },
    'column_3.02.rb' => { run_ignore: :all },

    'code_4.01.02.rb' => { run_ignore: :all },
    'code_4.03.04.rb' => { run_ignore: [42] },
    'code_4.05.00.rb' => { run_ignore: [32, 38] },
    'code_4.06.00.rb' => { run_ignore: :all },
    'code_4.06.01.rb' => { run_ignore: [18, 29] },
    'code_4.06.03.rb' => { run_ignore: [1..3, 8, 37] },
    'code_4.07.02.rb' => { run_ignore: [5] },
    'code_4.08.07.rb' => { syntax_ignore: [21] },
    'code_4.09.05.rb' => { run_ignore: [32] },
    'code_4.09.06.rb' => { run_ignore: [1..9] },
    'code_4.10.02.rb' => { run_ignore: [24..34] },
    'code_4.10.03.rb' => { run_ignore: [42..45] },

    'code_5.01.02.rb' => { run_ignore: :all },
    'code_5.03.01.rb' => { run_ignore: [29] },
    'code_5.04.03.rb' => { run_ignore: [36..37, 57, 70] },
    'code_5.05.00.rb' => { run_ignore: :all },
    'code_5.05.01.rb' => { run_ignore: [18] },
    'code_5.05.02.rb' => { run_ignore: [2, 25] },
    'code_5.05.03.rb' => { run_ignore: [2, 22] },
    'code_5.06.02.rb' => { syntax_ignore: [6] },
    'code_5.06.04.rb' => { run_ignore: [6] },
    'code_5.06.05.rb' => { syntax_ignore: [24] },
    'code_5.06.06.rb' => { syntax_ignore: [17] },
    'code_5.06.07.rb' => { run_ignore: [12] },
    'code_5.07.01.rb' => { syntax_ignore: [13..16] },
    'code_5.07.03.rb' => { run_ignore: [5, 39] },

    'code_6.01.02.rb' => { run_ignore: [9] },
    'code_6.04.00.rb' => { run_ignore: [9] },
    'code_6.04.01.rb' => { run_ignore: [2, 20] },
    'code_6.04.02.rb' => { run_ignore: :all },

    'code_7.01.01.rb' => { run_ignore: :all },
    'code_7.02.01.rb' => { run_ignore: [82, 88, 92] },
    'code_7.02.02.rb' => { depends_on: ['code_7.02.01.rb'] },
    'code_7.03.01.rb' => { run_ignore: [1, 16, 26] },
    'code_7.03.03.rb' => { run_ignore: [31..42] },
    'code_7.03.05.rb' => { run_ignore: [40..41] },
    'code_7.04.00.rb' => { run_ignore: :all },
    'code_7.04.01.rb' => { run_ignore: [2] },
    'code_7.04.02.rb' => { syntax_ignore: [34], run_ignore: [31..32] },
    'code_7.04.04.rb' => { syntax_ignore: [25..26] },
    'code_7.05.02.rb' => { run_ignore: [34, 37] },
    'code_7.05.03.rb' => { run_ignore: [27..30] },
    'code_7.06.03.rb' => { depends_on: ['code_7.06.02.rb'], run_ignore: [27..30] },
    'code_7.06.05.rb' => { run_ignore: [67] },
    'code_7.07.02.rb' => { run_ignore: [11, 28] },
    'code_7.07.04.rb' => { run_ignore: [24, 35] },
    'code_7.07.06.rb' => { run_ignore: [21..22] },
    'code_7.07.07.rb' => { run_ignore: [27, 54] },
    'code_7.08.00.rb' => { syntax_ignore: [23], run_ignore: [16] },
    'code_7.08.01.rb' => { run_ignore: [21, 25..30] },
    'code_7.08.02.rb' => { run_ignore: [50, 70] },
    'code_7.10.02.rb' => { run_ignore: [7] },
    'code_7.10.06.rb' => { run_ignore: [35..40] },
    'code_7.10.07.rb' => { run_ignore: [11, 15..24] },
    'code_7.10.09.rb' => { run_ignore: [55, 73] },
    'column_7.04.rb' => { run_ignore: :all },

    'code_8.01.01.rb' => { run_ignore: [15..27] },
    'code_8.02.02.rb' => { syntax_ignore: [11, 14..15] },
    'code_8.03.01.rb' => { run_ignore: [83, 103] },
    'code_8.04.00.rb' => { run_ignore: :all },
    'code_8.04.02.rb' => { run_ignore: [2] },
    'code_8.04.03.rb' => { syntax_ignore: [25], run_ignore: [1, 11, 22..23] },
    'code_8.05.09.rb' => { run_ignore: [10] },
    'code_8.06.01.rb' => { run_ignore: [19..22] },
    'code_8.06.02.rb' => { syntax_ignore: [3..6], run_ignore: :all },
    'code_8.07.02.rb' => { run_ignore: [34] },
    'code_8.09.01.rb' => { run_ignore: [40] },
    'code_8.09.05.rb' => { run_ignore: [13, 36, 41] },
    'column_8.02.rb' => { run_ignore: [35] },
    'column_8.03.rb' => { run_ignore: [19] },
    'column_8.05.rb' => { run_ignore: [31, 33] },

    'code_9.02.01.rb' => { run_ignore: [6, 16] },
    'code_9.02.03.rb' => { run_ignore: [45] },
    'code_9.02.05.rb' => { run_ignore: [12] },
    'code_9.03.00.rb' => { run_ignore: [16, 34, 52, 70, 75..76] },
    'code_9.04.02.rb' => { run_ignore: :all },
    'code_9.04.05.rb' => { run_ignore: [19, 53] },
    'code_9.05.03.rb' => { run_ignore: :all },
    'code_9.05.04.rb' => { run_ignore: :all },
    'code_9.05.05.rb' => { run_ignore: :all },
    'code_9.06.02.rb' => { run_ignore: [11] },
    'code_9.06.08.rb' => { run_ignore: [18] },
    'code_9.06.09.rb' => { run_ignore: [19] },
    'column_9.02.rb' => { run_ignore: [11] },

    'code_10.01.01.rb' => { run_ignore: :all },
    'code_10.02.01.rb' => { run_ignore: [59] },
    'code_10.02.02.rb' => { run_ignore: [95..98] },
    'code_10.03.02.rb' => { run_ignore: [47] },
    'code_10.03.04.rb' => { run_ignore: [57..59] },
    'code_10.04.00.rb' => { run_ignore: [1..15] },
    'code_10.04.03.rb' => { run_ignore: [2, 14..15] },
    'code_10.05.04.rb' => { run_ignore: [34] },

    'code_11.03.06.rb' => { run_ignore: [11] },
    'code_11.03.08.rb' => { syntax_ignore: [2] },
    'code_11.04.03.rb' => { run_ignore: :all },
    'code_11.04.04.rb' => { syntax_ignore: [4..8], run_ignore: :all },
    'code_11.05.05.rb' => { run_ignore: :all },

    'code_12.03.00.rb' => { run_ignore: [10..17, 24] },
    'code_12.04.01.rb' => { run_ignore: :all },
    'code_12.06.00.rb' => { run_ignore: [10..22] },
    'code_12.07.01.rb' => { run_ignore: :all },
    'code_12.08.01.rb' => { run_ignore: :all },
    'code_12.08.02.rb' => { run_ignore: :all },
    'code_12.08.03.rb' => { run_ignore: :all },
    'column_12.01.rb' => { run_ignore: [4] },
    'column_12.02.rb' => { run_ignore: :all },

    'code_A.02.rb' => { syntax_ignore: [5], run_ignore: :all },
    'code_A.08.rb' => { run_ignore: :all },
  }

  def setup
    @results = {}
    @run_scripts = {}
  end

  def teardown
    display_results
    delete_files = ['./sample.txt', './some.txt']
    delete_files.each do |file|
      FileUtils.rm(file) if File.exists?(file)
    end
  end

  def test_sample_codes
    files = Dir.glob("./chapter_*/*.rb") + Dir.glob("./furoku/*.rb")

    files.each do |file|
      pathname = Pathname.new(file)
      basename = pathname.basename.to_s
      @results[basename] = nil
      File.open(file, 'r+:utf-8') do |f|
        script = f.read
        assert_syntax(basename, script)
      end
    end
  end

  private

  def undef_constants
    CUSTOM_CONSTANTS.each do |const|
      if Object.constants.include?(const)
        Object.send(:remove_const, const)
      end
    end
  end

  def undef_monkey_patches
    if String.new.respond_to?(:shuffle)
      String.class_eval { undef_method :shuffle }
    end
  end

  def display_results
    return unless all_success?
    @results.each do |basename, (success, out, err)|
      if out.length > 0 || err.length > 0
        puts '-' * 20
        puts basename
        unless err.empty?
          puts "[STDERR]"
          puts err
        end
        unless out.empty?
          puts "[STDOUT]"
          puts out
        end
      end
    end
  end

  def all_success?
    @results.all? { |_, (success, *_)| success }
  end

  def assert_syntax(basename, script)
    script_to_run = script
    if ranges = CONFIG.dig(basename, :syntax_ignore)
      assert_raises(SyntaxError) do
        RubyVM::InstructionSequence.compile(script)
      end
      script_to_run = comment_out(ranges, script)
      silent_compile(basename, script_to_run)
    else
      silent_compile(basename, script_to_run)
    end
    assert_runnable(basename, script_to_run)
  end

  def assert_runnable(basename, script)
    script_to_run = script
    if ranges = CONFIG.dig(basename, :run_ignore)
      return if ranges == :all
      script_to_run = comment_out(ranges, script_to_run)
    end
    if depending_files = CONFIG.dig(basename, :depends_on)
      script_to_run = [*@run_scripts.values_at(*depending_files), script_to_run].join("\n")
    end
    @run_scripts[basename] = script_to_run
    silent_run(basename) do
      RubyVM::InstructionSequence.compile(script_to_run).eval
    end
    undef_constants
    undef_monkey_patches
  end

  def silent_compile(basename, script)
    silent_run(basename) do
      RubyVM::InstructionSequence.compile(script)
    end
  end

  def silent_run(basename)
    io_out = StringIO.new
    io_err = StringIO.new
    original_stdout = $stdout
    original_stderr = $stderr
    success = true
    begin
      $stdout = io_out
      $stderr = io_err
      yield
    rescue StandardError, LoadError, SyntaxError
      success = false
      raise
    ensure
      $stdout = original_stdout
      $stderr = original_stderr
      err = io_err.string
      # puts err unless err.empty?
      @results[basename] = [success, io_out.string, err]
      unless success
        puts "ERROR: #{basename}"
      end
    end
  end

  def comment_out(ranges, script)
    script.lines.map.with_index(1) {|line, row|
      target = ranges.any?{|obj| ignore?(obj, row)}
      target ? "# #{line}" : line
    }.join
  end

  def ignore?(obj, row)
    case obj
    when Range
      obj.include?(row)
    when Integer
      obj == row
    end
  end
end