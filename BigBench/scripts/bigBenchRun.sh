## Remove the previously generated data
if [ -f $BIG_BENCH_BASH_SCRIPT_DIR/output ]
then
	rm -R $BIG_BENCH_BASH_SCRIPT_DIR/output
fi

## Generate the data at local node
$BIG_BENCH_BASH_SCRIPT_DIR/bigBenchLocalDataGen.sh

## Remove the extensions in the output directory
$BIG_BENCH_BASH_SCRIPT_DIR/rename_tables.sh

## Load data onto the cluster
$BIG_BENCH_BASH_SCRIPT_DIR/load_tables.sh

## Populate the hive tables
$BIG_BENCH_HIVE_SCRIPT_DIR/create_load.sh
