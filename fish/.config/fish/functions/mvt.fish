function mvt
  set DIR ~/temp/(date +%Y-%m-%d)
  mkdir -p $DIR
  mv $argv $DIR
  cd $DIR
end
