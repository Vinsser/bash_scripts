input="./servers"
while IFS=' ' read -r line
do
  read -a strarr <<<"$line"
  echo "Server: ${strarr[0]}"
  echo "Port: ${strarr[1]}"
  echo | openssl s_client -servername "${strarr[0]}" -connect "${strarr[0]}":"${strarr[1]}" 2>/dev/null | openssl x509 -noout -dates
  echo "###"
done < "$input"


###For run create a 'servers' file in the same directory in the following format
#<Servername1> <port_one>
#<Servername1> <port_two>
#<Servername2> <port_one>
#<Servername2> <port_two>
#
#
#Demo
#my.example.com 443
#my.example.com 8080
