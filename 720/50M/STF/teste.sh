#!/bin/bash

process_file() {
  input_file=$1
  output_file=$2
  awk -F, 'BEGIN { print "time,id" } 
  NR == 1 { prev_id = $2; offset = 0; print $0 }
  NR > 1 {
    if ($2 < prev_id) { offset += 65536 }
    print $1 "," $2 + offset
    prev_id = $2
  }' $input_file > $output_file
}

tshark -r sender_b51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > enviados_b51080.csv
tshark -r receive_b51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > recebidos_b51080.csv
tshark -r sender_c51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > enviados_c51080.csv
tshark -r receive_c51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > recebidos_c51080.csv
tshark -r sender_d51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > enviados_d51080.csv
tshark -r receive_d51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > recebidos_d51080.csv
tshark -r sender_r51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > enviados_r51080.csv
tshark -r receive_r51080.pcap -E separator=, -Y "rtp.ssrc" -T fields -e frame.time_epoch -e rtp.seq > recebidos_r51080.csv

process_file enviados_b51080.csv enviados_tratado_b51080.csv
process_file recebidos_b51080.csv recebidos_tratado_b51080.csv
process_file enviados_c51080.csv enviados_tratado_c51080.csv
process_file recebidos_c51080.csv recebidos_tratado_c51080.csv
process_file enviados_d51080.csv enviados_tratado_d51080.csv
process_file recebidos_d51080.csv recebidos_tratado_d51080.csv
process_file enviados_r51080.csv enviados_tratado_r51080.csv
process_file recebidos_r51080.csv recebidos_tratado_r51080.csv