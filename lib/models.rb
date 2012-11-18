class SystemEnviroment
  include Mongoid::Document

  field :os_name
  field :os_version
  field :cpu_arch
  field :vm_name
  field :vm_spec_version
  field :vm_version
  field :boot_class_path
  field :class_path
  field :library_path

  field :created_at, :type => DateTime, :default => lambda{Time.now}
end

class SystemCpuResource
  include Mongoid::Document

  field :available_processors, :type => Integer
  field :system_load_average, :type => Integer
  field :system_cpu_load, :type => Integer
  field :process_cpu_load, :type => Integer

  field :created_at, :type => DateTime, :default => lambda{Time.now}
end 

class SystemMemoryResource
  include Mongoid::Document

  field :total_physical_memory_size, :type => Integer
  field :committed_virtual_memory_size, :type => Integer
  field :free_physical_memory_size, :type => Integer
  field :total_swap_space_size, :type => Integer
  field :free_swap_space_size, :type => Integer

  field :created_at, :type => DateTime, :default => lambda{Time.now}
end 

class AppMemoryResource
  include Mongoid::Document

  field :committedheapsize_count, :type => Integer
  field :committednonheapsize_count, :type => Integer
  field :initheapsize_count, :type => Integer
  field :initnonheapsize_count, :type => Integer
  field :maxheapsize_count, :type => Integer
  field :maxnonheapsize_count, :type => Integer
  field :objectpendingfinalizationcount_count, :type => Integer
  field :usedheapsize_count, :type => Integer
  field :usednonheapsize_count, :type => Integer
end

class AppHttpThreadResource
  include Mongoid::Document

  field :maxthreads, :type => Integer
  field :totalexecutedtasks, :type => Integer
  field :currentthreadsbusy, :type => Integer
  field :currentthreadcount, :type => Integer
  field :corethreads, :type => Integer

  field :created_at, :type => DateTime, :default => lambda{Time.now}
end
