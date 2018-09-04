# Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. 

class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger_record = []
    @logger = logger
  end

  def data
    @logger_record << @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    'hello'
    # ... implementation omitted ...
  end
end

# Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects for this practice problem.

secret = SecretFile.new('rosebud', SecurityLogger.new)
secret.data
secret.data
p secret