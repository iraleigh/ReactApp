function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 11577;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 11577 > /dev/null;
done;

for child in $(list_child_processes 12263);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/iainraleigh/Code/ReactApp/src/Web/bin/Debug/net8.0/2ad2f2203c7c43b89b2c08105b1626d0.sh;
