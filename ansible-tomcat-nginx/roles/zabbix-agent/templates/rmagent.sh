[Unit]
Description=The te1 script
Requires=network.target
DefaultDependencies=no
Before=shutdown.target reboot.target

[Service]
Type=oneshot
RemainAfterExit=true
ExecStart=/bin/true
ExecStop=/home/ubuntu/remove.sh

[Install]
WantedBy=multi-user.target
