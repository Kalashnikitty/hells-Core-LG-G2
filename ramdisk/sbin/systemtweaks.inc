
# VM-Tweaks

echo "0" > /proc/sys/vm/oom_kill_allocating_task;
echo "0" > /proc/sys/vm/panic_on_oom;
echo "0" > /proc/sys/vm/laptop_mode;
echo "0" > /proc/sys/vm/swappiness;
echo "50" > /proc/sys/vm/vfs_cache_pressure;
echo "90" > /proc/sys/vm/dirty_ratio;
echo "1" > /proc/sys/vm/overcommit_memory;
echo "4" > /proc/sys/vm/min_free_order_shift;
echo "1" > /proc/sys/vm/oom_dump_tasks;
echo "0" > /proc/sys/vm/swappiness
echo "1000" > /proc/sys/vm/dirty_writeback_centisecs;
echo "500" > /proc/sys/vm/dirty_expire_centisecs;
echo "8" > /proc/sys/vm/page-cluster;
echo "3" > /proc/sys/vm/drop_caches

# File-System

echo "10" > /proc/sys/fs/lease-break-time;
echo "32000" > /proc/sys/fs/inotify/max_queued_events;
echo "524288" > /proc/sys/fs/file-max;
echo "256" > /proc/sys/fs/inotify/max_user_instances;
echo "10240" > /proc/sys/fs/inotify/max_user_watches;

# Kernel-Tweaks

echo "1000000" > /proc/sys/kernel/sched_min_granularity_ns;
echo "18000000" > /proc/sys/kernel/sched_latency_ns;
echo "3000000" > /proc/sys/kernel/sched_wakeup_granularity_ns;
echo "0" > /proc/sys/kernel/panic;
echo "1" > /proc/sys/kernel/panic_on_oops;
echo "64000" > /proc/sys/kernel/msgmni;
echo "64000" > /proc/sys/kernel/msgmax;
echo "4096" > /proc/sys/kernel/shmmni;
echo "2097152" > /proc/sys/kernel/shmall;
echo "536870912" > /proc/sys/kernel/shmmax;
echo "524288" > /proc/sys/kernel/threads-max;
echo "500 512000 64 2048" > /proc/sys/kernel/sem;
echo "0" > /proc/sys/kernel/sched_child_runs_first;
