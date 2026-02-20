require 'active_support/ordered_options'

module AjaxDatatablesRails

  # configure AjaxDatatablesRails global settings
  #   AjaxDatatablesRails.configure do |config|
  #     config.db_adapter = :pg
  #   end
  def self.configure &block
    yield @config ||= AjaxDatatablesRails::Configuration.new
  end

  # AjaxDatatablesRails global settings
  def self.config
    @config ||= AjaxDatatablesRails::Configuration.new
  end

  class Configuration
    class_attribute :config,
      instance_predicate: false,
      default: ActiveSupport::InheritableOptions.new({
        # default db_adapter is pg (postgresql)
        db_adapter: :pg,
        paginator: :simple_paginator
      })

    singleton_class.delegate :db_adapter, :db_adapter=, :paginator, :paginator=, to: :config
    delegate :db_adapter, :db_adapter=, :paginator, :paginator=, to: :config
  end
end
