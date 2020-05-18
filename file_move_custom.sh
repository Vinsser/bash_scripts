source_dir=<path-to-source>
target_dir=<path-to-target>
num=0
filno=1

while [ $(ls $source_dir | wc -l) -ne 0 ]
do
        for file in `ls -rt $source_dir` ; do
          mkdir -p $target_dir/tmp-$filno; mv $source_dir/$file $target_dir/tmp-$filno
          echo $file has been moved
          let "num=num+1"
          if [[ $num -eq 1000 ]]; then
                  num=0
                  let "filno=filno+1"
                  break
          fi
        done
done

##Demo run as follows for 'if [[ $num -eq 2 ]];
#$ bash file_move_custom.sh
#first_file has been moved
#second_file has been moved
#third_file has been moved
#fourth_file has been moved
#$ tree -AC ./tes_target/
#./tes_target/
#├── tmp-1
#│   ├── first_file
#│   └── second_file
#└── tmp-2
#    ├── fourth_file
#    └── third_file
#
#2 directories, 4 files
