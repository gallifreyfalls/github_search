# frozen_string_literal: true

class ApplicationService
  attr_reader :results, :errors
  private_class_method :new

  def self.call(*args)
    new(*args).call
  end

  def success?
    errors.none?
  end

  def initialize(*args)
    @results = {}
    @errors = {}
  end
end
