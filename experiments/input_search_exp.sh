#!/bin/bash

export NMODELS=512
export NNODES=20
export ROOT=$NMODELS-model-$NNODES-node-exp


# Initial baseline.
python experiments/input_search.py --max_nodes $NNODES --n_model $NMODELS --max_sample 1 --max_gen_ms 10 --root $ROOT --result result-0.csv

# 7 data points
for i in {1..7}
do
    echo "Running experiment $i"
    python experiments/input_search.py --max_nodes $NNODES --n_model $NMODELS --max_sample 1024 --max_gen_ms $(($i * 10)) --root $ROOT --result result-$i.csv
done
