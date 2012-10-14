class Build < ActiveRecord::Base
  RESULT = [:unknown, :ok, :failed]

  include SimpleStates

  states :created, :started, :finished

  event :start,  :to => :started,  :unless => :started?
  event :finish, :to => :finished
  event :all, :after => :notify

  def start(data = {})
    self.started_at = data[:started_at] || Time.zone.now
  end

  def finish(data = {})
    self.result = data[:result].is_a?(Fixnum) ? data[:result] : RESULT.index(data[:result].to_sym)
    self.duration = data[:duration]
    self.finished_at = data[:finished_at] || Time.zone.now
  end

  def pending?
    !finished?
  end

  def passed?
    result == 0
  end

  def failed?
    !passed?
  end

  def notify
    logger.info "SEND EMAIL HERE!!!"
  end

end
