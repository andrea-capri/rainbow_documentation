require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

class RainbowWrapper < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self,
                                   :example_group_started,
                                   :example_group_finished,
                                   :example_passed,
                                   :example_pending,
                                   :example_failed

  COLOR = [
    34, #:blue,
    94, #:light_blue,
    36, #:cyan
    96, #:light_cyan
    35, #:magenta
    95, #:light_magenta
    37 #:light_white]
  ].freeze

  def initialize(output)
    super
    @output = output
    @group_level = 0
  end

  def example_group_started(notification)
    @output.puts wrap("#{current_indentation}#{notification.group.description.strip}", @group_level)
    @group_level += 1
  end

  def example_group_finished(_notification)
    @group_level -= 1
  end

  def example_passed(passed)
    @output.puts passed_output(passed.example)
  end

  def example_pending(pending)
    @output.puts pending_output(pending.example, pending.example.execution_result.pending_message)
  end

  def example_failed(failure)
    @output.puts failure_output(failure.example, failure.example.execution_result.exception)
  end

  private

  def passed_output(example)
    RSpec::Core::Formatters::ConsoleCodes.wrap("#{current_indentation} -> #{example.description.strip}",
                                               :success)
  end

  def pending_output(example, message)
    RSpec::Core::Formatters::ConsoleCodes.wrap("#{current_indentation} -> #{example.description.strip} (PENDING: #{message})",
                                               :pending)
  end

  def failure_output(example, _exception)
    RSpec::Core::Formatters::ConsoleCodes.wrap("#{current_indentation} -> #{example.description.strip} " \
                                               "(FAILED - #{next_failure_index})",
                                               :failure)
  end

  def next_failure_index
    @next_failure_index ||= 0
    @next_failure_index += 1
  end

  def current_indentation
    ' ' * @group_level
  end

  def wrap(text, code)
    if RSpec.configuration.color_enabled?
      "\e[#{COLOR[code]}m#{text}\e[0m"
    else
      text
    end
  end
end
