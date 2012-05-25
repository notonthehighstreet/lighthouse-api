module Lighthouse
  class Tag < String
    attr_accessor :prefix_options
    def prefix_options
      @prefix_options ||= {}
    end
    attr_accessor :project_id

    def initialize(s, project_id)
      self.project_id = project_id
      super(s)
    end

    def tickets(options = {})
      options[:project_id] ||= project_id
      Ticket.find(:all, :params => options.merge(prefix_options).update(:q => %{tagged:"#{self}"}))
    end
  end
end
