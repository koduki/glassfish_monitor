require 'jmx4r'
class GlassFishMonitor
    def initialize url, username = nil, password = nil
      con = JMX::MBean.establish_connection :url => url, :username => username, :password => password
    end

    def get_system_enviroments
        os = JMX::MBean.find_by_name "java.lang:type=OperatingSystem"
        runtime = JMX::MBean.find_by_name "java.lang:type=Runtime"
        {
            :os_name => os.name,
            :os_version => os.version,
            :cpu_arch => os.arch,
            :vm_name => runtime.vm_name,
            :vm_spec_version => runtime.spec_version,
            :vm_version => runtime.vm_version,
            :boot_class_path => runtime.boot_class_path,
            :class_path => runtime.class_path,
            :library_path => runtime.library_path
        }
    end

    def get_system_cpu_resources
        os = JMX::MBean.find_by_name "java.lang:type=OperatingSystem"
        {
            :available_processors => os.available_processors,
            :system_load_average => os.system_load_average,
            :system_cpu_load => os.system_cpu_load,
            :process_cpu_load => os.process_cpu_load
        }
    end

    def get_system_memory_resources
        os = JMX::MBean.find_by_name "java.lang:type=OperatingSystem"
        {
            :total_physical_memory_size => os.total_physical_memory_size,
            :committed_virtual_memory_size => os.committed_virtual_memory_size,
            :free_physical_memory_size => os.free_physical_memory_size,
            :total_swap_space_size => os.total_swap_space_size,
            :free_swap_space_size => os.free_swap_space_size
        }
    end

    def get_app_memory_resources
        memory_mon = JMX::MBean.find_by_name "amx:pp=/mon/server-mon[server],type=memory-mon,name=jvm/memory"
        {
            :committedheapsize_count => memory_mon.committedheapsize_count.get("count"),
            :committednonheapsize_count => memory_mon.committednonheapsize_count.get("count"),
            :initheapsize_count => memory_mon.initheapsize_count.get("count"),
            :initnonheapsize_count => memory_mon.initnonheapsize_count.get("count"),
            :maxheapsize_count => memory_mon.maxheapsize_count.get("count"),
            :maxnonheapsize_count => memory_mon.maxnonheapsize_count.get("count"),
            :objectpendingfinalizationcount_count => memory_mon.objectpendingfinalizationcount_count.get("count"),
            :usedheapsize_count => memory_mon.usedheapsize_count.get("count"),
            :usednonheapsize_count => memory_mon.usednonheapsize_count.get("count")
        }
    end

    def get_app_http_thread_resources
        http_mon = JMX::MBean.find_by_name "amx:pp=/mon/server-mon[server],type=thread-pool-mon,name=network/http-listener-1/thread-pool"
        {
            :maxthreads => http_mon.maxthreads.get("count"),
            :totalexecutedtasks => http_mon.totalexecutedtasks.get("count"),
            :currentthreadsbusy => http_mon.currentthreadsbusy.get("count"),
            :currentthreadcount => http_mon.currentthreadcount.get("count"),
            :corethreads => http_mon.corethreads.get("count")
        }
    end
    
end
