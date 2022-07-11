set ns [new Simulator]
set nr [open thro.tr w]
$ns trace-all $nr
set nf [open thro.nam w]
$ns namtrace-all $nf
for { set i 0 } { $i < 6} { incr i 1 } {
set n($i) [$ns node]}
$ns color 1 Red
$ns color 2 Green
for {set i 0} {$i < 5} {incr i} {
$ns duplex-link $n($i) $n([expr $i+1]) 1Mb 10ms DropTail }
$ns duplex-link $n(2) $n(4) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(5) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(4) 1Mb 10ms DropTail
$ns duplex-link $n(0) $n(5) 1Mb 10ms DropTail
$ns cost $n(0) $n(1) 5
$ns cost $n(5) $n(4) 3
set udp0 [new Agent/UDP]
$ns attach-agent $n(0) $udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0
set null0 [new Agent/Null]
$ns attach-agent $n(3) $null0

$ns connect $udp0 $null0
set udp1 [new Agent/UDP]
$ns attach-agent $n(1) $udp1
set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 200
$cbr1 set interval_ 0.005
$cbr1 attach-agent $udp1
set null0 [new Agent/Null]
$ns attach-agent $n(3) $null0
$ns connect $udp1 $null0
$udp0 set fid_ 1
$udp1 set fid_ 2
$ns rtproto DV 
# use LS instead of DV for Link State protocol
$ns rtmodel-at 2.0 down $n(2) $n(3)
$ns rtmodel-at 2.8 down $n(1) $n(4)
$ns rtmodel-at 3.0 up $n(1) $n(4)
$ns rtmodel-at 3.5 up $n(2) $n(3)
$ns rtmodel-at 4.0 down $n(2) $n(3)
$ns rtmodel-at 4.0 down $n(2) $n(4)
 proc finish { } {
 global ns nr nf
 $ns flush-trace
 close $nf
 close $nr
 exec nam thro.nam &
exit 0
 }
$ns at 1.0 "$cbr0 start"
$ns at 0.5 "$cbr1 start"
$ns at 5 "finish"
$ns run


b.
set ns [new Simulator]
set nr [open thro.tr w]
$ns trace-all $nr

set nf [open thro.nam w]
$ns namtrace-all $nf
 proc finish { } {
 global ns nr nf
 $ns flush-trace
 close $nf
 close $nr
 exec nam thro.nam &
 exit 0
 }
for { set i 0 } { $i < 6} { incr i 1 } {
set n($i) [$ns node]}
for {set i 0} {$i < 5} {incr i} {
$ns duplex-link $n($i) $n([expr $i+1]) 1Mb 10ms DropTail }
$ns duplex-link $n(2) $n(4) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(5) 1Mb 10ms DropTail
$ns duplex-link $n(1) $n(4) 1Mb 10ms DropTail
$ns duplex-link $n(0) $n(5) 1Mb 10ms DropTail
$ns cost $n(0) $n(1) 5
$ns cost $n(5) $n(4) 3
set udp0 [new Agent/UDP]
$ns attach-agent $n(0) $udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0
set null0 [new Agent/Null]
$ns attach-agent $n(3) $null0
$ns connect $udp0 $null0
set udp1 [new Agent/UDP]
$ns attach-agent $n(1) $udp1
set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 200
$cbr1 set interval_ 0.005
$cbr1 attach-agent $udp1
set null0 [new Agent/Null]

$ns attach-agent $n(3) $null0
$ns connect $udp1 $null0
$ns rtproto LS 
$ns rtmodel-at 2.0 down $n(2) $n(3)
$ns rtmodel-at 2.8 down $n(1) $n(4)
$ns rtmodel-at 3.0 up $n(1) $n(4)
$ns rtmodel-at 3.5 up $n(2) $n(3)
$ns rtmodel-at 4.0 down $n(2) $n(3)
$ns rtmodel-at 4.0 down $n(2) $n(4)
$udp0 set fid_ 1
$udp1 set fid_ 2
$ns color 1 Red
$ns color 2 Green
$ns at 1.0 "$cbr0 start"
$ns at 0.5 "$cbr1 start"
$ns at 5 "finish"
$ns run




LAB 6
Simulate a 6 node ethernet LAN network. Change error rate and Data rate, compare the 
throughput. Make node-0 as TCP transmitter, node-1 as UDP transmitter and node-4 
receiver & node-5 as NULL 
• Use ring topology: Connect each node to next node; node-5 to node-0 
• Use bus topology for the tnework shown below 
Use set lan [$ns newLan "$n(3) $n(4) $n(5)" 2Mb 40ms LL Queue/DropTail 
MAC/802_3 Channel] for bus connection 
NOTE: Try for multiple cases of different data and error rates 

