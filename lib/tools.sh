
# 等待直至指定状态
function WaitStatus() {
    for _ in {1..5}
    do
      eval "$1 | grep  \"$2\""
      if [ $? != 0 ]
      then
        eval "$1" || true
        sleep 3
      else
        break
      fi
    done
}