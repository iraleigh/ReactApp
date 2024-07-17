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

ps 20429;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 20429 > /dev/null;
done;

for child in $(list_child_processes 20430);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/iainraleigh/Code/ReactApp/src/Web/bin/Debug/net8.0/a6553cd03b8a4584bb99af15efee8740.sh;
