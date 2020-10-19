for f in project_euler_0??
do
  INDEX=${f/project_euler_}
  cd $f
  cargo build
  cp target/debug/pe${INDEX} ..
  cd -
done