set ns [new Simulator]
set nf [open lab6.nam w]
set nt [open lab6.tr w]
$ns namtrace-all $nf
$ns trace-all $nt
$ns color 1 Green
$ns color 2 Red
for { set i 0 } { $i < 6} { incr i 1 } {set n($i) [$ns node]}
$ns duplex-link $n(0) $n(2) 2Mb 4ms DropTail
$ns duplex-link $n(1) $n(2) 2Mb 4ms DropTail
$ns duplex-link $n(2) $n(3) 2Mb 4ms DropTail
set lan [$ns newLan "$n(3) $n(4) $n(5)" 1Mb 40ms LL Queue/DropTail MAC/802_3 Channel]
$ns duplex-link-op $n(0) $n(2) orient right-down
$ns duplex-link-op $n(1) $n(2) orient right-up
$ns duplex-link-op $n(2) $n(3) orient right
$ns queue-limit $n(2) $n(3) 20
$ns duplex-link-op $n(2) $n(3) queuePos 0.5

set err [new ErrorModel]
$err ranvar [new RandomVariable/Uniform]
$err drop-target [new Agent/Null]
$ns lossmodel $err $n(2) $n(3)
set tcp [new Agent/TCP]
$ns attach-agent $n(0) $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n(4) $sink
$ns connect $tcp $sink
set udp [new Agent/UDP]
$ns attach-agent $n(1) $udp
set null [new Agent/Null]
$ns attach-agent $n(5) $null
$ns connect $udp $null
set ftp [new Application/FTP]
$ftp attach-agent $tcp
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$tcp set fid_ 1
$udp set fid_ 2
proc finish {} {
global ns nf nt
$ns flush-trace
close $nf
close $nt
exec nam sim.nam &
set tcpsize [exec sh f1.sh]
set tcpnum [exec sh f2.sh]
set udpsize [exec sh f3.sh]
set udpnum [exec sh f4.sh]
set time_of_exec 124.00
puts "Throughput of TCP is [expr $tcpsize * $tcpnum / $time_of_exec] bytes per sec \n"
puts "Throughput of UDP is [expr $udpsize * $udpnum / $time_of_exec] bytes per sec 
\n"
exit 0

}
$ns at 0.0ms "$ftp start"
$ns at 0.0ms "$cbr start"
$ns at 124ms "finish"
$ns run
f1.sh
grep "^r" lab6.tr|grep tcp|tail -n 1|cut -d " " -f 6
f2.sh
grep "^r" lab6.tr |grep -c "tcp"
f3.sh
grep "^r" lab6.tr|grep "cbr"|tail -n 1| cut -d " " -f 6
f4.sh
grep "^r" lab6.tr |grep -c "cbr"




LAB 7
SIMULATION OF STOP AND WAIT PROTOCOL
set ns [new Simulator]
set nf [open stop.nam w] 
$ns namtrace-all $nf 
set f [open stop.tr w] 
$ns trace-all $f 
set n0 [$ns node] 
set n1 [$ns node] 
$ns at 0.0 "$n0 label Sender" 
$ns at 0.0 "$n1 label Receiver" 
$ns duplex-link $n0 $n1 0.2Mb 200ms DropTail
$ns duplex-link-op $n0 $n1 orient right 
$ns queue-limit $n0 $n1 10 
Agent/TCP set nam_tracevar_ true 
set tcp [new Agent/TCP] 
$tcp set window_ 1 
$tcp set maxcwnd_ 1 
$ns attach-agent $n0 $tcp 
set sink [new Agent/TCPSink] 
$ns attach-agent $n1 $sink 
$ns connect $tcp $sink 
set ftp [new Application/FTP] 
$ftp attach-agent $tcp 
$ns add-agent-trace $tcp tcp 
$ns monitor-agent-trace $tcp 
$tcp tracevar cwnd_ 
$ns at 0.1 "$ftp start" 
$ns at 3.0 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n1 $sink" 
$ns at 3.5 "finish" 
$ns at 0.0 "$ns trace-annotate \"Stop and Wait with normal operation\"" 
$ns at 0.05 "$ns trace-annotate \"FTP starts at 0.1\"" 
$ns at 0.11 "$ns trace-annotate \"Send Packet_0\"" 
$ns at 0.35 "$ns trace-annotate \"Receive Ack_0\""
$ns at 0.56 "$ns trace-annotate \"Send Packet_1\"" 
$ns at 0.79 "$ns trace-annotate \"Receive Ack_1\"" 
$ns at 0.99 "$ns trace-annotate \"Send Packet_2\"" 
$ns at 1.23 "$ns trace-annotate \"Receive Ack_2 \"" 
$ns at 1.43 "$ns trace-annotate \"Send Packet_3\"" 
$ns at 1.67 "$ns trace-annotate \"Receive Ack_3\"" 
$ns at 1.88 "$ns trace-annotate \"Send Packet_4\"" 
$ns at 2.11 "$ns trace-annotate \"Receive Ack_4\"" 
$ns at 2.32 "$ns trace-annotate \"Send Packet_5\"" 
$ns at 2.55 "$ns trace-annotate \"Receive Ack_5 \"" 
$ns at 2.75 "$ns trace-annotate \"Send Packet_6\"" 
$ns at 2.99 "$ns trace-annotate \"Receive Ack_6\"" 
$ns at 3.1 "$ns trace-annotate \"FTP stops\"" 
proc finish {} { 
global ns nf 
$ns flush-trace 
close $nf 
puts "running nam..." 
exec nam stop.nam & 
exit 0 
} 
$ns run