# hard_1_1.rb

class SecretFile
  attr_reader :log

  def initialize(secret_data)
    @data = secret_data
    @log = []
  end

  def data
    @data
    @log << SecurityLogger.new.create_log_entry
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
    "Someone accessed data at #{Time.now}"
  end
end

secret = SecretFile.new('This is a secret')
secret.data
p secret.log
secret2 = SecretFile.new('This is a secret')
secret2.data
secret2.data
secret2.data
p secret2.log





class SecretFile
  attr_reader :logger

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  attr_reader :log

  def initialize
    @log = []
  end

  def create_log_entry
    # ... implementation omitted ...
    @log << "Someone accessed data at #{Time.now}"
  end
end

security_logger = SecurityLogger.new
secret = SecretFile.new('This is a secret', security_logger)
secret.data
p secret.logger.log
