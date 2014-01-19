module Rdb::Taskboard::Columns

  #
  #
  class Status < ::Rdb::Taskboard::Column
    attr_reader :statuses

    def initialize(opts = {})
      super

      @statuses = opts.delete(:statuses) { raise ArgumentError.new 'statuses missing.' }
    end

    def scope(issues)
      issues.where :status_id => statuses.map(&:id)
    end
  end
end