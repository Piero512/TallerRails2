# frozen_string_literal: true

class PlanController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action 'planes',
              args: nil,
              return: [:string]

  def planes
    render soap: %w[basico estándar premium]
  end

  def index;end

end
