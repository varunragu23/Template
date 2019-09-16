sudo sysctl -w kern.corefile=/Users/ragunathd/core/core.%N.dump
sudo sysctl -w kern.coredump=1
sudo launchctl limit core unlimited
sudo ulimit -c unlimited
launchctl limit core unlimited
ulimit -c unlimited
